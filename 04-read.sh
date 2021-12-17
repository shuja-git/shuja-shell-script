#!/bin/bash

#read -p "Enter ur name : " name
#read -p "enter ur age : " age
#echo "ur name is " ${name}
#echo "ur age is" ${age}
#case statement
read -p "enter component to setup" component
case $component in
frontend)
  echo "frontend setup"
  ;;
catalogue)
  echo "catalogue setup"
 ;;
user)
  echo "user setup"
  ;;
*)
  echo "u entered wrong entry"
esac
