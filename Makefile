DEFAULT_GOAL := build

build:
	@docker build --tag neochrome/dpython:latest .

update:
	@docker pull neochrome/dpython:latest

install:
	@echo Installing to /usr/bin
	@install -Dm755 dpython.sh /usr/bin/dpython
	@install -Dm755 dpip.sh /usr/bin/dpip
