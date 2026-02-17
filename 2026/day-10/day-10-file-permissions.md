# Day 10 Challenge

## Files Created
ubuntu@ip-172-31-6-79:~$ ls -l devops.txt
-rw-rw-r-- 1 ubuntu ubuntu 0 Feb 17 14:50 devops.txt
ubuntu@ip-172-31-6-79:~$ ls -l notes.txt
-rw-rw-r-- 1 ubuntu ubuntu 27 Feb 17 14:50 notes.txt
ubuntu@ip-172-31-6-79:~$ ls -l script.sh
-rw-rw-r-- 1 ubuntu ubuntu 21 Feb 17 14:52 script.sh

## Permission Changes
OLD Permissions
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb 17 14:50 devops.txt
-rw-rw-r-- 1 ubuntu ubuntu   27 Feb 17 14:50 notes.txt
-rw-rw-r-- 1 ubuntu ubuntu   21 Feb 17 14:52 script.sh

New Permissions
-r--r--r-- 1 ubuntu ubuntu    0 Feb 17 14:50 devops.txt
-rw-r----- 1 ubuntu ubuntu   27 Feb 17 14:50 notes.txt
drwxr-xr-x 2 ubuntu ubuntu 4096 Feb 17 14:57 project
-rwxrwxr-x 1 ubuntu ubuntu   21 Feb 17 14:52 script.sh


## Commands Used
touch devops.txt
cat script.sh
vi script.sh
cat notes.txt
cat /etc/passwd | head -n 5
cat /etc/passwd | tail -n 5
chmod +x script.sh
chmod 444 devops.txt
ls -l notes.txt

## What I Learned
-How to create text files and scripts.
-How to change permissions for users and groups.
-How to make files executable.
