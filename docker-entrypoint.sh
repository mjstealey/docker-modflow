#!/usr/bin/env bash
set -e

# if WORKER_UID and WORKER_GID are not set, then run as root user
if [[ -z "$WORKER_UID" ]] && [[ -z "$WORKER_GID" ]]; then
    if [[ "$1" = 'mf2005' ]] && [[ "$#" -eq 1 ]]; then
        echo "### RUNNING TESTS ###"
        cd /Unix/test-run
        while read line; do
            echo "RUN: $line"
            gosu root mf2005 $line;
        done < <(ls /Unix/test-run | grep .nam)
    else
        gosu root "$@"
    fi
# if WORKER_UID and WORKER_GID are set, then run as worker user
elif [[ ! -z "$WORKER_UID" ]] || [[ ! -z "$WORKER_GID" ]]; then
    if [[ ! -z "$WORKER_UID" ]]; then
        gosu root usermod -u ${WORKER_UID} worker
        gosu root chown worker:worker -R /Unix/test-run
    fi
    if [[ ! -z "$WORKER_GID" ]]; then
        gosu root groupmod -g ${WORKER_GID} worker
        gosu root chown worker:worker -R /Unix/test-run
    fi
    if [[ "$1" = 'mf2005' ]] && [[ "$#" -eq 1 ]]; then
        echo "### RUNNING TESTS ###"
        cd /Unix/test-run
        while read line; do
            echo "RUN: $line"
            gosu worker mf2005 $line;
        done < <(ls /Unix/test-run | grep .nam)
    else
        gosu worker "$@"
    fi
fi

exit 0;