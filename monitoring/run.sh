#!/bin/bash

declare -a arr=("grafana")
len=${#arr[@]}

function apply {

   for i in "${arr[@]}"
   do
      echo "Running $i"
      cd $i
      bash run.sh apply
      cd ..
   done

}

function delete {

   # Loop through the array in reverse order
   for (( i=$len-1; i>=0; i-- ))
   do
      echo "Running ${arr[i]}"
      cd "${arr[i]}"
      bash run.sh delete
      cd ..
   done
}

if [ "$1" == "apply" ]; then
   apply
elif [ "$1" == "delete" ]; then
   delete
else
   echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
