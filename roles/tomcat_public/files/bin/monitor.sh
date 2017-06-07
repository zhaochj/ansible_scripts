#Author: Neal
#E_mail: 419775240@qq.com
#Date: 2016-08-31
#Version 1.0

# May need to change the value of the variable
PROJECT_NAME=filter
INSTANCE_NAME=tomcat-7.0.54
JAVA_HOME=/home/tomcat/jdk1.7.0_60
CATALINA_HOME=/home/tomcat/$INSTANCE_NAME
SAVE_PATH=/home/tomcat/bak/monitor

PATH=${USER_HOME}/bin:${JAVA_HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH

[ -f $SAVE_PATH ] || mkdir -p $SAVE_PATH
JAVA_PID=`ps aux | grep java | grep "$CATALINA_HOME" | awk '{print $2}'`

top -cbH -n 2 -p $JAVA_PID > $SAVE_PATH/`date +%Y%m%d-%H-%M`_top.txt
jmap -histo $JAVA_PID > $SAVE_PATH/`date +%Y%m%d-%H-%M`_jmap-histo.txt
jstack $JAVA_PID > $SAVE_PATH/`date +%Y%m%d-%H-%M`_jstack.txt
