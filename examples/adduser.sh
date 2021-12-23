username=${1}
echo "Adding user - ${username}"
echo password | passwd --stdin ${username}
echo "successfully added user - ${username}"

DATE=22/12/2021
echo  date is - ${DATE}
DATE=${2}
echo todays date is - ${DATE}

#echo user = ${USER}
#echo A = ${A}