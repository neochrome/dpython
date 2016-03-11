#!/usr/bin/env bash
cd /src
if [[ $UID -eq 0 ]]; then
	su -m -c "eval \"$*\""
	exit $?
else
	existing_group=$(grep "\w*:x:$GID" /etc/group | sed 's/\(\w*\):.*/\1/')
	[[ -z "$existing_group" ]] && addgroup -g $GID pythonistas && existing_group=pythonistas
	adduser -u $UID -G $existing_group -s /bin/bash -Hh /src -D pythonista
	su -m pythonista -c "eval \"$*\""
	exit $?
fi
