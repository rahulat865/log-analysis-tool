
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

LOG_FILE="logs/access.log"

declare -A ip_count
declare -A status_count

while read -r line
 do
    ip=$(echo "$line" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')

    status=$(echo "$line" | grep -oE '" [0-9]{3}' | grep -oE '[0-9]{3}')

    ((ip_count[$ip]++))
    ((status_count[$status]++))

 done < "$LOG_FILE"

 echo "===== TOP IP ADDRESSES ====="

for ip in "${!ip_count[@]}"
 do
    echo "$ip -> ${ip_count[$ip]} requests"
 done

 echo
 echo "===== STATUS CODES ====="

for code in "${!status_count[@]}"
 do
    echo "$code -> ${status_count[$code]} occurrences"
 done