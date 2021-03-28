#!/bin/bash

source $(dirname $0)/util/check_dependencies.sh

read -p "Enter profile name    : " profileName
read -p "Enter client id       : " clientId
read -p "Enter your email      : " email
echo -n "Enter your password   : "; stty -echo; read password; stty echo; echo
read -p "Enter region          : " region

echo ""

source $(dirname $0)/util/auth.sh

source $(dirname $0)/util/acc.sh

echo "For generate token again in future you can use \"bash accounts/$email.sh\" command."
echo "Current token copied to clipboard!"
echo ""
