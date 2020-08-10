CREATE TABLE
IF NOT EXISTS accountss
(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR
(50) UNIQUE NOT NULL,
    password VARCHAR
(50) NOT NULL,
    email VARCHAR
(255) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP
);

-- DROP TABLE IF EXISTS roles;
CREATE TABLE
IF NOT EXISTS roles
(
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR
(255) UNIQUE NOT NULL
);

CREATE TABLE
IF NOT EXISTS accountss_roles
(
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    grant_date TIMESTAMP,
    PRIMARY KEY
(user_id, role_id),
    FOREIGN KEY
(role_id) REFERENCES roles
(role_id),
    FOREIGN KEY
(user_id) REFERENCES accountss
(user_id)
);