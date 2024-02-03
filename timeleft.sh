#!/bin/bash

# Function to calculate time left
calculate_time_left() {
    # Get current time in minutes since midnight
    current_time=$(date +"(%H*60)+%M")

    # Convert user input to minutes since midnight using Python
    user_input=$(python3 -c "from datetime import datetime, timedelta; print((datetime.strptime('$1', '%I:%M').hour * 60) + datetime.strptime('$1', '%I:%M').minute)")

    # If the user input is in the past, add 24 hours (1440 minutes)
    if [[ $user_input -lt $current_time ]]; then
        user_input=$((user_input + 1440))
    fi

    # Calculate time difference in minutes
    time_diff=$((user_input - current_time))

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
