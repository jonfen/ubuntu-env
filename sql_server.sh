#!/bin/bash

# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-2017
# https://docs.microsoft.com/en-us/sql/connect/jdbc/using-kerberos-integrated-authentication-to-connect-to-sql-server?view=sql-server-2017
# https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-2017

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update 
sudo apt-get -y install mssql-tools unixodbc-dev libunwind8

# cd ~/Downloads
# sudo dpkg -i ./Downloads/azuredatastudio-linux-<version string>.deb


