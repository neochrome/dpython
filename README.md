# dpython
Dockerized python & pip


## Installation
```
$ git clone https://github.com/neochrome/dpython
$ cd dpython
$ sudo make install
```


## Usage
Launching the python REPL:
```
$ dpython
```

Installing modules from `requirements.txt`:
```
$ dpip install -r requirements.txt
```
**Note:** this will create a `.pip` folder in the
current working directory to hold installed modules.


## Building locally
A pre-built image exists on Docker Hub, but if you
want to, it's easy to build a local image:
```
$ cd dpython
$ make
```


## Updating local image
In order to force an update of the docker image, run:
```
$ make update
```
