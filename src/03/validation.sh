#!/bin/bash

function isValidArguments {
    if [[ $1 =~ ^[1-6]$ && $2 =~ ^[1-6]$ && $3 =~ ^[1-6]$ && $4 =~ ^[1-6]$ ]]; then
        return 0
    else
        return 1
    fi
}

function isValidColors {
    if [[ $1 != $2 && $3 != $4 ]]; then
        return 0
    else
        return 1
    fi
}