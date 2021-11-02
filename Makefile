.PHONY: bundle db-setup start

default: help

bundle: #: Install bundle
	bundle install

db-setup: #: Setup DB
	rails db:setup

start: #: Start server
	rails s

help: #: Show help topics
	@grep "#:" Makefile* | grep -v "@grep" | sort | sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/$$(tput setaf 3)\1$$(tput sgr0)\2/g"
