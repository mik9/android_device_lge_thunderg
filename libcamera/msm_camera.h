/* Copyright (c) 2009, Code Aurora Forum. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#ifndef __LINUX_MSM_CAMERA_H
#define __LINUX_MSM_CAMERA_H

#include <linux/types.h>
#include <asm/sizes.h>
#include <linux/ioctl.h>

#define MSM_CAM_IOCTL_MAGIC 'm'

#define MSM_CAM_IOCTL_GET_SENSOR_INFO \
	_IOR(MSM_CAM_IOCTL_MAGIC, 1, struct msm_camsensor_info *)

#define MSM_CAM_IOCTL_REGISTER_PMEM \
	_IOW(MSM_CAM_IOCTL_MAGIC, 2, struct msm_pmem_info *)

#define MSM_CAM_IOCTL_UNREGISTER_PMEM \
	_IOW(MSM_CAM_IOCTL_MAGIC, 3, unsigned)

#define MSM_CAM_IOCTL_CTRL_COMMAND \
	_IOW(MSM_CAM_IOCTL_MAGIC, 4, struct msm_ctrl_cmd *)

#define MSM_CAM_IOCTL_CONFIG_VFE  \
	_IOW(MSM_CAM_IOCTL_MAGIC, 5, struct msm_camera_vfe_cfg_cmd *)

#define MSM_CAM_IOCTL_GET_STATS \
	_IOR(MSM_CAM_IOCTL_MAGIC, 6, struct msm_camera_stats_event_ctrl *)

#define MSM_CAM_IOCTL_GETFRAME \
	_IOR(MSM_CAM_IOCTL_MAGIC, 7, struct msm_camera_get_frame *)

#define MSM_CAM_IOCTL_ENABLE_VFE \
	_IOW(MSM_CAM_IOCTL_MAGIC, 8, struct camera_enable_cmd *)

#define MSM_CAM_IOCTL_CTRL_CMD_DONE \
	_IOW(MSM_CAM_IOCTL_MAGIC, 9, struct camera_cmd *)

#define MSM_CAM_IOCTL_CONFIG_CMD \
	_IOW(MSM_CAM_IOCTL_MAGIC, 10, struct camera_cmd *)

#define MSM_CAM_IOCTL_DISABLE_VFE \
	_IOW(MSM_CAM_IOCTL_MAGIC, 11, struct camera_enable_cmd *)

#define MSM_CAM_IOCTL_PAD_REG_RESET2 \
	_IOW(MSM_CAM_IOCTL_MAGIC, 12, struct camera_enable_cmd *)

#define MSM_CAM_IOCTL_VFE_APPS_RESET \
	_IOW(MSM_CAM_IOCTL_MAGIC, 13, struct camera_enable_cmd *)

#define MSM_CAM_IOCTL_RELEASE_FRAME_BUFFER \
	_IOW(MSM_CAM_IOCTL_MAGIC, 14, struct camera_enable_cmd *)

#define MSM_CAM_IOCTL_RELEASE_STATS_BUFFER \
	_IOW(MSM_CAM_IOCTL_MAGIC, 15, struct msm_stats_buf *)

#define MSM_CAM_IOCTL_AXI_CONFIG \
	_IOW(MSM_CAM_IOCTL_MAGIC, 16, struct msm_camera_vfe_cfg_cmd *)

#define MSM_CAM_IOCTL_GET_PICTURE \
	_IOW(MSM_CAM_IOCTL_MAGIC, 17, struct msm_camera_ctrl_cmd *)

#define MSM_CAM_IOCTL_SET_CROP \
	_IOW(MSM_CAM_IOCTL_MAGIC, 18, struct crop_info *)

#define MSM_CAM_IOCTL_PICT_PP \
	_IOW(MSM_CAM_IOCTL_MAGIC, 19, uint8_t *)

#define MSM_CAM_IOCTL_PICT_PP_DONE \
	_IOW(MSM_CAM_IOCTL_MAGIC, 20, struct msm_snapshot_pp_status *)

#define MSM_CAM_IOCTL_SENSOR_IO_CFG \
	_IOW(MSM_CAM_IOCTL_MAGIC, 21, struct sensor_cfg_data *)

#define MSM_CAMERA_LED_OFF  0
#define MSM_CAMERA_LED_LOW  1
#define MSM_CAMERA_LED_HIGH 2

#define MSM_CAM_IOCTL_FLASH_LED_CFG \
	_IOW(MSM_CAM_IOCTL_MAGIC, 22, unsigned *)

#define MSM_CAM_IOCTL_UNBLOCK_POLL_FRAME \
	_IO(MSM_CAM_IOCTL_MAGIC, 23)

#define MSM_CAM_IOCTL_CTRL_COMMAND_2 \
	_IOW(MSM_CAM_IOCTL_MAGIC, 24, struct msm_ctrl_cmd *)

#define MSM_CAM_IOCTL_AF_CTRL \
	_IOR(MSM_CAM_IOCTL_MAGIC, 25, struct msm_ctrl_cmt_t *)
#define MSM_CAM_IOCTL_AF_CTRL_DONE \
	_IOW(MSM_CAM_IOCTL_MAGIC, 26, struct msm_ctrl_cmt_t *)

#if defined(CONFIG_MT9T111) || defined(CONFIG_ISX005)
#define MSM_CAMERA_AF_NORMAL	0
#define MSM_CAMERA_AF_MACRO		1
#define MSM_CAMERA_AF_AUTO		2
	
struct msm_af_cfg_cmd {
	int cmd_type;
	int mode;
};
	
#define MSM_CAM_IOCTL_YUV_AF_CTRL_PARAM_INIT	_IOR(MSM_CAM_IOCTL_MAGIC, 27, struct msm_ctrl_cmt_t *)
#define MSM_CAM_IOCTL_YUV_AF_CTRL_CONFIG_START	_IOW(MSM_CAM_IOCTL_MAGIC, 28, struct msm_ctrl_cmt_t *)
#define MSM_CAM_IOCTL_YUV_AF_CTRL_GET_FRAME		_IOW(MSM_CAM_IOCTL_MAGIC, 29, struct msm_ctrl_cmt_t *)
#define MSM_CAM_IOCTL_YUV_AF_CTRL_GET_STATUS	_IOW(MSM_CAM_IOCTL_MAGIC, 30, struct msm_ctrl_cmt_t *)
#endif

#if defined (CONFIG_MT9T111)
#define MSM_CAM_IOCTL_ISO_CTRL_SET				_IOW(MSM_CAM_IOCTL_MAGIC, 31, struct msm_ctrl_cmt_t *)
#define MSM_CAM_IOCTL_SCNEMODE_CTRL_SET			_IOW(MSM_CAM_IOCTL_MAGIC, 32, struct msm_ctrl_cmt_t *)
#define MSM_CAM_IOCTL_SENSOR_ALWAYS_ON_TEST		_IOW(MSM_CAM_IOCTL_MAGIC, 33, uint32_t *)
#endif

#define MAX_SENSOR_NUM  3
#define MAX_SENSOR_NAME 32

#define PP_SNAP  0x01
#define PP_RAW_SNAP ((0x01)<<1)
#define PP_PREV  ((0x01)<<2)
#define PP_MASK		(PP_SNAP|PP_RAW_SNAP|PP_PREV)

#define MSM_CAM_CTRL_CMD_DONE  0
#define MSM_CAM_SENSOR_VFE_CMD 1

/*****************************************************
 *  structure
 *****************************************************/

