# Log Analysis Tool

A Bash-based log analysis project that parses server log files, extracts important information using Regular Expressions, and generates summarized reports for monitoring and troubleshooting.

---

## 📌 Project Overview

This project analyzes server log files such as Apache or Nginx logs and generates useful insights like:

- Most frequent IP addresses
- HTTP status code counts
- Error detection (404, 500, etc.)
- Request statistics
- Automated report generation

The project is built completely using Bash scripting and Linux command-line utilities.

---

# 🚀 Features Implemented

## ✅ Step 1 – Log File Handling
- Read and process log files
- Validate file existence
- Handle invalid input files

## ✅ Step 2 – Regex Parsing
- Extract IP addresses
- Extract HTTP status codes
- Parse log entries using Regular Expressions

## ✅ Step 3 – Report Generation
- Count unique IP addresses
- Identify most active IPs
- Generate status code summary
- Detect common errors

## ✅ Step 4 – Automation & Improvements
- Added modular scripting structure
- Improved error handling
- Added command-line argument support
- Added support for multiple log files
- Optimized parsing logic

## 🔄 Step 5 – In Progress
Planned enhancements:
- Colored terminal output
- Chart/report visualization
- Cron job scheduling
- Advanced automation
- Performance optimization

---

# 🛠️ Technologies Used

- Bash Scripting
- Linux Command Line Tools
- Regular Expressions (Regex)
- awk
- grep
- sed
- sort
- uniq

---

# 📂 Project Structure

```bash
log-analysis-tool/
│
├── logs/
│   └── sample.log
│
├── scripts/
│   ├── analyze.sh
│   ├── parser.sh
│   ├── report.sh
│   └── utils.sh
│
├── reports/
│   └── report.txt
│
├── README.md
└── LICENSE