#!/usr/bin/bash -e

export FASTRTPS_DEFAULT_PROFILES_FILE=$SNAP/usr/share/husarion-chatter-shm/config/shm-only.xml

echo "Launching chatter with FASTRTPS_DEFAULT_PROFILES_FILE:"
cat $FASTRTPS_DEFAULT_PROFILES_FILE

echo "=============================="

ros2 run demo_nodes_cpp $1