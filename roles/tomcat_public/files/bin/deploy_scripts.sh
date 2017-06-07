#!/bin/bash
#Program: Deployment project meanagement scripts
#Author: Neal
#E_mail: 419775240@qq.com
#Date: 2015-12-10
#Version 1.0

#project_name替换成实际的项目名称
projectName=$1
instanceName=tomcat-7.0.54

#替换脚本文件名称
for i in *iov_mcms;do
    mv $i ${i%iov_mcms*}${projectName}
done
for j in iov_mcms*;do
    mv $j ${projectName}${j#*iov_mcms}
done

#修改脚本内容
sed -i s/iov_mcms/${projectName}/g *${projectName}*
sed -i s/tomcat9100/${instanceName}/g *${projectName}*
