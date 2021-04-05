#!/bin/bash

source $(dirname $0)/util/check_dependencies.sh

read -p "Enter profile name    : " profileName
read -p "Enter client id       : " clientId
read -p "Enter your email      : " email
echo -n "Enter your password   : "; stty -echo; read password; stty echo; echo
read -p "Enter custom:userType : " userType
read -p "Enter your name       : " name
read -p "Enter user pool id    : " poolId
read -p "Enter region          : " region

echo ""
aws cognito-idp sign-up \
    --region $region \
    --profile $profileName \
    --client-id $clientId \
    --username $email \
    --password $password \
    --user-attributes Name="email",Value="$email" \
    Name="custom:userType",Value="$userType" \
    Name="name",Value="$name" > /dev/null

aws cognito-idp admin-confirm-sign-up \
    --region $region \
    --profile $profileName \
    --user-pool-id $poolId \
    --username $email

source $(dirname $0)/util/auth.sh

source $(dirname $0)/util/acc.sh

echo "For generate token again in future you can use \"bash accounts/$userType-$email.sh\" command."
echo "Current token copied to clipboard!"
echo ""
