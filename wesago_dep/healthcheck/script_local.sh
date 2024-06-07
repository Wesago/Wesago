#!/bin/bash

# test using the following commands and all pids necessary
# ps aux
# kill -SIGSTOP <pid>

# File to store the logs
log_file=/var/log/rsyslog/healthcheck.log

# Time to wait between each iteration
sleep_time=30

# while true
while true
do
    # Get the list of pods in the namespace
    pods=$(kubectl get pods -n gic-wesago -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.status.phase}{" "}{.metadata.creationTimestamp}{" "}{.status.podIP}{"\n"}{end}')

    # Loop through the list of pods
    while read -r pod phase creation_time pod_ip
    do
        # Check if the pod is running, otherwise there is no need to check its health
        if [ $phase == "Running" ]; then

            # Calculate the time elapsed since the pod was created
            creation_time=$(echo $creation_time | sed 's/T/ /' | sed 's/Z//')   # replace the T in the creation time with a space and remove the Z at the end
            time_elapsed=$(( $(date -u +%s) - $(date -u -d "$creation_time" +%s) ))

            # if it was created less than X seconds ago, skip the health check
            if [ $time_elapsed -lt 60 ]; then
                printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Recently created\n" >> $log_file
                continue
            fi

            # switch case with the initial pod name
            case $pod in
                wesago-django-*)
                    # Check if the pod is accessible from the network
                    if ! code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 http://$pod_ip:8000/) || [ $code -ne 200 ]; then
                        if [ -z "$code" ]; then
                            printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Not Healthy (curl failed)\n" >> $log_file
                        else
                            printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Not Healthy (HTTP $code)\n" >> $log_file
                        fi
                        # Restart the pod - Graceful deletion means that the pod will be forcibly terminated after the time specified
                        kubectl delete pod $pod -n gic-wesago --grace-period=2
                    else
                        printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Healthy (HTTP $code)\n" >> $log_file
                    fi
                    ;;
                postgres-*)
                    # Check if the pod is accessible from the network

                    # Expected output of the command
                    expected_output="?column? ---------- 1 (1 row)"

                    if [ "$expected_output"="$(PGPASSWORD=$PSQL_PASSWORD psql -h $pod_ip -U postgres -d postgres -c 'SELECT 1')" ]; then
                        printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Healthy\n" >> $log_file
                    else
                        printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Not Healthy (psql failed)\n" >> $log_file
                        # Restart the pod - Graceful deletion means that the pod will be forcibly terminated after the time specified
                        kubectl delete pod $pod -n gic-wesago --grace-period=2
                    fi
                    ;;
                redis-*)
                    # Check if the pod is accessible from the network

                    # Expected output of the command
                    expected_output="PONG"

                    if [ "$expected_output"="$(redis-cli -h $pod_ip ping)" ]; then
                        printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Healthy\n" >> $log_file
                    else
                        printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Not Healthy (redis-cli failed)\n" >> $log_file
                        # Restart the pod - Graceful deletion means that the pod will be forcibly terminated after the time specified
                        kubectl delete pod $pod -n gic-wesago --grace-period=2
                    fi
                    ;;
                *)
                    printf "Checking Pod: $pod Phase: $phase Time Elapsed: $time_elapsed IP: $pod_ip - Health Check not implemented yet\n" >> $log_file
                    ;;
            esac
        fi

    done <<< "$pods"

    # Wait for the next iteration
    sleep $sleep_time
done
