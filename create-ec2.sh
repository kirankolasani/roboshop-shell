#!/bin/bash

#INSTANCE_NAME=("web" "mongodb" "redis" "mysql" "catalogue" "user" "cart" "shipping" "rabbitmq" "payment" "dispatch")
INSTANCE_NAME=$@
INSTANCE_TYPE=""
SECURITY_group_ID="sg-0fa491629b46961b3"
IMAGE_ID="ami-0f3c7d07486cad139"
HOSTED_ZONE_ID="Z09758961YQX652W11A6M"
DOMAIN_NAME="devopsaws.site"

for i in ${INSTANCE_NAME[@]}
do  
    if [[ $i == "mongodb" || $i == "mysql" ]]
    then
        INSTANCE_TYPE="t3.medium"
    else
        INSTANCE_TYPE="t2.micro"
    fi
  
  IPADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_group_ID --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$i'}]'|jq -r '.Instances[0].PrivateIpAddress')
  echo "Created $i instance with Private IP : $IPADDRESS with instance_type : $INSTANCE_TYPE"
  # aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch '{
  #     "Changes": [
  #       {
  #         "Action": "CREATE",
  #         "ResourceRecordSet": {
  #           "Name": "'$i.$DOMAIN_NAME'",
  #           "Type": "A",
  #           "TTL": 60,
  #           "ResourceRecords": [
  #             {
  #               "Value": "'$IPADDRESS'"
  #             }
  #           ]
  #         }
  #       }
  #     ]
  #   }'

  
done

#aws ec2 run-instances --image-id ami-0f3c7d07486cad139 --instance-type t2.micro --security-group-ids sg-0fa491629b46961b3 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web}]'