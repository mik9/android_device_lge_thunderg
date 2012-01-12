/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "AudioPolicyManager"
//#define LOG_NDEBUG 0
#include <utils/Log.h>
#include "AudioPolicyManager.h"
#include <media/mediarecorder.h>

namespace android {



// ----------------------------------------------------------------------------
// AudioPolicyManager for msm7k platform
// Common audio policy manager code is implemented in AudioPolicyManagerBase class
// ----------------------------------------------------------------------------

// ---  class factory


extern "C" AudioPolicyInterface* createAudioPolicyManager(AudioPolicyClientInterface *clientInterface)
{
    return new AudioPolicyManager(clientInterface);
}

extern "C" void destroyAudioPolicyManager(AudioPolicyInterface *interface)
{
    delete interface;
}

AudioPolicyManager::AudioPolicyManager(AudioPolicyClientInterface *clientInterface)
                : AudioPolicyManagerBase(clientInterface)
{
    mAvailableOutputDevices |= DEVICE_OUT_SPEAKER_IN_CALL;
    mAvailableOutputDevices |= DEVICE_OUT_SPEAKER_RING;  
}

uint32_t AudioPolicyManager::getDeviceForStrategy(routing_strategy strategy, bool fromCache)
{
    uint32_t device = 0;

    if (fromCache) {
        LOGV("getDeviceForStrategy() from cache strategy %d, device %x", strategy, mDeviceForStrategy[strategy]);
        return mDeviceForStrategy[strategy];
    }

    int availableOutputDevices = mAvailableOutputDevices;
    if (availableOutputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADSET) {
        availableOutputDevices |= AudioSystem::DEVICE_OUT_WIRED_HEADPHONE;
    }

    switch (strategy) {
    case STRATEGY_DTMF:
        if (!isInCall()) {
            // when off call, DTMF strategy follows the same rules as MEDIA strategy
            device = getDeviceForStrategy(STRATEGY_MEDIA, false);
            break;
        }
        // when in call, DTMF and PHONE strategies follow the same rules
        // FALL THROUGH

    case STRATEGY_PHONE:
        // for phone strategy, we first consider the forced use and then the available devices by order
        // of priority
        switch (mForceUse[AudioSystem::FOR_COMMUNICATION]) {
        case AudioSystem::FORCE_BT_SCO:
            if (!isInCall() || strategy != STRATEGY_DTMF) {
                device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_CARKIT;
                if (device) break;
            }
            device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_HEADSET;
            if (device) break;
            device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_SCO;
            if (device) break;
            // if SCO device is requested but no SCO device is available, fall back to default case
            // FALL THROUGH

        default:    // FORCE_NONE
            device = availableOutputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADPHONE;
            if (device) break;
            device = availableOutputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADSET;
            if (device) break;
#ifdef WITH_A2DP
            // when not in a phone call, phone strategy should route STREAM_VOICE_CALL to A2DP
            if (!isInCall()) {
                device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP;
                if (device) break;
                device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES;
                if (device) break;
            }
#endif
            device = availableOutputDevices & AudioSystem::DEVICE_OUT_EARPIECE;
            if (device == 0) {
                LOGE("getDeviceForStrategy() earpiece device not found");
            }
            break;

        case AudioSystem::FORCE_SPEAKER:
            if (!isInCall() || strategy != STRATEGY_DTMF) {
                device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_CARKIT;
                if (device) break;
            }
#ifdef WITH_A2DP
            // when not in a phone call, phone strategy should route STREAM_VOICE_CALL to
            // A2DP speaker when forcing to speaker output
            if (!isInCall()) {
                device = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER;
                if (device) break;
            }
#endif
            device = availableOutputDevices & DEVICE_OUT_SPEAKER_IN_CALL;
            if (device) break;

            device = availableOutputDevices & AudioSystem::DEVICE_OUT_SPEAKER;
            if (device == 0) {
                LOGE("getDeviceForStrategy() speaker device not found");
            }
            break;
        }
    break;

    case STRATEGY_SONIFICATION:
    case STRATEGY_MEDIA_SONIFICATION:

        // If incall, just select the STRATEGY_PHONE device: The rest of the behavior is handled by
        // handleIncallSonification().
        if (isInCall()) {
            device = getDeviceForStrategy(STRATEGY_PHONE, false);
            break;
        }
        if (strategy == STRATEGY_SONIFICATION) {
            device = mAvailableOutputDevices & DEVICE_OUT_SPEAKER_RING;
            if (device == 0) {
                LOGE("getDeviceForStrategy() speaker device not found");
            }
        }
        // The second device used for sonification is the same as the device used by media strategy
        // FALL THROUGH

    case STRATEGY_MEDIA: {
#ifdef HAVE_FM_RADIO
        uint32_t device2 = 0;
        if (mForceUse[AudioSystem::FOR_MEDIA] == AudioSystem::FORCE_SPEAKER) {
            device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_SPEAKER;
        }
        if (device2 == 0) {
            device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_AUX_DIGITAL;
        }
#else
        uint32_t device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_AUX_DIGITAL;
#endif
        if (device2 == 0) {
            device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADSET;
        }
        if (device2 == 0) {
            device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADPHONE;
        }
#ifdef WITH_A2DP
        if (mA2dpOutput != 0) {
            if (strategy == STRATEGY_SONIFICATION && !a2dpUsedForSonification()) {
                break;
            }
            if (device2 == 0) {
                device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP;
            }
            if (device2 == 0) {
                device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES;
            }
            if (device2 == 0) {
                device2 = availableOutputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER;
            }
        }
#endif
        if (device2 == 0) {
            device2 = mAvailableOutputDevices & AudioSystem::DEVICE_OUT_SPEAKER;
        }

        // device is DEVICE_OUT_SPEAKER if we come from case STRATEGY_SONIFICATION, 0 otherwise
        device |= device2;
        if (device == 0) {
            LOGE("getDeviceForStrategy() speaker device not found");
        }
        } break;

    default:
        LOGW("getDeviceForStrategy() unknown strategy: %d", strategy);
        break;
    }

    LOGV("getDeviceForStrategy() strategy %d, device %x", strategy, device);
    return device;
}

}; // namespace android
