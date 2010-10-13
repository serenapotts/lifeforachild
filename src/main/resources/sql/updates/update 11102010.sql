CREATE TABLE child_versions LIKE child;
ALTER TABLE child_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;
 
CREATE TABLE clinical_record_versions LIKE clinical_record;
ALTER TABLE clinical_record_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;

CREATE TABLE user_versions LIKE user;
ALTER TABLE user_versions MODIFY COLUMN id BIGINT(20) NOT NULL, DROP PRIMARY KEY;

DELIMITER $$
CREATE TRIGGER child_Trigger
BEFORE UPDATE ON child
FOR EACH ROW
BEGIN
INSERT INTO child_versions (SELECT * FROM child WHERE id = OLD.id);
END$$

DELIMITER $$
CREATE TRIGGER clinical_record_Trigger
BEFORE UPDATE ON clinical_record
FOR EACH ROW
BEGIN
INSERT INTO clinical_record_versions (SELECT * FROM clinical_record WHERE id = OLD.id);
END$$

DELIMITER $$
CREATE TRIGGER user_Trigger
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN
INSERT INTO user_versions (SELECT * FROM user WHERE id = OLD.id);
END$$