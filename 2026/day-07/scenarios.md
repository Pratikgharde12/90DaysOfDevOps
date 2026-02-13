Scenari 1 : Service not starting 

 A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order.

Step 1 : systemclt status myapp 
 First we will check if the myapp service is currently running or in failed state.
 
Step 2 : journalctl -u myapp -f 
 We will check the logs if service is failed to start. 
 
Step 3 : systemclt is-enabled myapp 
 we will check if auto start after every reboot is enabled or not. 
 
Scenario 2 : High CPU Usage 
Your manager reports that the application server is slow.
You SSH into the server. What commands would you run to identify
which process is using high CPU?

Step 1 : top 
 Use this command to check which process is consuming high CPU 
 
Step 2 : ps aux --sort=%cpu | head -10
	Use this command to check all the processes consuming cpu sorted by cpu utilization
	
Step 3 : 
	Use the same command to note the PID 


Scenario 3 : Finding service logs 

A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?

Step 1 : systemctl status docker 
	Use this command to check the status of service.

Step 2 : journalctl -u docker -n 50
	use this command to get the docker logs 
	
Step 3 : journalctl -u docker -f 
	Use this command to follow the logs in real time
	
Scenario 4 : File Permission Issues 
A script at /home/user/backup.sh is not executing.
When you run it: ./backup.sh
You get: "Permission denied"

What commands would you use to fix this?

Step 1 : ls -ltr /home/user/backup.sh 
	Use this command to check the permissions on the file first 
	
Step 2 : chmod +x /home/user/backup.sh
	Use this command to give permission
	
Step 3 : ls -l /home/user/backup.sh 
	Verify you got the permissions correct
	
Step 4 : ./home/user/backup.sh 
	Try running the script 
