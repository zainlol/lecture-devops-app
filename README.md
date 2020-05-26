Lecture: DevOps - application
=============================


This repository contains the [application](./app/README.md) that should be used as *deployable workload* in the
[exercise](https://github.com/lucendio/lecture-devops-material/blob/master/exercise.md) implementation.  


### Getting started 

For more information regarding the app, please have a look into its [README](./app/README.md).

The `Makefile` is the main entry point for this repository. It's meant to be used for documentation purposes and local
development/invocation only. The following commands are available:

*NOTE:*

The `Makefile` is solely meant to showcase how to interact with the application and the code base, it is not recommended
to invoke make targets from the CI/CD, but rather use automation-specific interfaces (e.g. `Jenkinsfile`, `.travis.yml`,
etc.), which would then invoke logic also shown under some make target. 


#### `make install-stack`

* install technology stack (Nodejs, npm, MongoDB) as prebuild binaries locally within the project
* in order for the application-related targets to pick up these binaries, the `PATH` variable is adjusted and exported
  for the corresponding target


#### `make install-deps`

* install npm dependencies for server and client


#### `make build`

* start a local mongo database


#### `make run-db`

* start a local mongo database


#### `make run-local`

*NOTE: it might be desired to start a database first (e.g. `make run-db`)*

* build client 
* start server with development configuration


#### `make test`

*NOTE: requires MongoDB to be running (e.g. `make run-db`)*

* run client tests in [CI mode](https://jestjs.io/docs/en/cli.html#--ci) (exits regardless of the test outcome; closed tty)
* run server tests in [CI mode](https://jestjs.io/docs/en/cli.html#--ci) (exits regardless of the test outcome; closed tty)


#### `make test-client-local`

* run client tests


#### `make build`

* build client


#### `make clean`

* removes all dependencies that were installed locally 
    * node, npm, mongo
    * npm modules for server and client


#### `make start`

* start a MongoDB process with an explicit inline-configuration
* start the application process with variables being set only visible to that invocation (as an alternative to the
  environment configuration file `app/server/dev.env`)
* block terminal to keep it as the output medium. To stop again, send a termination signal via `Ctrl+C`
