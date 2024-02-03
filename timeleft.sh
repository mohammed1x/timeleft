#!/bin/bash

# Function to calculate time left
calculate_time_left() {
    # Get current time in 24-hour format
    current_time=$(date +"%H:%M")

    # Convert user input to 24-hour format
    user_input=$1
    if [[ $user_input == *pm ]]; then
        user_input=$(date -d "$user_input" +"%H:%M" -d 'tomorrow')
    else
        user_input=$(date -d "$user_input" +"%H:%M")
    fi

    # Calculate time difference in minutes
    time_diff=$(( $(date -d "$user_input" +%s) - $(date -d "$current_time" +%s) ))

    # If the calculated time difference is negative, add 24 hours (86400 seconds)
    if [[ $time_diff -lt 0 ]]; then
        time_diff=$((time_diff + 86400))
    fi

    # Convert time difference to hours and minutes
    hours=$((time_diff / 3600))
    minutes=$(( (time_diff % 3600) / 60 ))

    # Display the result
    echo "Time left for $1 is ${hours}hr${minutes}min"
}

# Main script
if [[ $1 == "timeleft" && $# -eq 2 ]]; then
    calculate_time_left $2
else
    echo "Usage: ./timeleft_script.sh timeleft [hh:mm am/pm]"
fi
