#!/bin/bash
set -e

source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/uros_ws/install/setup.bash"

ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/serial/by-id/usb-ZEPHYR_Zephyr_ST_Discovery_4E345008004C0049-if00 