#!/system/bin/sh

echo 0 > /sys/module/lge_handle_panic/parameters/on_hidden_reset
echo 0 0 > /sys/class/graphics/fb0/pan
