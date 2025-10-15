#!/bin/bash

# SSH 접속 정보
SSH_USER="katech"
SSH_HOST="192.168.1.102"
SSH_PASS="1"

echo "원격 ROS 노드들을 실행합니다..."

# 1. roscore 실행
gnome-terminal --tab --title="Remote Roscore" -- bash -c "
sshpass -p '${SSH_PASS}' ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} 'roscore'
exec bash"

sleep 3

# 2. katech_run.sh 실행
gnome-terminal --tab --title="Remote Katech Run" -- bash -c "
sshpass -p '${SSH_PASS}' ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} './katech_run.sh'
exec bash"

echo "모든 원격 터미널이 실행되었습니다."