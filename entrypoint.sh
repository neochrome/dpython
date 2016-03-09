#!/usr/bin/env bash
useradd -u $UID -g $GID -s /bin/bash -d /src -p pythonista pythonista || true
cd /src
su -m pythonista -c "eval \"$*\""
exit $?
