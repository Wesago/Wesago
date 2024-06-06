#!/bin/bash

declare -a arr=("website_dep/" "wesago_dep/" "monitoring/grafana/")

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

   for i in "${arr[@]}"
   do
      echo "Running $i"
      cd $i
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


