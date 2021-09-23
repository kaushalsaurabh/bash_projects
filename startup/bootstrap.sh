#!/usr/bin/env bash

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
	echo -e "###### Installing $1 ########"

    shift
    DEBIAN_FRONTEND=noninteractive apt-get -y install "$@" >/dev/null 2>&1
}

sudo apt-get update

# install Git git


# install Postgresql postgresql postgresql-contrib
# sudo service postgresql start
# sudo -u postgres bash -c "psql -c \"CREATE DATABASE test;\""
# sudo -u postgres bash -c "psql -c \"CREATE USER tester WITH PASSWORD 'testerpassword';\""
# sudo -u postgres bash -c "psql -c \"ALTER ROLE tester CREATEROLE CREATEDB;\""
# sudo -u postgres bash -c "psql test -c \"create extension hstore;\""


echo '\0/ Installation cpomplete. Use "vagrant ssh" to ssh into container   ! \0/'
