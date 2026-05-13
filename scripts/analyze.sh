
#!/bin/bash

LOG_FILE="../logs/access.log"

echo "=============================="
echo " LOG ANALYSIS REPORT"
echo "=============================="

echo
echo "Total Requests:"
wc -l < $LOG_FILE

echo
echo "Unique IP Addresses:"
awk '{print $1}' $LOG_FILE | sort | uniq

echo
echo "HTTP Status Codes:"
awk '{print $9}' $LOG_FILE | sort | uniq -c

echo 
echo "Error Requests:"
awk '$9 >= 400 {print}' $LOG_FILE

echo 
echo "Requested URLs:"
awk -F'"' '{print $2}' $LOG_FILE | awk '{print $2}'