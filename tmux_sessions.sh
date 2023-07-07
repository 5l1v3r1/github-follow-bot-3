#!/bin/bash

# Function to run the script for the specified letter
run_script_for_letter() {
    letter=$1
    session_name="session_${letter}"
    tmux new-session -d -s "$session_name"
    tmux send-keys -t "$session_name" "bash askuser.sh $letter" Enter
    echo "Created tmux session: $session_name"
}

# Main script
while true; do
    read -p "Enter the desired letter (or 'q' to quit): " letter
    if [[ $letter == "q" ]]; then
        echo "Exiting the script."
        break
    fi

    if [[ $letter =~ [a-zA-Z] ]]; then
        session_name="session_${letter}"
        if ! tmux has-session -t "$session_name" 2>/dev/null; then
            run_script_for_letter "$letter"
        else
            echo "Session for letter '$letter' already exists. Skipping..."
        fi
    else
        echo "Invalid input. Please enter a single letter or 'q' to quit."
    fi
done
