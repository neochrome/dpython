DEFAULT_GOAL := build

build:
	@docker build --tag neochrome/dpython:latest .

update:
	@docker pull neochrome/dpython:latest

install:
	@echo Installing to /usr/bin
	@install -m755 run.sh /usr/bin/dpython
	@install -m755 run.sh /usr/bin/dpip

clean:
	@docker rmi neochrome/dpython
