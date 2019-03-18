#!/bin/sh

BASE_PATH=/home/shding/vam/
SERVICE_NAME=assembly-0.0.1-SNAPSHOT
JAR_PATH=$BASE_PATH"/"$SERVICE_NAME"/"
JAR_NAME=$SERVICE_NAME\.jar
CONFIG_PATH=$BASE_PATH"/"$SERVICE_NAME"/config/"
JAR_CONFIG=ssss
PID=$SERVICE_NAME\.pid
JAVA_OPTS="-ms512m -mx512m -Xmn256m -Djava.awt.headless=true -XX:MaxPermSize=128m"
LOG_PATH=$BASE_PATH"/"$SERVICE_NAME"/logs/"


P_ID=0

checkpid(){
P_ID=`ps -ef | grep -w "$SERVICE_NAME" | grep -v "grep" | awk '{print $2}'`
if [ n $P_ID ]; then
P_ID=0
fi
}




case "$1" in

start)
checkpid

if [ $P_ID -ne 0 ]; then
echo "============================"
echo "$SERVICE_NAME already started! (pid=$P_ID)"
echo "============================"
else
nohup java -jar  $JAR_PATH$JAR_NAME >/dev/null 2>&1 &
echo $! > $BASE_PATH"/"$SERVICE_NAME"/"$PID
echo "============================"
echo "begin to start $SERVICE_NAME"
echo "============================"
fi
;;

stop)
kill `cat $BASE_PATH"/"$SERVICE_NAME"/"$PID`
rm -rf $BATH_PATH"/"$SERVICE_NAME"/"$PID
echo "===stop $SERVICE_NAME"
sleep 5
P_ID=`ps -ef | grep -w "$SERVICE_NAME" | grep -v "grep" | awk '{print $2}'`
if [ "$P_ID" == "" ]; then
echo "===$SERVICE_NAME process not exist or stop success"
else
echo "===$SERVICE_NAME process pid is:$P_ID"
echo "===begin kill $SERVICE_NAME process,pid is :$P_ID"
kill -9 $P_ID
fi
;;

restart)
$0 stop
sleep 2
$0 start
echo "===restart $SERVICE_NAME"
;;
esac
exit 0