/* define five type of structures for userspace <==> kernel
 * space communication:
 * command 1 - 2 are from userspace ==> kernel
 * command 3 - 4 are from kernel ==> userspace
 *
 * 1. control command: control command(from control thread),
 *                     control status (from config thread);
 */
struct msm_ctrl_cmd {
	uint16_t type;
	uint16_t length;
	void *value;
	uint16_t status;
	uint32_t timeout_ms;
	int resp_fd; /* FIXME: to be used by the kernel, pass-through for now */
};

#if defined (CONFIG_MT9T111) || defined (CONFIG_ISX005)
#define YUV_AF_MODE_LOCKED			1
#define YUV_AF_MODE_UNLOCKED		2
#define YUV_AF_MODE_LOCKED_FAILED	0xff
#define YUV_AF_MODE_INIT			4
#endif

struct msm_vfe_evt_msg {
	unsigned short type;	/* 1 == event (RPC), 0 == message (adsp) */
	unsigned short msg_id;
#if defined(CONFIG_MT9T111) || defined (CONFIG_ISX005)
	int af_mode_locked;
#endif
	unsigned int len;	/* size in, number of bytes out */
	void *data;
};

#define MSM_CAM_RESP_CTRL         0
#define MSM_CAM_RESP_STAT_EVT_MSG 1
#define MSM_CAM_RESP_V4L2         2
#define MSM_CAM_RESP_MAX          3

