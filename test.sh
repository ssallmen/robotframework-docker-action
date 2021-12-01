# Create reports folder
REPORTS_DIR=$(pwd)/$ROBOT_REPORTS_DIR
TESTS_DIR=$(pwd)/$ROBOT_VOLUME_DIR
sudo mkdir $REPORTS_DIR && sudo chmod 777 $REPORTS_DIR

docker run --shm-size=$ALLOWED_SHARED_MEMORY \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -e ROBOT_TESTS_DIR="$ROBOT_TESTS_DIR" \
  -v $REPORTS_DIR:/opt/robotframework/reports:Z \
  -v $TESTS_DIR:/opt/robotframework/tests:Z \
  --user $(id -u):$(id -g) \
  ppodgorsek/robot-framework:latest
