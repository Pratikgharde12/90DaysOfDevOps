1)Which 3 commands save you the most time right now, and why?

systemctl status <service name>, 
ls -lh 
df -h

These three commands help me in monitoring the system health quickly. 

2)How do you check if a service is healthy? List the exact 2–3 commands you’d run first.

systemctl status <service name>		
journalctl -u <service_name> 
ps -ef | grep service name

3)How do you safely change ownership and permissions without breaking access? Give one example command.

 By keeping read permissions for all the users. 
 chmod 444 <filepath>
 chown user:group 
 
4) What will you focus on improving in the next 3 days?
 -- getting a better understanding of network commands
