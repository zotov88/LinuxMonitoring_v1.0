#!/bin/bash

if [ $# -eq 1 ]; then
    . ./filter.sh
    OUT=$?
    if [[ $OUT == 1 ]]; then
        echo "parameter is not be number"
        elif [[ $OUT == 2 ]]; then
        echo "parameter is not be floating point number"
    else
        echo $1
    fi
else
    echo "must be only one parameter"
fi
