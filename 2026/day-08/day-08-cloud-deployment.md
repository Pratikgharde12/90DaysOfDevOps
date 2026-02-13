Installing Nginx server on an EC2 instance and checking the home page. 

Note : I have already created an EC2 instance on AWS.
---
Step 1 : sudo apt update
Update the packages 

Step 2 : sudo apt install nginx
Install the inginx service 

Step 3 : type yes if prompted

Step 4 : systemctl status nginx.service 
Check if service is running or stopped.

Step 5 : Configure the security policies and add port 80 in inbound rules. 

Step 6: paste http://<your server public ip> into browser 
A welcome page will appear. 

We have successfully installed nginx service on our server. 
---
Commands used to check logs 

1) journalctl -u nginx.service 
  -To get the service logs 

2) cat /var/log/nginx/access.log > nginx-access.log
   - To copy logs into my user home directory
---
Commands to copy log file to local machine 

scp -i your-key.pem ubuntu@<public_ip>:<path of log file on server> <path of your machine where you want to copy>
example 

scp -i developkey.pem ubuntu@179.135.66.23:/home/ubuntu/nginx.logs .
---
Challenges : 
I was not able to access my webpage from my browser, when using the ip and port. 
Problem: I was entering https instead of http
---
What I learned 
install nginx server on an ec2 instance , 
how to expose ports , 
how to check the logs 
copy files from server to local machine using scp.


