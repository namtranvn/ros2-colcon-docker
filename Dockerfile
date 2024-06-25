FROM ros:humble-ros-base-jammy

RUN mkdir -p /ros2_ws

COPY ./src /ros2_ws/src

WORKDIR /ros2_ws

RUN colcon build --symlink-install

CMD ["/bin/bash"]
