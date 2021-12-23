#check user is root user or not
USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0  ]; then
  echo -e "\e[1;31mU should be root user to perform this script\e[0m"
  exit
fi

COMPONENT=${1}
if [ -z "${COMPONENT}"  ]; then
  echo  -e "\e[31mComponent Input Missing\e[0m"
  exit
fi
if [ ! -e "components/${COMPONENT}.sh" ]; then
   echo -e "\e[31mGiven Component does not exists\e[0m"
   exit
fi
bash components/${COMPONENT}.sh