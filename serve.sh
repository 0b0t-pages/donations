#!/usr/bin/env bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "$(basename "$0") <port>"
  exit 0
fi

command -v python >/dev/null 2>&1 && PYTHON=python
command -v python3 >/dev/null 2>&1 && PYTHON=python3

if [[ -z "$PYTHON" ]]; then
  echo "cant find no python, bye!"
  exit 1
fi

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)" || exit

if [[ -n "$1" ]]; then
  PORT="$1"
else
  PORT=42069
fi

$PYTHON -m http.server "$PORT" --bind 127.0.0.1
