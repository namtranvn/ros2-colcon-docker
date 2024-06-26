FROM ubuntu:22.04

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update \
 && apt-get install -y git tzdata

RUN apt update && apt install locales -y
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TZ=Asia/Tokyo

RUN apt install software-properties-common -y
RUN add-apt-repository universe

RUN apt update && apt install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update
RUN apt upgrade

RUN apt install ros-humble-desktop -y
RUN apt install ros-dev-tools -y

RUN mkdir -p /ros2_ws

COPY ./src /ros2_ws/src

WORKDIR /ros2_ws

SHELL ["/bin/bash", "-c"]

RUN source /opt/ros/humble/setup.bash && colcon build --symlink-install

CMD ["/bin/bash"]