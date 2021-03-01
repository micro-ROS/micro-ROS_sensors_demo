FROM microros/base:foxy

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  . ./install/setup.sh \
&&  apt update \
&&  ros2 run micro_ros_setup create_firmware_ws.sh zephyr discovery_l475_iot1 \
&&  rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
