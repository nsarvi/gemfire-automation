#!/bin/bash
export VERBOSE=true
# Get current directory
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Set GemFire env profile  directory
PROFILE_HOME_DIR=$BIN_DIR/..
export JAVA_ARGS="   -Dgfsh.log-dir=${PROFILE_HOME_DIR}/logs/gfsh"
# Get current date and time and create timestamp
NOW=$(date '+%F-%H-%M')
DATE_NOW=${NOW:0:10}
TIME_NOW=${NOW:11:2}:${NOW:14:2}
#TIMESTAMP_NOW=$(date -d "$DATE_NOW $TIME_NOW" +%s)
TIMESTAMP_NOW=$(date +%Y%m%d_%H%M%S)
HOST_NAME=`hostname -s`
HOST_PUBLIC_NIC_ADDR=`hostname -f`
HOST_PIVATE_NIC_ADDR=$HOST_PUBLIC_NIC_ADDR
JAVA_HOME=/opt/jdk/latest
GEMFIRE=/opt/gemfire
GFSH=${GEMFIRE}/bin/gfsh
PATH=$JAVA_HOME/bin:$GEMFIRE/bin:$GEMFIRE/lib:$PATH
LD_LIBRARY_PATH=$GEMFIRE/lib:$LD_LIBRARY_PATH
APP_LIB_DIR=$PROFILE_HOME_DIR/lib
APP_CLASSPATH=$APP_LIB_DIR:$APP_LIB_DIR/*
GF_CONFIG_DIR=$PROFILE_HOME_DIR/conf
GF_BACKUP_DIR=$PROFILE_HOME_DIR/backups
GF_DATA_DIR=$PROFILE_HOME_DIR/data
GF_LOG_DIR=$PROFILE_HOME_DIR/logs
GF_SERVICES_DIR=$PROFILE_HOME_DIR/services
APP_JAR_HOT_DEPLOY_DIR=$PROFILE_HOME_DIR/deploy
GFSH_LOG_DIR=$GF_LOG_DIR/gfsh
GF_SERVER_LOG_FILE_NAME=gemfire-server.log
BIND_ADDR=$HOST_PIVATE_NIC_ADDR
SERVER_BIND_ADDR=$HOST_PUBLIC_NIC_ADDR
LOCATOR_HOSTNAME_FOR_CLIENTS=$SERVER_BIND_ADDR
JMX_MANAGER_BIND_ADDR=localhost

FID={{ gemfire_user }}
GID={{ gemfire_group }}
GC_SWITCHES_LOCATOR=" -Xms2048m -Xmx2048m -Xss384k -XX:MaxMetaspaceSize=256m -XX:NewRatio=2 -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintTenuringDistribution -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCApplicationConcurrentTime -Xloggc:/var/gemfire/locator_gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -Xss384k"
GC_SWITCHES_SERVER=" -Xms8192m -Xmx8192m -Xss384k -XX:MaxMetaspaceSize=384m -XX:ParallelGCThreads=4 -XX:NewRatio=2 -XX:SurvivorRatio=8 -XX:CompileThreshold=5000 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintTenuringDistribution -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCApplicationConcurrentTime -Xloggc:/var/gemfire/cacheServer_gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M"
GF_SWITCHES_LOCATOR=" -Dgemfire.enable-time-statistics=true -Dgemfire.statistic-sampling-enabled=true -DJGroups.SHUN_SUNSET=1 -Dgemfire.log-level=config -DBridgeServer.HANDSHAKE_POOL_SIZE=20"
GF_SWITCHES_SERVER=" -Dgemfire.enable-time-statistics=true -Dgemfire.statistic-sampling-enabled=true -DJGroups.SHUN_SUNSET=1 -Dgemfire.log-level=config -DBridgeServer.HANDSHAKE_POOL_SIZE=20"
