username=${1}
echo "Adding user - ${username}"
echo password | passwd --stdin ${username}
echo "successfully added user - ${username}"


