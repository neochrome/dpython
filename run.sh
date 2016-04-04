#!/usr/bin/env bash
tty=
[[ -t 0 ]] && tty=--tty

case ${0##*/} in
	dpython)
		entrypoint=/usr/bin/python
		;;
	dpip)
		entrypoint=pip
		cmd=$1; shift
		case $cmd in
			install)
				opt=--target=/src/.pip
				;;
			*)
				opt=
				;;
		esac
		cmd="--no-cache-dir $cmd"
		;;
	*)
		echo "Unsupported tool-name: $0"
		exit 2
		;;
esac

args=()
for arg in "$@"
do
	if [[ $arg =~ "[[:space:]]" ]]
	then
		arg=\'$arg\'
	fi
	args+=("$arg")
done

env_keys="--env=PYTHONPATH=/src/.pip"
for var in $(env); do
	[[ $var =~ ^(LC_|PATH|SHELL|TERM|PYTHONPATH|USER|HOME|PWD) ]] && continue
	env_keys="$env_keys --env=${var%%=*}"
done

case "$OSTYPE" in
	darwin*) user='';;
	linux*) user="--user $(id -u):$(id -g)";;
	*) echo "Unsupported os: $OSTYPE"; exit 1;;
esac

docker run \
	--interactive \
	$tty \
	--rm \
	--net host \
	$user \
	--volume "$(pwd):/src:rw" \
	--workdir /src \
	--entrypoint $entrypoint \
	$env_keys \
	neochrome/dpython:latest \
	$cmd $opt "${args[@]}"

exit $?
