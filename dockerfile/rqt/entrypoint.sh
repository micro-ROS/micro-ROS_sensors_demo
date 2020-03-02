#!/bin/bash
set -e

source "/opt/ros/$ROS_DISTRO/setup.bash"

exec rqt --perspective-file /src/default.perspective