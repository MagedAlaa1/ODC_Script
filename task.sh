#!/bin/bash
logfile= "logfile.log"
limit=80

disk_usage=$(df -h | awk 'NR>1 {print $5 " " $6}')

echo "Disk Usage Report:-->>" > "$logfile"

while read -r usage; do
  percentage=$(echo "$usage" | awk '{print $1}' | sed 's/%//')
  partition=$(echo "$usage" | awk '{print $2}')
  
  echo "Partition: $partition, Usage: $percentage%" >> "$logfile"
  
  # Check
  if [ "$percentage" -ge "$limit" ]; then
    echo "WARNING: Usage on $partition has exceeded $limit%!" >> "$logfile"
  fi
done <<< "$disk_usage"

echo "-----------------------" >> "$logfile"

echo "CPU Usage Report-->>" >> "$logfile"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "Current CPU Usage: $cpu_usage%">> "$logfile"
echo "------------------">> "$logfile"
read total used free <<< $(free -m | awk '/Mem:/ {print $2, $3, $4}')
echo "Total Memory: ${total} MB">> "$logfile"
echo "Used Memory: ${used} MB">> "$logfile"
echo "Free Memory: ${free} MB">> "$logfile"

echo "Top 5 Memory-Consuming Processes:">> "$logfile"
echo "---------------------------------">> "$logfile"
ps aux --sort=-%mem | head -n 6 | awk '{printf "%-10s %-8s %-8s %-50s\n", $1, $2, $4, $11}' | sed '1iUSER   PID   %MEM  COMMAND' >> "$logfile"

echo "log file is saved to $logfile"

