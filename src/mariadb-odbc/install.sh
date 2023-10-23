#!/bin/sh
set -e

echo "Activating feature 'mariadb-odbc'"

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

# Inspired from  https://github.com/JuliaDatabases/ODBC.jl/blob/main/test/runtests.jl
curl -O https://downloads.mariadb.com/Connectors/odbc/connector-odbc-3.1.19/mariadb-connector-odbc-3.1.19-ubuntu-focal-amd64.tar.gz
mkdir -p /usr/local/lib/mariadb64
tar xfz mariadb-connector-odbc-3.1.19-ubuntu-focal-amd64.tar.gz -C /usr/local/lib/mariadb64
