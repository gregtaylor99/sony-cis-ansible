#!/bin/bash
set -x
HOST=`hostname`
echo $HOST

cd /home/ec2-user
unzip /tmp/ciscat-full-bundle-2016-01-06-v3.0.21.zip
chown -R ec2-user:ec2-user /home/ec2-user/*
 /home/ec2-user/cis-cat-full/CIS-CAT.sh  -f -props /home/ec2-user/cis-cat-full/misc/ciscat.properties -b /home/ec2-user/cis-cat-full/benchmarks/CIS_Amazon_Linux_2014.09-2015.03_Benchmark_v1.1.0-xccdf.xml
 mv /root/CIS-CAT_Results/ip*/*.html /home/ec2-user/report.html
 yum install mutt -y
 /usr/bin/mutt -s "CIS Report for $HOST" -a /home/ec2-user/report.html -- greg.taylor.reyktech@sonymusic.com < "."
 mv /home/ec2-user/report.html /tmp/.