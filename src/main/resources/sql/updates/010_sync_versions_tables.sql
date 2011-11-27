DROP TABLE child_versions;
DROP TABLE clinical_record_versions;
DROP TABLE user_versions;

CREATE TABLE child_versions LIKE child;
ALTER TABLE child_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;
 
CREATE TABLE clinical_record_versions LIKE clinical_record;
ALTER TABLE clinical_record_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;

CREATE TABLE user_versions LIKE user;
ALTER TABLE user_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;