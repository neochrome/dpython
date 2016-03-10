#!/usr/bin/env bash
tty=
[[ -t 0 ]] && tty=--tty

whitespace="[[:space:]]"
args=()
for arg in "$@"
do
	if [[ $arg =~ $whitespace ]]
	then
		arg=\'$arg\'
	fi
	args+=("$arg")
done

env_file=$(mktemp)
compgen -v | while read var; do
  [[ $var =~ ^(LC_|PATH|SHELL|TERM) ]] && continue
	echo $var
done | tee $env_file > /dev/null

docker pull neochrome/dpython:latest
docker run \
	--interactive \
	$tty \
	--rm \
	--net host \
	--volume "$PWD:/src:rw" \
	--env-file $env_file \
	--env "UID=$(id -u)" \
	--env "GID=$(id -g)" \
	neochrome/dpython:latest \
	python "${args[@]}"
exit_code=$?

rm -rf $env_file
exit $exit_code
