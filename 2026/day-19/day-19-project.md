- Each script's code
  `log_rotate.sh`

      #/bin/bash
      #
      #
      #
      
      set -e
      dir=$1
      
      #checking if directory is present or not
      
      if [ -d "$dir" ]; then
        echo "Directory is present"
      else
        echo "Directory is not present exiting..."
        exit 1
      fi
      
      #compressing files older than 1 day into gzip
      
      files_compressed=$(find $dir -name "*.log" -mtime +7 | wc -l)
      find "$dir" -name "*.log" -mtime +7 -exec gzip {} \;
      
      files_deleted=$(find $dir -name "*.gz" -mtime +30| wc -l )
      
      #removing .gz files older than 30 days
      find "$dir" -name "*.gz" -mtime +30 -exec rm -rf {} \;
      
      
      echo "Total number of files compressed are $files_compressed and removed files are $files_deleted "


  `backup.sh`

      #!/bin/bash
      #
      set -eu
      SRC_DIR=$1
      BKP_DEST=$2
      BKP_FILE=backup-$(date +%Y-%m-%d).tar.gz
      
      if [ -d "$SRC_DIR" >/dev/null 2>&1 ]; then
        echo "Source Directory exists !"
      else
        echo "Source DIR not found !"
      fi
      
      echo "Starting the backup"
      
      tar -cvzf $BKP_DEST/$BKP_FILE $SRC_DIR
      
      if [ -f "$BKP_DEST/$BKP_FILE" ]; then
        echo "Backup Created"
      else
        echo "Failed to create backup"
      fi
      
      du -sh $BKP_DEST/$BKP_FILE
      
      echo "deleting files older than 14 days"
      find "$BKP_DEST" -name "*.tar.gz" -mtime +14 -exec rm -rf {} \;
      echo "Exiting"


  `maintenance.sh`

      #!/bin/bash
      
      set -eu
      
      LOG_FILE=/var/log/maintainance_$(date +%Y-%m-%d).logs
      
      touch $LOG_FILE
      
      echo " $(date) RUNNING LOG ROTATE" | tee -a $LOG_FILE
      ./log_rotate.sh /home/ubuntu/bash_project/ |  tee -a $LOG_FILE
      
      echo " $(date) RUNNING BACKUP" | tee -a $LOG_FILE
      #echo "Starting backup">>$LOG_FILE
      ./backup.sh /home/ubuntu/bash_project /home/ubuntu/backup | tee -a $LOG_FILE

- Sample outputs

       Wed Mar 25 18:38:11 UTC 2026 RUNNING LOG ROTATE
      Directory is present
      Total number of files compressed are 0 and removed files are 0
       Wed Mar 25 18:38:11 UTC 2026 RUNNING BACKUP
      Source Directory exists !
      Starting the backup
      tar: Removing leading `/' from member names
      /home/ubuntu/bash_project/
      /home/ubuntu/bash_project/file3.log.gz
      /home/ubuntu/bash_project/file5.log.gz
      /home/ubuntu/bash_project/file2.log.gz
      /home/ubuntu/bash_project/file4.log.gz
      /home/ubuntu/bash_project/backup.sh
      /home/ubuntu/bash_project/file1.log.gz
      /home/ubuntu/bash_project/maintainance.sh
      /home/ubuntu/bash_project/log_rotate.sh
      Backup Created
      4.0K    /home/ubuntu/backup/backup-2026-03-25.tar.gz
      deleting files older than 14 days
      Exiting

- Cron entries you wrote

      * 2 * * * ./home/ubuntu/bash_project/log_rotate.sh
      * 3 * * * ./home/ubuntu/bash_project/backup.sh
      * 1 * * * sudo ./home/ubuntu/bash_project/maintainance.sh

- What you learned (3 key points)

-Learned how to capture logs with timestamp.
-Learned how to use the crontab to schedule scripts and commands.
-Learned How to tar and utar files.
