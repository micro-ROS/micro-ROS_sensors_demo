#!/bin/bash
set -e

source "/opt/ros/$ROS_DISTRO/setup.bash"

while true; do 
    if ros2 topic list | grep "sensors/imu" > /dev/null; then 
        break
    fi
done

exec rqt --perspective-file /src/demo_sensors.perspective