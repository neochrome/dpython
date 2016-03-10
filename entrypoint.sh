#!/usr/bin/env bash
cd /src
if [[ $UID -eq 0 ]]; then
	su -m -c "eval \"$*\""
	exit $?
else
	useradd -u $UID -g $GID -s /bin/bash -d /src -p pythonista pythonista || true
	su -m pythonista -c "eval \"$*\""
	exit $?
fi