/* this one is used to send ctrl/status up to config thread */
struct msm_stats_event_ctrl {
	/* 0 - ctrl_cmd from control thread,
	 * 1 - stats/event kernel,
	 * 2 - V4L control or read request */
	int resptype;
	int timeout_ms;
	struct msm_ctrl_cmd ctrl_cmd;
	/* struct  vfe_event_t  stats_event; */
	struct msm_vfe_evt_msg stats_event;
};

/* 2. config command: config command(from config thread); */
struct msm_camera_cfg_cmd {
	/* what to config:
	 * 1 - sensor config, 2 - vfe config */
	uint16_t cfg_type;

	/* sensor config type */
	uint16_t cmd_type;
	uint16_t queue;
	uint16_t length;
	void *value;
};

#define CMD_GENERAL			0
#define CMD_AXI_CFG_OUT1		1
#define CMD_AXI_CFG_SNAP_O1_AND_O2	2
#define CMD_AXI_CFG_OUT2		3
#define CMD_PICT_T_AXI_CFG		4
#define CMD_PICT_M_AXI_CFG		5
#define CMD_RAW_PICT_AXI_CFG		6

#define CMD_FRAME_BUF_RELEASE		7
#define CMD_PREV_BUF_CFG		8
#define CMD_SNAP_BUF_RELEASE		9
#define CMD_SNAP_BUF_CFG		10
#define CMD_STATS_DISABLE		11
#define CMD_STATS_AEC_AWB_ENABLE	12
#define CMD_STATS_AF_ENABLE		13
#define CMD_STATS_AEC_ENABLE		14
#define CMD_STATS_AWB_ENABLE		15
#define CMD_STATS_ENABLE  		16

#define CMD_STATS_AXI_CFG		17
#define CMD_STATS_AEC_AXI_CFG		18
#define CMD_STATS_AF_AXI_CFG 		19
#define CMD_STATS_AWB_AXI_CFG		20
#define CMD_STATS_RS_AXI_CFG		21
#define CMD_STATS_CS_AXI_CFG		22
#define CMD_STATS_IHIST_AXI_CFG		23
#define CMD_STATS_SKIN_AXI_CFG		24

#define CMD_STATS_BUF_RELEASE		25
#define CMD_STATS_AEC_BUF_RELEASE	26
#define CMD_STATS_AF_BUF_RELEASE	27
#define CMD_STATS_AWB_BUF_RELEASE	28
#define CMD_STATS_RS_BUF_RELEASE	29
#define CMD_STATS_CS_BUF_RELEASE	30
#define CMD_STATS_IHIST_BUF_RELEASE	31
#define CMD_STATS_SKIN_BUF_RELEASE	32

#define UPDATE_STATS_INVALID		33
#define CMD_AXI_CFG_SNAP_GEMINI		34
#define CMD_AXI_CFG_SNAP		35
#define CMD_AXI_CFG_PREVIEW		36
#define CMD_AXI_CFG_VIDEO		37

