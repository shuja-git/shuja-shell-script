username=shuja
echo "Adding user - ${username}"
echo password | passwd --stdin ${username}
echo "successfully added user - ${username}"
