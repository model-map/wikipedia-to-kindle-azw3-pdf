#!/bin/bash

function _wikipdf() {
    wget "en.wikipedia.org/api/rest_v1/page/pdf/$1" && mv ./$1 ./$1.pdf && mpack -s "convert" -a ./$1.pdf [mail]@kindle.com
}

# Check if an argument is provided
if [ $# -eq 1 ]; then
    _wikipdf "$1"
else
    echo "Please provide a value as an argument."
fi

