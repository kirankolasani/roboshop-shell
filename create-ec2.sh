#!/bin/bash

INSTANCE_NAME=("web" "mongodb" "redis" "mysql" "catalogue" "user" "cart" "shipping" "rabbitmq" "payment" "dispatch")
INSTANCE_TYPE=""
SECURITY_group_ID="sg-0fa491629b46961b3"
IMAGE_ID="ami-0f3c7d07486cad139"

for i in ${INSTANCE_NAME[@]}
do 
  if [[ $i=="mongodb" || $i=="mysql" ]]
  then
   INSTANCE_TYPE="t2.medium"
   echo "creating instance $i"
   
  fi
  INSTANCE_TYPE="t2.micro"
  IPADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_group_ID --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$i'}]'|jq -r '.Instances[0].PrivateIpAddress')
  echo "Created $i instance with Private IP : $IPADDRESS"
  
done

#aws ec2 run-instances --image-id ami-0f3c7d07486cad139 --instance-type t2.micro --security-group-ids sg-0fa491629b46961b3 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web}]'