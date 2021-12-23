
#
## yum install nginx -y
## systemctl enable nginx
## systemctl start nginx
#Let's download the HTML content that serves the RoboSHop Project UI and deploy under the Nginx path.
#
## curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#Deploy in Nginx Default Location.
#
## cd /usr/share/nginx/html
## rm -rf *
## unzip /tmp/frontend.zip
## mv frontend-main/* .
## mv static/* .
## rm -rf frontend-master static README.md
## mv localhost.conf /etc/nginx/default.d/roboshop.conf
#Finally restart the service once to effect the changes.
### systemctl restart nginx
#------------------------------------------------------------
#To Install Nginx.
#check user is root user or not
USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0  ]; then
  echo -e "\e[1;31mU should be root user to perform this script\e[0m"
  exit
else
  yum install nginx -y
fi

