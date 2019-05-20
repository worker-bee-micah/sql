CREATE TABLE pirates
(
    pirate_id       NUMBER(7)     NOT NULL,
    nick_name       VARCHAR2(31)  NOT NULL,
    last_name       VARCHAR2(31)  NOT NULL,
    eye_patch       VARCHAR2(1)   DEFAULT 'T' NOT NULL, 
    email           VARCHAR2(128) NOT NULL,
    phone           VARCHAR2(21)  NOT NULL,
    berth_date      DATE          NULL,
    home_port       VARCHAR2(31)  NULL,
    port_country    VARCHAR2(3)   NULL,
    active_code     VARCHAR2(1)   DEFAULT 'A' NOT NULL,
    CONSTRAINT pk_pirates PRIMARY KEY (pirate_id)
    CONSTRAINT ck_pirates_table_eye_patch
        CHECK (eye_patch is 'T' or 'F')

);