#!/bin/bash

#1. Create a Spot Instance
#2. Take take instance IP and register in DNS

if [ -z "$1" ]; then
  echo -e "\e[1;31mInput is missing\e[0m"
  exit 1
fi

COMPONENT=$1
# i want - in between that means if i give ansible-playbook roboshop.yml frontend dev then
# it will convert as ansible-playbook roboshop.yml frontend-dev
ENV=$2
if [ ! -z "$ENV" ]; then
  ENV="-${ENV}"
fi


ID="lt-08d5aa9e8bc287ac7"
VER=2
ZONE_ID=Z078908237A6SF5H7OAQ8

# check if instance is already there
CREATE_INSTANCE(){
aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}" | jq .Reservations[].Instances[].State.Name | sed 's/"//g' | grep -E 'running|stopped' &>/dev/null
if [ $? -eq 0 ]; then
  echo -e "\e[1;33mInstance is already there\e[0m"
else
aws ec2 run-instances --launch-template LaunchTemplateId=${ID},Version=${VER} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
fi
sleep 10
IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}" | jq .Reservations[].Instances[].PrivateIpAddress | sed 's/"//g' | grep -v null)
##Update the DNS Record
sed -e "s/IP/${IP}/" -e "s/COMPONENT/${COMPONENT}/" record.json >/tmp/record.json
aws route53 change-resource-record-sets --hosted-zone-id ${ZONE_ID} --change-batch file:///tmp/record.json | jq
}
if [ "$COMPONENT" == "all" ]; then
  for comp in frontend mongodb catalogue user cart shipping rabbitmq redis mysql payment dispatch; do
    COMPONENT=$comp$ENV
     CREATE_INSTANCE
  done
  else
    COMPONENT=$COMPONENT$ENV
    CREATE_INSTANCE
fi