#define CMD_STATS_IHIST_ENABLE 38
#define CMD_STATS_RS_ENABLE 39
#define CMD_STATS_CS_ENABLE 40

/* vfe config command: config command(from config thread)*/
struct msm_vfe_cfg_cmd {
	int cmd_type;
	uint16_t length;
	void *value;
};

#define MAX_CAMERA_ENABLE_NAME_LEN 32
struct camera_enable_cmd {
	char name[MAX_CAMERA_ENABLE_NAME_LEN];
};

#define MSM_PMEM_OUTPUT1		0
#define MSM_PMEM_OUTPUT2		1
#define MSM_PMEM_OUTPUT1_OUTPUT2	2
#define MSM_PMEM_THUMBNAIL		3
#define MSM_PMEM_MAINIMG		4
#define MSM_PMEM_RAW_MAINIMG		5
#define MSM_PMEM_AEC_AWB		6
#define MSM_PMEM_AF			7
#define MSM_PMEM_AEC			8
#define MSM_PMEM_AWB			9
#define MSM_PMEM_RS		    	10
#define MSM_PMEM_CS	    		11
#define MSM_PMEM_IHIST			12
#define MSM_PMEM_SKIN			13
#define MSM_PMEM_VIDEO			14
#define MSM_PMEM_PREVIEW		15
#define MSM_PMEM_MAX			16


#define STAT_AEAW			0
#define STAT_AEC			1
#define STAT_AF				2
#define STAT_AWB			3
#define STAT_RS				4
#define STAT_CS				5
#define STAT_IHIST			6
#define STAT_SKIN			7
#define STAT_MAX			8

#define FRAME_PREVIEW_OUTPUT1		0
#define FRAME_PREVIEW_OUTPUT2		1
#define FRAME_SNAPSHOT			2
#define FRAME_THUMBNAIL			3
#define FRAME_RAW_SNAPSHOT		4
#define FRAME_MAX			5

struct msm_pmem_info {
	int type;
	int fd;
	void *vaddr;
	uint32_t offset;
	uint32_t len;
	uint32_t y_off;
	uint32_t cbcr_off;
	uint8_t active;
};

struct outputCfg {
	uint32_t height;
	uint32_t width;

	uint32_t window_height_firstline;
	uint32_t window_height_lastline;
};

#define OUTPUT_1	0
#define OUTPUT_2	1
#define OUTPUT_1_AND_2            2   /* snapshot only */
#define OUTPUT_1_AND_3            3   /* video */
#define CAMIF_TO_AXI_VIA_OUTPUT_2 4
#define OUTPUT_1_AND_CAMIF_TO_AXI_VIA_OUTPUT_2 5
#define OUTPUT_2_AND_CAMIF_TO_AXI_VIA_OUTPUT_1 6
#define LAST_AXI_OUTPUT_MODE_ENUM = OUTPUT_2_AND_CAMIF_TO_AXI_VIA_OUTPUT_1 7

#define MSM_FRAME_PREV_1	0
#define MSM_FRAME_PREV_2	1
#define MSM_FRAME_ENC		2

#define OUTPUT_TYPE_P		1
#define OUTPUT_TYPE_T		2
#define OUTPUT_TYPE_S		3
#define OUTPUT_TYPE_V		4

struct msm_frame {
	int path;
	unsigned long buffer;
	uint32_t y_off;
	uint32_t cbcr_off;
	int fd;

	void *cropinfo;
	int croplen;
};

struct msm_stats_buf {
	int type;
	unsigned long buffer;
	int fd;
};

#define MSM_V4L2_VID_CAP_TYPE	0
#define MSM_V4L2_STREAM_ON	1
#define MSM_V4L2_STREAM_OFF	2
#define MSM_V4L2_SNAPSHOT	3
#define MSM_V4L2_QUERY_CTRL	4
#define MSM_V4L2_GET_CTRL	5
#define MSM_V4L2_SET_CTRL	6
#define MSM_V4L2_QUERY		7
#define MSM_V4L2_GET_CROP	8
#define MSM_V4L2_SET_CROP	9
#define MSM_V4L2_MAX		10

