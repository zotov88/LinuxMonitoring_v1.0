#!/bin/bash
. ./info_about_system.sh
. ./validation.sh

if [[ $# -eq 4 ]]; then
    isValidArguments $1 $2 $3 $4
    if [[ $? -eq 0 ]]; then
        isValidColors $1 $2 $3 $4
        if [[ $? -eq 0 ]]; then
            echo "$(getInfo $1 $2 $3 $4)"
        else
            echo -n "The font and background colours of one column must not match. Try again? [Y/n]"
            read ANSWER
            yesOrNot $ANSWER
            if [[ $? -eq 0 ]]; then
                echo "input 4 parameters"
                read one two tree four
                . ./main.sh $one $two $tree $four
            fi
        fi
    else
        echo "Parameters must be numbers between 1 and 6 inclusive."
    fi
else
    echo "You can get 4 parameters."
fi
