#!/bin/bash
#Program: logs_clear.sh
#Author: Neal
#E_mail: 419775240@qq.com
#Date: 2016-02-15
#description: 清理日志数据和备份数据
#使用：/bin/bash logs_clear.sh $1 $2 $3，$1表示根目录被占用的百分比值,$2表示日志保留的天数，$3表示备份目录中备份文件保留份数
#Version 6.0

#变量请根据实际环境进行修改
log_dir=/tmp/logs
bak_dir=/home/tomcat/bak
project_name=iov_mcms
log_record_file=/tmp/logs_clear.log
large_file_name=catalina.out
large_file_size=2097152   # 单位为kBit， 2GB=2097152,4GB=4194304,6GB=8388608

export PATH=/usr/local/bin:/usr/bin:/bin

# check log dir
tail_str=${log_dir##*/}
if [ ${tail_str} != logs ];then
    echo "注意：请检查日志目录(log_dir)是否正确。"
    exit 1
fi

#获取系统根目录使用率
root_rate=`df -h | egrep --color=auto '/$' | awk '{print $5}' | sed -e 's/[=/%]/ /g'`

[ -f ${log_record_file} ] || touch ${log_record_file}


#if [ ${root_rate} -ge $1 ];then
#    [ -f /tmp/tmp.tmp ] && echo "" > /tmp/tmp.tmp || touch /tmp/tmp.tmp
#    echo "数据开始清理时间：$(date +%F_%T)" >> ${log_record_file}   
#
#    #清理日志文件
#    find ${log_dir} -type f -mtime +$2 | tee /tmp/tmp.tmp >> ${log_record_file}  #tee是重定向操作，不是追加操作
#    if [ ! -s /tmp/tmp.tmp ];then
#        echo "日志目录没有可删除的文件。"
#    else
#        for i in `cat /tmp/tmp.tmp`;do
#            rm -f $i
#        done
#    fi
#
#    #清理备份文件
#    let "bak_keep_num= $3 + 1"  #备份保留份数加1才能进行tail过虑
#    if [ `ls -td ${bak_dir}/${project_name}* | wc -l` -ge ${bak_keep_num} ];then
#        ls -td ${bak_dir}/${project_name}* | tail -n +${bak_keep_num} | tee /tmp/tmp.tmp >> ${log_record_file}
#        if [ ! -s /tmp/tmp.tmp ];then
#            echo "备份目录没有可删除的文件。"
#        else
#            for i in `cat /tmp/tmp.tmp`;do
#                rm -rf $i
#            done
#        fi
#    else
#        echo "备份目录没有可删除的文件。"
#    fi
#
#    #清理空目录
#    find ${log_dir} -type d -empty | egrep -v "(debug$|trace$|info$|error$|warn$)" | tee /tmp/tmp.tmp >> ${log_record_file}
#    if [ ! -s /tmp/tmp.tmp ];then
#        echo "日志目录中没有空目录可清理。"
#    else
#        for i in `cat /tmp/tmp.tmp`;do
#            rmdir $i
#        done
#    fi
#    echo -e "数据清理完成时间：$(date +%F_%T)\n" >> ${log_record_file}
#
#    # 清理类catalina.out的大文件
#    if [[ -f ${log_dir}/${large_file_name} ]];then
#        size=`du ${log_dir}/${large_file_name}| awk '{print $1}'`
#        if [[ ${size} -ge ${large_file_size} ]];then
#            echo "${log_dir}/${large_file_name}文件大于${large_file_size}kBit,现在开始清空此文件."
#            echo '' > ${log_dir}/${large_file_name}
#            if [ `echo $?` -eq 0 ];then
#                echo "${log_dir}/${large_file_name}已清理!"
#            else
#                echo "${log_dir}/${large_file_name}未被清理,请检查。"
#            fi
#        fi
#    fi
#fi
