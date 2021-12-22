username=shuja
echo "Adding user - ${username}"
echo password | passwd --stdin ${username}
echo "successfully added user - ${username}"

DATE=22/12/2021
echo  date is - ${DATE}
DATE=$(date +%F)
echo todays date is - ${DATE}

echo "Adding 2 numbers so using arthmatic substitution"
add=$((2+3))
echo "Addition of 2 number is = ${add}"
