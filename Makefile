.DEFAULT_GOAL := default
SHELL = /usr/bin/env bash -eo pipefail



MKFILE_DIR = $(abspath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
LOCAL_DIR = $(MKFILE_DIR)/.local

BIN_DIR = $(LOCAL_DIR)/bin
TEMP_DIR = $(LOCAL_DIR)/tmp
DATA_DIR = $(LOCAL_DIR)/data
LOG_DIR = $(LOCAL_DIR)/logs



PLATFORM := $(shell if echo $$OSTYPE | grep -q darwin; then echo darwin; else echo linux; fi)



MONGO_VERSION =
MONGO_URL =


REACT_APP_VERSION = '3.4.1'




install-stack:
	echo '# mongo'
	echo '# node'
	echo '# npm'

install-deps:
	cd $(MKFILE_DIR)/app/client \
	&& npm install
	cd $(MKFILE_DIR)/app/server \
	&& npm install



run-db:
	mkdir -p $(LOG_DIR) $(DATA_DIR)/db
	mongod --config ./conf/mongod.conf


build:
	cd $(MKFILE_DIR)/app/client \
	&& rm -rf ./build \
	&& PUBLIC_URL=http://localhost:3000 \
	npm run build


run-local:
	cd $(MKFILE_DIR)/app/server \
	&& npm run dev


test:
	cd $(MKFILE_DIR)/app/client \
	&& npm run test
	cd $(MKFILE_DIR)/app/server \
	&& npm run test



test-local:
	cd $(MKFILE_DIR)/app/client \
	&& npm run test:dev





.PHONY: update-react-app-template
update-react-app-template:
	rm -rf $(TEMP_DIR)/npm-project-scope
	mkdir -p $(TEMP_DIR)/npm-project-scope
	cd $(TEMP_DIR)/npm-project-scope \
		&& npm install --save-dev react-scripts@$(REACT_APP_VERSION) \
		&& npm init react-app $(TEMP_DIR)/npm-project-scope/cra
	cp \
		$(TEMP_DIR)/npm-project-scope/cra/src/* \
		$(MKFILE_DIR)/app/client/src/
	cp \
		$(TEMP_DIR)/npm-project-scope/cra/public/* \
		$(MKFILE_DIR)/app/client/public/
	cp \
		$(TEMP_DIR)/npm-project-scope/cra/package.json \
		$(MKFILE_DIR)/app/client/
	rm -rf \
		$(MKFILE_DIR)/app/client/src/logo.svg
