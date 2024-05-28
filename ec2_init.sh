#!/bin/bash

apt update

# Install required packages
apt-get install -y nodejs npm
apt-get install -y mysql-client
apt-get install -y mysql-server

MYSQL_ROOT_PASSWORD="abcd1234"

# Create the necessary database and tables
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE my_db; \
    USE my_db; \
    CREATE TABLE users ( \
        id INT AUTO_INCREMENT PRIMARY KEY, \
        username VARCHAR(50) NOT NULL, \
        password VARCHAR(255) NOT NULL \
    ); \
    CREATE TABLE todos ( \
        id INT AUTO_INCREMENT PRIMARY KEY, \
        user_id INT, \
        text TEXT NOT NULL, \
        FOREIGN KEY (user_id) REFERENCES users(id) \
    );"

# Update root user's authentication method
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'abcd1234';"
# Attention: Please note that the password is currently stored in plain text. 
# This practice is considered insecure and is not recommended for production environments.
# To improve security, explore alternatives such as utilizing AWS Secret Manager to store and manage sensitive credentials securely.


# Clone the GitHub repository
git clone git@github.com:jackythesmurf/waf-demo.git

# Navigate to the cloned repository
cd waf-cl-todo-list-app/

# Install dependencies and run the Node.js application
npm install
node final.js
