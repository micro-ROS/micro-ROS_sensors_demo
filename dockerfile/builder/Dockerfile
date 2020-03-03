# TODO: remove when feature/mempools_refactor is merged.
FROM ros:dashing
RUN mkdir -p uros_ws
WORKDIR uros_ws
RUN git clone --depth 1 -b feature/generic_build https://github.com/micro-ROS/micro-ros-build.git src/micro-ros-build \
&&  . /opt/ros/$ROS_DISTRO/setup.sh \
&&  apt update \
&&  rosdep update \
&&  rosdep install --from-paths src --ignore-src -y \
&&  colcon build \
&&  rm -rf log/ build/ src/* \
&&  rm -rf /var/lib/apt/list/*

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  . ./install/setup.sh \
&&  apt update \
&&  ros2 run micro_ros_setup create_firmware_ws.sh zephyr discovery_l475_iot1 \
&&  rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]