#define V4L2_CAMERA_EXIT 	43
struct crop_info {
	void *info;
	int len;
};

struct msm_postproc {
	int ftnum;
	struct msm_frame fthumnail;
	int fmnum;
	struct msm_frame fmain;
};

struct msm_snapshot_pp_status {
	void *status;
};

#define CFG_SET_MODE			0
#define CFG_SET_EFFECT			1
#define CFG_START			2
#define CFG_PWR_UP			3
#define CFG_PWR_DOWN			4
#define CFG_WRITE_EXPOSURE_GAIN		5
#define CFG_SET_DEFAULT_FOCUS		6
#define CFG_MOVE_FOCUS			7
#define CFG_REGISTER_TO_REAL_GAIN	8
#define CFG_REAL_TO_REGISTER_GAIN	9
#define CFG_SET_FPS			10
#define CFG_SET_PICT_FPS		11
#define CFG_SET_BRIGHTNESS		12
#define CFG_SET_CONTRAST		13
#define CFG_SET_ZOOM			14
#define CFG_SET_EXPOSURE_MODE		15
#define CFG_SET_WB			16
#define CFG_SET_ANTIBANDING		17
#define CFG_SET_EXP_GAIN		18
#define CFG_SET_PICT_EXP_GAIN		19
#define CFG_SET_LENS_SHADING		20
#define CFG_GET_PICT_FPS		21
#define CFG_GET_PREV_L_PF		22
#define CFG_GET_PREV_P_PL		23
#define CFG_GET_PICT_L_PF		24
#define CFG_GET_PICT_P_PL		25
#define CFG_GET_AF_MAX_STEPS		26
#define CFG_GET_PICT_MAX_EXP_LC		27
#define CFG_SEND_WB_INFO    28
#if 0
#if defined (CONFIG_MT9T111)
#define CFG_SET_AF_PARAM_INIT	128
#define CFG_SET_AF_START		129
#define CFG_GET_AF_STATUS		130
#define CFG_SET_ISO				131
#define CFG_SET_SCENEMODE		132
#define CFG_MAX					133
#elif defined (CONFIG_ISX005)
#define CFG_SET_AF_PARAM_INIT	128
#define CFG_SET_AF_START		129
#define CFG_GET_AF_STATUS		130
#define CFG_MAX					131
#else	/* origin */
#define CFG_MAX					29
#endif

#define MOVE_NEAR	0
#define MOVE_FAR	1

#define SENSOR_PREVIEW_MODE		0
#define SENSOR_SNAPSHOT_MODE		1
#define SENSOR_RAW_SNAPSHOT_MODE	2

#define SENSOR_QTR_SIZE			0
#define SENSOR_FULL_SIZE		1
#define SENSOR_INVALID_SIZE		2

#define CAMERA_EFFECT_OFF		0
#define CAMERA_EFFECT_MONO		1
#define CAMERA_EFFECT_NEGATIVE		2
#define CAMERA_EFFECT_SOLARIZE		3
#define CAMERA_EFFECT_SEPIA		4
#define CAMERA_EFFECT_POSTERIZE		5
#define CAMERA_EFFECT_WHITEBOARD	6
#define CAMERA_EFFECT_BLACKBOARD	7
#define CAMERA_EFFECT_AQUA		8
#define CAMERA_EFFECT_MAX		9
#else
#define CFG_SET_ISO 28
#define CFG_SET_SCENE_MODE 29
#define CFG_SET_EXPOSURE_VALUE 30
#define CFG_MAX					31


#define CFG_SET_IMG_QUALITY 32
#define CFG_SET_FLICKER 33
#define CFG_SET_RECORDING_MODE 34

#define CFG_SET_CANCEL_FOCUS 35

#define CFG_SET_PARM_AF_MODE 36

#define CFG_JPEG_QUALITY 37

