#!/bin/bash

# Function to calculate time left
calculate_time_left() {
    # Get current time in 24-hour format
    current_time=$(date +"%H:%M")

    # Convert user input to 24-hour format
    user_input=$1
    user_input=$(date -d "$user_input" +"%H:%M")

    # Get today's date and time for user input
    user_input_date=$(date -d "$user_input" +"%Y-%m-%d $user_input")

    # Get tomorrow's date and time for user input
    tomorrow_user_input_date=$(date -d "$user_input" +"%Y-%m-%d $user_input" -d 'tomorrow')

    # Get current date and time
    current_date=$(date +"%Y-%m-%d $current_time")

    # Calculate time difference in minutes
    time_diff=$(( $(date -d "$tomorrow_user_input_date" +%s) - $(date -d "$current_date" +%s) ))

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
