ALTER TABLE `life_for_a_child`.`clinical_record` MODIFY COLUMN `creatinine_value` FLOAT DEFAULT NULL,
 MODIFY COLUMN `hba1c_percentage` FLOAT DEFAULT NULL,
 MODIFY COLUMN `hdl_cholesterol_value` FLOAT DEFAULT NULL,
 MODIFY COLUMN `microalbuminuria_value` FLOAT DEFAULT NULL,
 MODIFY COLUMN `total_cholesterol_value` FLOAT DEFAULT NULL,
 MODIFY COLUMN `triglycerides_value` FLOAT DEFAULT NULL,
 MODIFY COLUMN `tuning_fork_abnormal` INT(11),
 MODIFY COLUMN `weightkg` FLOAT DEFAULT NULL;