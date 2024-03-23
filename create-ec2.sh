#!/bin/bash

INSTANCE_NAME=("web" "mongodb" "redis" "mysql" "catalogue" "user" "cart" "mysql" "shipping" "rabbitmq" "payment" "dispatch")


for i in $INSTANCE_NAME[@]
do 
 echo "creating instance $i"
done

#aws ec2 run-instances --image-id ami-0f3c7d07486cad139 --instance-type t2.micro --security-group-ids sg-0fa491629b46961b3 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web}]'