#!/bin/bash
set -e

source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/uros_ws/install/setup.bash"

DEV=/dev/serial/by-id/usb-ZEPHYR_Zephyr_ST_Discovery_4E345008004C0049-if00 

while true; do
    while [ ! -e "$DEV" ]; do
        sleep 1
        echo "Waiting for device"
    done

    echo "Serial detected. Running agent."

    ros2 run micro_ros_agent micro_ros_agent serial --dev $DEV -v6 &
    export APP_PID=$!

    while [ -e "$DEV" ]; do
        sleep 1
    done

    echo "Serial disconnected. Running agent."

    kill -9 $APP_PID
done

