Lecture: DevOps - application
=============================


This repository contains the [application](./app/README.md) that should be used as *deployable workload* in the
[exercise](https://github.com/lucendio/lecture-devops-material/blob/master/exercise.md) implementation.  


### Getting started 

For more information on the app, please have a look into its [README](./app/README.md).
The `Makefile` is the main entry point for this repository. It's meant to be used for documentation purposes and local
 invokation only. The following the following commands are available:


#### `make install-deps`

* install npm dependencies for server and client


#### `make build`

* start a local mongo database


#### `make run-db`

* start a local mongo database


#### `make run-local`

* start server with development configuration
* file watcher enabled


#### `make test-local`

* run client tests


#### `make test`

* run client tests in [CI mode](https://jestjs.io/docs/en/cli.html#--ci) (exits regardless of the test outcome; closed tty)
* run server tests in [CI mode](https://jestjs.io/docs/en/cli.html#--ci) (exits regardless of the test outcome; closed tty)


### Notes

* the `Makefile` shows how to interact with the code base, it is not recommended to invoke make targets from the CI/CD,
but rather use automation-specific interfaces (e.g. `Jenkinsfile`, `.travis.yml`, etc.). 