#define CFG_SET_ZOOM_VIDEO 38
#endif

#define MOVE_NEAR	0
#define MOVE_FAR	1

#define SENSOR_PREVIEW_MODE		0
#define SENSOR_SNAPSHOT_MODE		1
#define SENSOR_RAW_SNAPSHOT_MODE	2

/*
#define SENSOR_QTR_SIZE			0
#define SENSOR_FULL_SIZE		1
#define SENSOR_INVALID_SIZE		2

#define CAMERA_EFFECT_OFF		0
#define CAMERA_EFFECT_MONO		1
#define CAMERA_EFFECT_NEGATIVE		2
#define CAMERA_EFFECT_SOLARIZE		3
#define CAMERA_EFFECT_SEPIA		4
#define CAMERA_EFFECT_POSTERIZE		5
#define CAMERA_EFFECT_WHITEBOARD	6
#define CAMERA_EFFECT_BLACKBOARD	7
#define CAMERA_EFFECT_AQUA		8
#define CAMERA_EFFECT_MAX		9
#define	 CAMERA_EFFECT_PASTEL 10
#define	 CAMERA_EFFECT_NEGATIVE_SEPIA 11
#define	 CAMERA_EFFECT_BLUE 12
*/
#define CAMERA_EFFECT_OFF 0
#define CAMERA_EFFECT_MONO 1
#define CAMERA_EFFECT_SEPIA 2
#define CAMERA_EFFECT_NEGATIVE 3
#define CAMERA_EFFECT_NEGATIVE_SEPIA 4
#define CAMERA_EFFECT_BLUE 5
#define CAMERA_EFFECT_SOLARIZE 6
#define CAMERA_EFFECT_PASTEL 7
#define CAMERA_EFFECT_POSTERIZE 8
#define CAMERA_EFFECT_WHITEBOARD 9
#define CAMERA_EFFECT_BLACKBOARD 10
#define CAMERA_EFFECT_AQUA 11
#define CAMERA_EFFECT_MAX 12

#if defined (CONFIG_ISX005) || defined (CONFIG_ISX006)
#define	 CAMERA_WB_MIN 0 
#define	 CAMERA_WB_AUTO 1
#define	 CAMERA_WB_INCANDESCENT 2
#define	 CAMERA_WB_SUNNY 3
#define	 CAMERA_WB_FLUORESCENT 4 
#define	 CAMERA_WB_CLOUDY 5
#define	 CAMERA_WB_CUSTOM 6
#define	 CAMERA_WB_DAYLIGHT 7
#define	 CAMERA_WB_CLOUDY_DAYLIGHT 8 
#define	 CAMERA_WB_TWILIGHT 9
#define	 CAMERA_WB_SHADE 10
#define	 CAMERA_WB_MAX 11

// change to match to QHAL side (bionic\...\msm_camera.h)
/* 
#define	CAMERA_ISO_AUTO 0 
#define	CAMERA_ISO_100 2
#define	CAMERA_ISO_200 3
#define	CAMERA_ISO_400 4
#define	CAMERA_ISO_800 5
#define	CAMERA_ISO_DEBLUR 1
#define	CAMERA_ISO_MAX 6
*/
#define	CAMERA_ISO_AUTO 0 
#define	CAMERA_ISO_100 1 
#define	CAMERA_ISO_200 2
#define	CAMERA_ISO_400 3
#define	CAMERA_ISO_800 4
#define	CAMERA_ISO_DEBLUR 5
#define	CAMERA_ISO_MAX 6

#define	CAMERA_SCENE_NORMAL 0
#define	CAMERA_SCENE_PORTRAIT 1
#define	CAMERA_SCENE_LANDSCAPE 2
#define	CAMERA_SCENE_SPORT 3
#define	CAMERA_SCENE_SUNSET 4
#define	CAMERA_SCENE_NIGHT 5
#define	CAMERA_SCENE_BACKLIGHT 6
#define	CAMERA_SCENE_NIGHT_PORTRAIT 7
#define	CAMERA_SCENE_BEACH 8
#define	CAMERA_SCENE_PARTY 9
#define	CAMERA_SCENE_MAX 10

