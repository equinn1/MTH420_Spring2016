DROP TABLE mth420;

CREATE TABLE IF NOT EXISTS mth420 (      
    user_id        VARCHAR(16) NOT NULL PRIMARY KEY,
    fname          VARCHAR(32) DEFAULT NULL,
    lname          VARCHAR(48) DEFAULT NULL
    ) ENGINE=InnoDB;

