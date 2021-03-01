FROM ros:foxy

RUN apt update \
&&  apt install -y ros-dashing-desktop \
&&  rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./src ./src

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
