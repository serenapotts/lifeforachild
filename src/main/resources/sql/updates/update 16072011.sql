alter table user add column old_username varchar(255) DEFAULT NULL;
drop table user_versions;
CREATE TABLE user_versions LIKE user;
ALTER TABLE user_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;