#define	SENSOR_QTR_SIZE 0
#define	SENSOR_FULL_SIZE 1
#define	SENSOR_QVGA_SIZE 2
#define	SENSOR_VGA_SIZE 3
#define	SENSOR_QUADVGA_SIZE 4
#define	SENSOR_UXGA_SIZE 5
#define	SENSOR_QXGA_SIZE 6
#define	SENSOR_INVALID_SIZE 7

#define AUTO_FOCUS  0
#define MACRO_FOCUS 1
#endif

struct sensor_pict_fps {
	uint16_t prevfps;
	uint16_t pictfps;
};

struct exp_gain_cfg {
	uint16_t gain;
	uint32_t line;
};

struct focus_cfg {
	int32_t steps;
	int dir;
	int mode;
};

struct fps_cfg {
	uint16_t f_mult;
	uint16_t fps_div;
	uint32_t pict_fps_div;
};
struct wb_info_cfg {
	uint16_t red_gain;
	uint16_t green_gain;
	uint16_t blue_gain;
};
struct sensor_cfg_data {
	int cfgtype;
	int mode;
	int rs;
	int width;
	int height;
	uint8_t max_steps;

	union {
		int8_t effect;
#if defined (CONFIG_MT9T111)
		int8_t wb;
		int8_t brightness;
		int8_t iso;
		int8_t scenemode;
#endif
		uint8_t lens_shading;
		uint16_t prevl_pf;
		uint16_t prevp_pl;
		uint16_t pictl_pf;
		uint16_t pictp_pl;
		uint32_t pict_max_exp_lc;
		uint16_t p_fps;
		struct sensor_pict_fps gfps;
		struct exp_gain_cfg exp_gain;
		struct focus_cfg focus;
		struct fps_cfg fps;
		struct wb_info_cfg wb_info;
    int8_t wb;
    int8_t iso;
    int8_t scene_mode;
    int8_t ev;

    int8_t zoom; 
	} cfg;
};

#if defined (CONFIG_MT9T111)
// 2010.01.04 cis implementation whitebalance
#define CAMERA_YUV_WB_AUTO						1
#define CAMERA_YUV_WB_INCANDESCENT			2
#define CAMERA_YUV_WB_DAYLIGHT				3
#define CAMERA_YUV_WB_FLUORESCENT			4
#define CAMERA_YUV_WB_CLOUDY_DAYLIGHT		5

//LG_FW : 2010.01.08 cis - use to camera brightness, iso
#define CAMERA_YUV_ISO_AUTO		1
#define CAMERA_YUV_ISO_800			2
#define CAMERA_YUV_ISO_400			3
#define CAMERA_YUV_ISO_200			4
#define CAMERA_YUV_ISO_100			5

//LG_FW : 2010.01.12 cis - use to camera scenemode
#define CAMERA_SCENEMODE_AUTO 				1
#define CAMERA_SCENEMODES_PORTRAIT 			2
#define CAMERA_SCENEMODES_LANDSCAPE 		3
#define CAMERA_SCENEMODES_SPORTS 			4
#define CAMERA_SCENEMODES_NIGHT 				5
#define CAMERA_SCENEMODES_SUNSET 			6
#endif

#define GET_NAME			0
#define GET_PREVIEW_LINE_PER_FRAME	1
#define GET_PREVIEW_PIXELS_PER_LINE	2
#define GET_SNAPSHOT_LINE_PER_FRAME	3
#define GET_SNAPSHOT_PIXELS_PER_LINE	4
#define GET_SNAPSHOT_FPS		5
#define GET_SNAPSHOT_MAX_EP_LINE_CNT	6

struct msm_camsensor_info {
	char name[MAX_SENSOR_NAME];
	uint8_t flash_enabled;
	int8_t total_steps;
};
#endif /* __LINUX_MSM_CAMERA_H */
