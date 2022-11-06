CREATE DATABASE test_db;

USE test_db;

CREATE TABLE tbl_messages(
    id INT AUTO_INCREMENT,
    message VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

-- In this stored procedure, the definer is root@localhost that is the superuser which has all privileges.
-- The SQL Security is set to the definer. It means that any user account which calls this stored procedure will execute with all privileges of the definer i.e., root@localhost user account.
DELIMITER$$
    CREATE DEFINER = root@localhost PROCEDURE InsertMessage(msg VARCHAR(100))
    SQL SECURITY DEFINER
    BEGIN
        INSERT INTO tbl_messages(message)
        VALUES(msg);
    END$$

DELIMITER;

CREATE USER dev@localhost IDENTIFIED BY 'Abcd1234';

GRANT EXECUTE ON test_db.* TO dev@localhost;

-- use command line run     mysql -u root -p    
-- enter password: 12345678 (password at when install mysql)

-- OR

-- mysql -u dev -p / enter pass: Abcd1234

----------
USE test_db;

DROP PROCEDURE IF EXISTS UpdateMessage;

DELIMITER$$
    CREATE DEFINER = root@localhost
    PROCEDURE UpdateMessage(
        msgId INT,
        msg VARCHAR(100)
    )
    SQL SECURITY INVOKER
    BEGIN
        UPDATE tbl_messages
        SET message = msg
        WHERE id = msgId;

    END;

DELIMITER;

