#!/bin/bash

# Function to calculate time left
calculate_time_left() {
    # Get current time in minutes since midnight
    current_time=$(date +"(%H*60)+%M")

    # Convert user input to minutes since midnight
    user_input=$1
    user_input=$(date -d "$user_input" +"(%H*60)+%M")

    # Calculate time difference in minutes
    time_diff=$((user_input - current_time))

    # If the calculated time difference is negative, add 24 hours (1440 minutes)
    if [[ $time_diff -lt 0 ]]; then
        time_diff=$((time_diff + 1440))
    fi

    # Convert time difference to hours and minutes
    hours=$((time_diff / 60))
    minutes=$((time_diff % 60))

    # Display the result
    echo "Time left for $1 is ${hours}hr${minutes}min"
}

# Main script
if [[ $1 == "timeleft" && $# -eq 2 ]]; then
    calculate_time_left "$2"
else
    echo "Usage: ./timeleft_script.sh timeleft [hh:mm am/pm]"
fi
