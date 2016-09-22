#!/usr/bin/env bash
set -e

if [[ "$1" = 'mf2005' ]] && [[ "$#" -eq 1 ]]; then
    echo "### RUNNING TESTS ###"
    cd /Unix/test-run
    while read line; do
        echo "RUN: $line"
        gosu root mf2005 $line;
    done < <(ls *.nam /Unix/test-run -1)
else
    gosu root exec "$@"
fi

