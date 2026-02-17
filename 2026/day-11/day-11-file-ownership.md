# Day 11 Challenge

## Files & Directories Created
[list all files/directories]
total 12
drwxrwxr-x 2 berlin    heist-team 4096 Feb 17 16:19 app-logs
drwxrwxr-x 2 ubuntu    ubuntu     4096 Feb 17 16:26 bank-heist
-rw-rw-r-- 1 berlin    ubuntu        0 Feb 17 16:15 devops-file.txt
drwxrwxr-x 4 professor planners   4096 Feb 17 16:21 heist-project
-rw-rw-r-- 1 professor heist-team    0 Feb 17 16:17 project-config.yaml
-rw-rw-r-- 1 ubuntu    heist-team    0 Feb 17 16:16 team-notes.txt

./app-logs:
total 0

./bank-heist:
total 0
-rw-rw-r-- 1 tokyo   vault-team 0 Feb 17 16:25 access-codes.txt
-rw-rw-r-- 1 berlin  tech-team  0 Feb 17 16:26 blueprints.pdf
-rw-rw-r-- 1 nairobi vault-team 0 Feb 17 16:26 escape-plan.txt

./heist-project:
total 8
drwxrwxr-x 2 professor planners 4096 Feb 17 16:22 plans
drwxrwxr-x 2 professor planners 4096 Feb 17 16:21 vault

./heist-project/plans:
total 0
-rw-rw-r-- 1 professor planners 0 Feb 17 16:22 strategy.conf

./heist-project/vault:
total 0
-rw-rw-r-- 1 professor planners 0 Feb 17 16:21 gold.txt


## Ownership Changes
[before/after for each file]

Example:
- devops-file.txt: user:user → tokyo:heist-team
--------------------------------------------------
- devops-file.txt: ubuntu:ubuntu ->  berlin:ubuntu
- project-config.yaml ubuntu:ubuntu -> professor:heist-team
- team-notes.txt ubuntu:ubuntu -> ubuntu:heist-team
- access-codes.txt ubuntu:ubuntu -> tokyo:vault-team
- blueprints.pdf ubuntu:ubuntu -> berlin:tech-team
- escape-plan.txt ubuntu:ubuntu -> nairobi:vault-team
- strategy.conf ubuntu:ubuntu -> professor:planners
- gold.txt ubuntu:ubuntu -> professor:planners

## Commands Used
  107  cd day11/
  110  touch devops-file.txt
  111  ls -l
  112  chown tokyo devops-file.txt
  113  sudo chown tokyo devops-file.txt
  115  sudo chown berlin devops-file.txt
  117  touch team-notes.txt
  118  ls -l team-notes.txt
  119  sudo groupadd heist-team
  120  sudo chgrp heist-team team-notes.txt
  122  touch project-config.yaml
  123  chown professor -aG heist-team project-config.yaml
  124  sudo chown professor:heist-team project-config.yaml
  126  mkdir app-logs
  128  chown berlin:heist-team app-logs
  129  sudo chown berlin:heist-team app-logs
  131  mkdir -p heist-project/vault
  138  mkdir -p heist-project/plans
  139  touch -p heist-project/vault/gold.txt
  140  touch heist-project/vault/gold.txt
  141  touch -v heist-project/plans/strategy.conf
  142  touch heist-project/plans/strategy.conf
  143  groupadd planners
  144  sudo groupadd planners
  145  sudo chown -R professor:planners heist-project/
  147  ls -lR
  148  sudo groupadd vault-team tech-team
  149  sudo groupadd vault-team
  150  sudo groupadd tech-team
  151  mkdir bank-heist
  153  touch bank-heist/access-codes.txt
  154  touch bank-heist/blueprints.pdf
  155  touch bank-heist/escape-plan.txt
  156  sudo chown tokyo:vault-team bank-heist/access-codes.txt
  157  sudo chown berlin:tech-team bank-heist/blueprints.pdf
  158  sudo chown nairobi:vault-team bank-heist/escape-plan.txt
  159  ls -l bank-heist/



## What I Learned
[3 key points about file ownership]

How to change the file ownership 
How to change the group of files and directories recursively
How to change group and owner in one command of files.
