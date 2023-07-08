#!/bin/bash

function _wikipdf() {
    local words=($@)
    for word in "${words[@]}"; do
        wget "en.wikipedia.org/api/rest_v1/page/pdf/$word" && mv "./$word" "./$word.pdf" && mpack -s "convert" -a "./$word.pdf" mail@gmail.com
    done
}

# Check if arguments are provided
if [ $# -ge 1 ]; then
    _wikipdf "$@"
else
    echo "Please provide at least one value as an argument."
fi
