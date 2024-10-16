#!/bin/bash
# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

docker exec -it $DB_NAME mysql -uroot -p$DB_PASSWORD -h127.0.0.1 -e "

CREATE SCHEMA auth_db;

USE auth_db;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

INSERT INTO users (username, password) VALUES ('testuser', 'testpassword');
"