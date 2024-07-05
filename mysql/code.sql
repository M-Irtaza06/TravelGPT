CREATE TABLE code_tb (
    cd VARCHAR(10) NOT NULL,
    upper_cd VARCHAR(10),
    cd_nm VARCHAR(100),
    val1 VARCHAR(50),
    val2 VARCHAR(50),
    sort_order INT,
    use_yn CHAR(1) DEFAULT 'Y',
    city_cd VARCHAR(2) DEFAULT 'JJ',
    cd_nm_eng VARCHAR(1000) DEFAULT '',
    PRIMARY KEY (cd)
) COLLATE = utf8_bin;
ALTER TABLE code_tb ADD CONSTRAINT pk_code_tb PRIMARY KEY (cd);

-- Creating Index on code_tb
CREATE INDEX i_code_tb_upper_cd_use_yn_city_cd ON code_tb (upper_cd, use_yn, city_cd);