#!/bin/bash

# 공통 경로 설정
MCAR_PATH="/home/ads/mcar_v13"

# 각 명령을 새 터미널에서 실행
echo "ROS 노드들을 실행합니다..."

# 1. katech_ntrip.launch
gnome-terminal --title="NTRIP Launch" -- bash -c "
source /opt/ros/noetic/setup.bash
roslaunch ${MCAR_PATH}/launch/launch/katech_ntrip.launch
exec bash"

sleep 2

# 2. katech_test.launch
gnome-terminal --title="Katech Test" -- bash -c "
source /opt/ros/noetic/setup.bash
roslaunch ${MCAR_PATH}/launch/katech_test.launch
exec bash"

# 2. katech_test.launch for slope
# gnome-terminal --title="Katech Test" -- bash -c "
# source /opt/ros/noetic/setup.bash
# roslaunch ${MCAR_PATH}/launch/katech_test.launch use_slope_map:="true"
# exec bash"

sleep 2

# 3. diagnostic_only.launch
gnome-terminal --title="Diagnostic" -- bash -c "
source /opt/ros/noetic/setup.bash
roslaunch ${MCAR_PATH}/launch/diagnostic_only.launch
exec bash"

sleep 2

# 4. rviz
gnome-terminal --title="RViz" -- bash -c "
source /opt/ros/noetic/setup.bash
rviz -d ${MCAR_PATH}/workspace_config/ioniq_statdisplay.rviz
exec bash"

echo "모든 터미널이 실행되었습니다."