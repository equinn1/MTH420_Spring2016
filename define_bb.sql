DROP TABLE respitem;
DROP TABLE question;
DROP TABLE pool;
DROP TABLE attempt;
DROP TABLE outcomedef;
DROP TABLE coursememb;
DROP TABLE users;
DROP TABLE course;

CREATE TABLE IF NOT EXISTS course (
    parent_context_id  VARCHAR(24)  NOT NULL PRIMARY KEY,
    course_name        VARCHAR(32)  NOT NULL
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pool (
    pool_id     VARCHAR(16) NOT NULL PRIMARY KEY,
    pool_name   VARCHAR(80) NOT NULL,
    section_id  VARCHAR(16) DEFAULT NULL,
    parent_context_id   VARCHAR(24),
    CONSTRAINT `fk_pcid` 
            FOREIGN KEY (parent_context_id) REFERENCES course (parent_context_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS question (
    item_id     VARCHAR(16) NOT NULL PRIMARY KEY,
    item_name   VARCHAR(80) NOT NULL,
    pool_id     VARCHAR(16),
    CONSTRAINT `fk_pid` 
            FOREIGN KEY (pool_id) REFERENCES pool (pool_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users (      
    user_id        VARCHAR(16) NOT NULL PRIMARY KEY,
    fname          VARCHAR(32) DEFAULT NULL,
    mname          VARCHAR(24) DEFAULT NULL,
    lname          VARCHAR(48) DEFAULT NULL
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS coursememb (
    cm_id          VARCHAR(16) NOT NULL PRIMARY KEY,      
    user_id        VARCHAR(16) NOT NULL,
    parent_context_id  VARCHAR(24),
    CONSTRAINT `fk_cm` 
            FOREIGN KEY (user_id) REFERENCES users (user_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT,
    CONSTRAINT `fk_cmpc` 
            FOREIGN KEY (parent_context_id) REFERENCES course (parent_context_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS outcomedef (
    ocd_id      VARCHAR(16) NOT NULL PRIMARY KEY,
    title       VARCHAR(80) NOT NULL,
    parent_context_id  VARCHAR(24),
    CONSTRAINT `fk_ocdef` 
            FOREIGN KEY (parent_context_id) REFERENCES course (parent_context_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS attempt (
    at_id       VARCHAR(16) NOT NULL PRIMARY KEY,
    date_added  DATETIME    DEFAULT NULL,
    date_att    DATETIME    DEFAULT NULL,
    date_fg     DATETIME    DEFAULT NULL,
    ocd_id      VARCHAR(24),
    CONSTRAINT `fk_att` 
            FOREIGN KEY (ocd_id) REFERENCES outcomedef (ocd_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS respitem (
    resp_id     VARCHAR(16) NOT NULL PRIMARY KEY,
    response    VARCHAR(24) NOT NULL,
    creatime    DATETIME    DEFAULT NULL,
    date_att    DATETIME    DEFAULT NULL,
    date_fg     DATETIME    DEFAULT NULL,
    autograde   FLOAT       DEFAULT NULL,
    manualgrade FLOAT       DEFAULT NULL,
    save_time   DATETIME    DEFAULT NULL,
    item_id    VARCHAR(24),
    CONSTRAINT `fk_ritm` 
            FOREIGN KEY (item_id) REFERENCES question (item_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
    ) ENGINE=InnoDB;

GRANT INSERT,DELETE,SELECT ON course TO gquinn;
GRANT INSERT,DELETE,SELECT ON pool TO gquinn;
GRANT INSERT,DELETE,SELECT ON question TO gquinn;
GRANT INSERT,DELETE,SELECT ON users TO gquinn;
GRANT INSERT,DELETE,SELECT ON coursememb TO gquinn;
GRANT INSERT,DELETE,SELECT ON attempt TO gquinn;
GRANT INSERT,DELETE,SELECT ON respitem TO gquinn;

INSERT INTO course (parent_context_id,course_name)
   VALUES ("20155.201520","MTH125_Fall2014");



