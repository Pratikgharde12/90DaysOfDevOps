# Day 09 Challenge

## Users & Groups Created
- Users: tokyo, berlin, professor, nairobi
- Groups: developers, admins, project-team

## Group Assignments
developers:x:1004:tokyo,berlin
admins:x:1005:professor
nairobi:x:1006:
project-team:x:1007:nairobi,tokyo

## Directories Created
drwxrwxr-x 2 root developers   4096 Feb 13 20:28 dev-project
drwxrwxr-x 2 root project-team 4096 Feb 13 15:29 team-workspace

## Commands Used

        5  useradd tokyo -m
        7  useradd -m berlin
        9  useradd -m professor
        10  groupadd developers
        11  groupadd admins
        12  cat /etc/groups
        13  cat /etc/group
        14  usermod -aG developers tokyo
        15  usermod -aG developers berlin
        16  usermod -aG admin professor
        18  cat /etc/passwd
        19  cat /etc/group
        20  usermod -aG admin professor
        21  cat /etc/group
       22  usermod -aG admins professor
       23  cat /etc/group
       24  mkdir /opt/dev-project
       25  chgrp developers /opt/dev-project/
       26  ls -l /opt/dev-project/
       27  ls -dl /opt/dev-project/
       28  chmod -R 775 /opt/dev-project/
       29  ls -dl /opt/dev-project/
       30  useradd -m nairobi
       31  groupadd project-team
       32  usermod -aG project-team nairobi tokyo
       33  usermod -aG project-team nairobi
       34  usermod -aG project-team tokyo
       35  mkdir /opt/team-workspace
       37  chgrp project-team /opt/team-workspace/
       38  chmod -R 775 /opt/team-workspace/
       41  deluser professor berlin

## What I Learned
    How to create users 
    How to create groups 
    How to manage users and groups along with permissions

Screenshot 1
<img width="945" height="72" alt="image" src="https://github.com/user-attachments/assets/39c265ba-204f-4dee-9f31-54938ba12364" />

Screenshot2
<img width="718" height="201" alt="Screenshot 2026-02-14 030449" src="https://github.com/user-attachments/assets/ebe1812a-352c-4142-91fc-d9afdc0155f6" />


