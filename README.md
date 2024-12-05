# ODC_Script
Orange Digital Center tasks (Bash scripting) 

# System Monitoring Script

This script is designed to monitor various system metrics on a Linux machine, such as disk usage, CPU usage, memory usage, and running processes. It collects the information and saves it to a log file. Additionally, the script sends the log file as an email to a specified address.

## Features

- **Disk Usage Report**: Checks the disk usage of all mounted partitions and warns if usage exceeds a specified threshold (default: 80%).
- **CPU Usage Report**: Displays the current CPU usage percentage.
- **Memory Usage Report**: Shows the total, used, and free memory.
- **Top Memory-Consuming Processes**: Displays the top 5 processes consuming the most memory.
- **Email Notification**: Sends the collected data to a specified email address.
