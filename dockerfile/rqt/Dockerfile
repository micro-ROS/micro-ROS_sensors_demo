FROM ros:foxy

RUN apt update \
&& DEBIAN_FRONTEND=noninteractive apt install -y ros-foxy-desktop \ 
&& rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./src ./src

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
