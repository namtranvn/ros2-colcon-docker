# Git
```
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/namtranvn/ros2-colcon-docker.git
git push -u origin main
```


# ROS2 Colcon
```
colcon build --symlink-install
colcon test
source /opt/ros/humble/setup.bash
source install/setup.bash
ros2 run examples_rclcpp_minimal_subscriber subscriber_member_function
ros2 run examples_rclcpp_minimal_publisher publisher_member_function
```