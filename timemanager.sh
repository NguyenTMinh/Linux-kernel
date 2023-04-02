#!/bin/sh

# Check if a command is specified
if [ -z "$1" ]; then
    echo "Please specify a command."
    exit 1
fi

# Check if the user has root privileges
if [ "$(id -u)" != "0" ]; then
    echo "This command must be run as root."
    exit 1
fi

# Define functions for each command
info() {
    # Display the current time in the Asia/Ho_Chi_Minh timezone
    TZ="Asia/Ho_Chi_Minh" date
}

set-hour() {
    # Set the system time to a user-specified hour
    echo "Please enter the new time in the format hh:mm:ss:"
    read new_time
    date +%T -s "$new_time"
}

set-date() {
    # Set the system date to a user-specified date
    echo "Please enter the new date in the format yyyymmdd:"
    read new_date
    date +%Y%m%d -s "$new_date"
}

automatic() {
    # Synchronize the system time with the Microsoft time server
    echo "Updating the system time from the Microsoft time server..."
    ntpdate -4 time.windows.com
}

# Execute the user-specified command
case "$1" in
    "info") info ;;
    "set-hour") set-hour ;;
    "set-date") set-date ;;
    "automatic") automatic ;;
    *) echo "Invalid command." ;;
esac

exit 0

