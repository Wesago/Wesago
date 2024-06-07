#!/bin/bash

# test using the following commands and all pids necessary
# ps aux
# kill -SIGSTOP <pid>

# File to store the logs
log_file=/var/log/rsyslog/healthcheck.log

# Time to wait between each iteration
sleep_time=120

while true
do
    ingresses=("wesago.k3s")

    for ingress in "${ingresses[@]}"
    do
        # switch case with the initial pod name
        case $ingress in
            wesago.k3s)
                # Check if the pod is accessible from the network
                if ! code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 20 http://$ingress/) || [ $code -ne 200 ]; then
                    if [ -z "$code" ]; then
                        printf "Checking Ingress: $ingress - Not Healthy (curl failed)\n" >> $log_file
                    else
                        printf "Checking Ingress: $ingress - Not Healthy (HTTP $code)\n" >> $log_file
                    fi
                else
                    printf "Checking Ingress: $ingress - Healthy (HTTP $code)\n" >> $log_file
                fi
                ;;
            *)
                printf "Checking Ingress: $ingress - Health Check not implemented yet\n" >> $log_file
                ;;
        esac

        # Wait for the next iteration
        sleep $sleep_time
    done
    
done
