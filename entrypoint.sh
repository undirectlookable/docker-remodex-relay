#!/bin/sh
set -eu

cd /app/remodex/relay

child_pid=""

forward_term() {
  if [ -n "${child_pid}" ] && kill -0 "${child_pid}" 2>/dev/null; then
    kill -TERM "${child_pid}" 2>/dev/null || true
  fi
}

trap forward_term TERM INT

npm start &
child_pid=$!

wait "${child_pid}"
