#!/bin/bash

# 공통 경로 설정
MCAR_PATH="/home/ads/mcar_v13"
source ${MCAR_PATH}/devel/setup.bash

echo "ROS 노드들을 종료합니다..."

# ROS 노드들 종료
echo "1. ROS 노드 종료 중..."
# rosnode kill -a 2>/dev/null

sleep 1

# roslaunch 프로세스들 종료
echo "2. roslaunch 프로세스 종료 중..."
pkill -f "roslaunch.*katech_ntrip"
pkill -f "roslaunch.*katech_test"
pkill -f "roslaunch.*diagnostic_only"

sleep 1

# rviz 프로세스 종료
echo "3. RViz 프로세스 종료 중..."
pkill -f "rviz.*ioniq_statdisplay"
killall rviz 2>/dev/null

sleep 1

echo "모든 프로세스가 종료되었습니다."