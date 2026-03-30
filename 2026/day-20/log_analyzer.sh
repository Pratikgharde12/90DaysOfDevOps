#!/bin/bash
LOGFILE=$1
ERRORCOUNT=0
if [ $# = 0 ]; then
        echo "ERROR: No Arguments provided....exiting"
        exit 1
fi
#---
if [ -f "$LOGFILE" ]; then
        echo "Log file found $LOGFILE....Starting the analysis"
else
        echo "ERROR: Log file doesn't exists exiting....."
        exit 1
fi
#count function
function count(){
        local count=$( cat "$LOGFILE" | grep -i error | wc -l )
        echo "Error count is $count "
        ERRORCOUNT=$count
}
count
#---
function critical_events() {
        echo "---- critical events ----"
        cat "$LOGFILE" |  awk ' /CRITICAL/ {print NR, $0}'
}
critical_events
echo "--- Top 5 Error Messages ---"
function error_occurence(){
cat $LOGFILE | awk '/ERROR/ {print $4,$5,$6}' | sort | uniq -c | sort -rn
}
error_occurence
#----------------------
#

function generateLogReport(){
        local report=report_"$(date +%Y-%m-%d)".txt

        echo "$(date +%Y-%m-%d)">$report
        echo " Name of log file processed : $LOGFILE">>$report
        echo "Total Lines Processed : $( cat $LOGFILE | wc -l )">>$report
        echo "Total Error Count : $ERRORCOUNT ">>$report
        count>>$report
        error_occurence>>$report
        critical_events>>$report

}

generateLogReport

mkdir -p /home/ubuntu/archive
cp $LOGFILE
echo "Analysis Completed"
echo " $LOGFILE Archived, Moved to /home/ubuntu/archive"
