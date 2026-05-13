#!/bin/bash

LOG_FILE="../logs/access.log"
REPORT_FILE="../reports/analysis_report.txt"

mkdir -p ../reports

> "$REPORT_FILE"

echo "===== LOG ANALYSIS REPORT =====" >> "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")

echo "Total Requests: $TOTAL_REQUESTS" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Top 5 IP Addresses:" >> "$REPORT_FILE"

grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG_FILE" \
| sort \
| uniq -c \
| sort -nr \
| head -5 >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "HTTP Status Code Summary:" >> "$REPORT_FILE"

\
| sort -nr >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Suspicious IPs (More than 100 Requests):" >> "$REPORT_FILE"

grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG_FILE" \
| sort \grep -oE '" [0-9]{3} ' "$LOG_FILE" \
| grep -oE '[0-9]{3}' \
| sort \
| uniq -c 
| uniq -c \
| awk '$1 > 100' >> "$REPORT_FILE"

cat "$REPORT_FILE"