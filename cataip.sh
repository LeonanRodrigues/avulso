#/bin/bash

read -p "Qual o ASG que buscas os ips? " ASG 
read -p "Qual a AMI que buscas os ips? " AMI 

aws ec2 describe-instances --filters Name=tag-key,Values=aws:autoscaling:groupName,$ASG Name=image-id,Values=$AMI --query 'Reservations[].Instances[].PrivateIpAddress' | awk '{print $1}' | sed '/\[/d' | sed '/\]/d' |  sed 's/\"//g' | sed 's/\,//g' > hosts
