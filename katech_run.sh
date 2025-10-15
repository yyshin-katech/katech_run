#!/bin/bash

# 공통 경로 설정
MCAR_PATH="/home/ads/mcar_v13"

# 각 명령을 새 터미널에서 실행
echo "ROS 노드들을 실행합니다..."

# 1. katech_ntrip.launch
gnome-terminal --tab --title="NTRIP Launch" -- bash -c "
source ${MCAR_PATH}/devel/setup.bash
roslaunch ${MCAR_PATH}/launch/launch/katech_ntrip.launch"

sleep 2

# 2. katech_test.launch
gnome-terminal --tab --title="Katech Test" -- bash -c "
source ${MCAR_PATH}/devel/setup.bash
roslaunch ${MCAR_PATH}/launch/katech_test.launch"

# 2. katech_test.launch for slope
# gnome-terminal --tab --title="Katech Test" -- bash -c "
# source ${MCAR_PATH}/devel/setup.bash
# roslaunch ${MCAR_PATH}/launch/katech_test.launch use_slope_map:="true""

sleep 2

# 3. diagnostic_only.launch
gnome-terminal --tab --title="Diagnostic" -- bash -c "
source ${MCAR_PATH}/devel/setup.bash
roslaunch ${MCAR_PATH}/launch/diagnostic_only.launch"

sleep 2

# 4. rviz
gnome-terminal --tab --title="RViz" -- bash -c "
source ${MCAR_PATH}/devel/setup.bash
rviz -d ${MCAR_PATH}/workspace_config/ioniq_statdisplay.rviz"

echo "모든 터미널이 실행되었습니다."