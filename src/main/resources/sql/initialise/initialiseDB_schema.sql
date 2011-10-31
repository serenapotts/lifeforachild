--
-- Drop tables in the right sequence to respect foreign keys
-- Delete the foreign keys tables first.
--
DROP TABLE IF EXISTS `user_versions`;
DROP TABLE IF EXISTS `clinical_record_versions`;
DROP TABLE IF EXISTS `child_versions`;
DROP TABLE IF EXISTS `lms`;
DROP TABLE IF EXISTS `report_properties`;
DROP TABLE IF EXISTS `report_clinicalrecordfields`;
DROP TABLE IF EXISTS `report_childfields`;
DROP TABLE IF EXISTS `report`;
DROP TABLE IF EXISTS `clinical_record`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `child`;
DROP TABLE IF EXISTS `user_group_permissions`;
DROP TABLE IF EXISTS `permissions`;
DROP TABLE IF EXISTS `user_group`;
DROP TABLE IF EXISTS `diabetes_centre`;
DROP TABLE IF EXISTS `country`;


--
-- Table structure for table `country`
--
CREATE TABLE `country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `diabetes_centre`
--
CREATE TABLE `diabetes_centre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF81F7F9716F6E572` (`country`),
  CONSTRAINT `FKF81F7F9716F6E572` FOREIGN KEY (`country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_group`
--
CREATE TABLE `user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `group_code` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `permissions`
--
CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_group_permissions`
--
CREATE TABLE `user_group_permissions` (
  `user_group` bigint(20) NOT NULL,
  `permissions` bigint(20) NOT NULL,
  PRIMARY KEY (`user_group`,`permissions`),
  KEY `FK9E501B5019267F45` (`user_group`),
  KEY `FK9E501B5084BD8C4E` (`permissions`),
  CONSTRAINT `FK9E501B5084BD8C4E` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`),
  CONSTRAINT `FK9E501B5019267F45` FOREIGN KEY (`user_group`) REFERENCES `user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `child`
--
CREATE TABLE `child` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age_at_diagnosis` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `cause_of_death` int(11) DEFAULT NULL,
  `cause_of_death_other` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `date_of_death` datetime DEFAULT NULL,
  `date_of_registration` datetime DEFAULT NULL,
  `diabetes_diagnosed` datetime DEFAULT NULL,
  `diabetes_type` int(11) DEFAULT NULL,
  `diabetes_type_other` varchar(255) DEFAULT NULL,
  `distance_lives_from_centre` int(11) DEFAULT NULL,
  `ethnic_group` varchar(255) DEFAULT NULL,
  `individual_id` varchar(255) DEFAULT NULL,
  `initials` varchar(255) DEFAULT NULL,
  `insulin_since` datetime DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `local_medical_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `survival_status` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `centre` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5A3F51C3F879A93` (`centre`),
  KEY `FK5A3F51C16F6E572` (`country`),
  CONSTRAINT `FK5A3F51C16F6E572` FOREIGN KEY (`country`) REFERENCES `country` (`id`),
  CONSTRAINT `FK5A3F51C3F879A93` FOREIGN KEY (`centre`) REFERENCES `diabetes_centre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user`
--
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `old_password` varchar(255) DEFAULT NULL,
  `old_username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `centre` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  `user_group` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36EBCB19267F45` (`user_group`),
  KEY `FK36EBCB3F879A93` (`centre`),
  KEY `FK36EBCB16F6E572` (`country`),
  CONSTRAINT `FK36EBCB16F6E572` FOREIGN KEY (`country`) REFERENCES `country` (`id`),
  CONSTRAINT `FK36EBCB19267F45` FOREIGN KEY (`user_group`) REFERENCES `user_group` (`id`),
  CONSTRAINT `FK36EBCB3F879A93` FOREIGN KEY (`centre`) REFERENCES `diabetes_centre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `clinical_record`
--
CREATE TABLE `clinical_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bpin_last12months` int(11) DEFAULT NULL,
  `blood_pressure_diastolicsd` float DEFAULT NULL,
  `blood_pressure_systolicsd` float DEFAULT NULL,
  `laser_rx_in_last12months` int(11) DEFAULT NULL,
  `proteinuria_dipstick_other` varchar(255) DEFAULT NULL,
  `acearb` int(11) DEFAULT NULL,
  `additional_comment` varchar(255) DEFAULT NULL,
  `adjust_insulin_dose_if_needed` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `analog` int(11) DEFAULT NULL,
  `appropriate_grade_for_age` int(11) DEFAULT NULL,
  `attending_school` int(11) DEFAULT NULL,
  `blood_glucose_self_monitoring_per_week` int(11) DEFAULT NULL,
  `blood_pressure_diastolicmmhg` int(11) DEFAULT NULL,
  `blood_pressure_systolicmmhg` int(11) DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `bmisd` float DEFAULT NULL,
  `bp_medications` int(11) DEFAULT NULL,
  `bp_medications_other` varchar(255) DEFAULT NULL,
  `cateract` int(11) DEFAULT NULL,
  `cholesterol_units` int(11) DEFAULT NULL,
  `consent_given` int(11) DEFAULT NULL,
  `creatinine_in_last12months` int(11) DEFAULT NULL,
  `creatinine_units` int(11) DEFAULT NULL,
  `creatinine_value` float DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_of_measurement` datetime DEFAULT NULL,
  `diabetes_coping_abilities` int(11) DEFAULT NULL,
  `diabetes_limiting_attendance` int(11) DEFAULT NULL,
  `exact_age` float DEFAULT NULL,
  `exact_age_months` float DEFAULT NULL,
  `eyes_comment` varchar(255) DEFAULT NULL,
  `eyes_examined_in_last_year` int(11) DEFAULT NULL,
  `fasted` int(11) DEFAULT NULL,
  `feet_comment` varchar(255) DEFAULT NULL,
  `feet_examined_in_last_year` int(11) DEFAULT NULL,
  `has_persistent_hypertension` int(11) DEFAULT NULL,
  `has_puberty_tannerb2_p2or_greater` int(11) DEFAULT NULL,
  `hba1c_method` int(11) DEFAULT NULL,
  `hba1c_method_other` varchar(255) DEFAULT NULL,
  `hba1c_percentage` float DEFAULT NULL,
  `hdl_cholesterol_in_last12months` int(11) DEFAULT NULL,
  `hdl_cholesterol_value` float DEFAULT NULL,
  `hdl_units` int(11) DEFAULT NULL,
  `heightcm` float DEFAULT NULL,
  `height_in_last12months` int(11) DEFAULT NULL,
  `heightsd` float DEFAULT NULL,
  `if_menarche_age` varchar(255) DEFAULT NULL,
  `insulin_per_kg` float DEFAULT NULL,
  `insulin_units_per_day` int(11) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `last_hba1c_in_last12months` int(11) DEFAULT NULL,
  `literate` int(11) DEFAULT NULL,
  `long_acting_human` int(11) DEFAULT NULL,
  `menarche` int(11) DEFAULT NULL,
  `microalbuminuria_in_last12months` int(11) DEFAULT NULL,
  `microalbuminuria_unit_of_measure` int(11) DEFAULT NULL,
  `microalbuminuria_value` varchar(255) DEFAULT NULL,
  `monofilament_abnormal` int(11) DEFAULT NULL,
  `monofilament_tested` int(11) DEFAULT NULL,
  `not_attending_school_why` int(11) DEFAULT NULL,
  `number_ketoacidosis_episodes` int(11) DEFAULT NULL,
  `number_of_hospital_admissions_related_to_diabetes` int(11) DEFAULT NULL,
  `number_of_insulin_injections_per_day` int(11) DEFAULT NULL,
  `number_of_severe_hypoglycaemia_episodes` int(11) DEFAULT NULL,
  `oral_agents` int(11) DEFAULT NULL,
  `oral_agents_description` varchar(255) DEFAULT NULL,
  `other_treatments` varchar(255) DEFAULT NULL,
  `routine_clinic_reviews_last_year` int(11) DEFAULT NULL,
  `senior_physician` varchar(255) DEFAULT NULL,
  `short_acting_human` int(11) DEFAULT NULL,
  `total_cholesterol_in_last12months` int(11) DEFAULT NULL,
  `total_cholesterol_value` float DEFAULT NULL,
  `triglycerides_in_last12months` int(11) DEFAULT NULL,
  `triglycerides_units` int(11) DEFAULT NULL,
  `triglycerides_value` float DEFAULT NULL,
  `tuning_fork_abnormal` int(11) DEFAULT NULL,
  `tuning_fork_tested` int(11) DEFAULT NULL,
  `urine_glucose_self_monitoring_per_week` int(11) DEFAULT NULL,
  `visual_acuity_left` varchar(255) DEFAULT NULL,
  `visual_acuity_right` varchar(255) DEFAULT NULL,
  `weight_in_last12months` int(11) DEFAULT NULL,
  `weightkg` float DEFAULT NULL,
  `weightsd` float DEFAULT NULL,
  `child` bigint(20) DEFAULT NULL,
  `person_completing_form` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK205556FD6F14F9FE` (`child`),
  KEY `FK205556FD5A903608` (`person_completing_form`),
  CONSTRAINT `FK205556FD5A903608` FOREIGN KEY (`person_completing_form`) REFERENCES `user` (`id`),
  CONSTRAINT `FK205556FD6F14F9FE` FOREIGN KEY (`child`) REFERENCES `child` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report`
--
CREATE TABLE `report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_by` varchar(255) DEFAULT NULL,
  `record_number` varchar(255) DEFAULT NULL,
  `reporttype` int(11) DEFAULT NULL,
  `showoptiontype` int(11) DEFAULT NULL,
  `statustype` int(11) DEFAULT NULL,
  `then_order_by` varchar(255) DEFAULT NULL,
  `time_period` varchar(255) DEFAULT NULL,
  `timeperiodunit` int(11) DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `centre` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  `viewable_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC84C55343F879A93` (`centre`),
  KEY `FKC84C553416F6E572` (`country`),
  KEY `FKC84C5534B313E25C` (`viewable_by`),
  CONSTRAINT `FKC84C5534B313E25C` FOREIGN KEY (`viewable_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FKC84C553416F6E572` FOREIGN KEY (`country`) REFERENCES `country` (`id`),
  CONSTRAINT `FKC84C55343F879A93` FOREIGN KEY (`centre`) REFERENCES `diabetes_centre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_childfields`
--
CREATE TABLE `report_childfields` (
  `report` bigint(20) NOT NULL,
  `element` int(11) DEFAULT NULL,
  `child_fields` int(11) NOT NULL,
  PRIMARY KEY (`report`,`child_fields`),
  KEY `FK584AB44AA66D9362` (`report`),
  CONSTRAINT `FK584AB44AA66D9362` FOREIGN KEY (`report`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_clinicalrecordfields`
--
CREATE TABLE `report_clinicalrecordfields` (
  `report` bigint(20) NOT NULL,
  `element` int(11) DEFAULT NULL,
  `clinical_record_fields` int(11) NOT NULL,
  PRIMARY KEY (`report`,`clinical_record_fields`),
  KEY `FKAD03FB08A66D9362` (`report`),
  CONSTRAINT `FKAD03FB08A66D9362` FOREIGN KEY (`report`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_properties`
--
CREATE TABLE `report_properties` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `display_fields` varchar(255) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL,
  `report_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lms`
--
CREATE TABLE `lms` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age_months_old` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `l` float DEFAULT NULL,
  `m` float DEFAULT NULL,
  `s` float DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `child_versions`
--
CREATE TABLE `child_versions` (
  `id` bigint(20) NOT NULL,
  `age_at_diagnosis` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `cause_of_death` int(11) DEFAULT NULL,
  `cause_of_death_other` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `date_of_death` datetime DEFAULT NULL,
  `date_of_registration` datetime DEFAULT NULL,
  `diabetes_diagnosed` datetime DEFAULT NULL,
  `diabetes_type` int(11) DEFAULT NULL,
  `diabetes_type_other` varchar(255) DEFAULT NULL,
  `distance_lives_from_centre` int(11) DEFAULT NULL,
  `ethnic_group` varchar(255) DEFAULT NULL,
  `individual_id` varchar(255) DEFAULT NULL,
  `initials` varchar(255) DEFAULT NULL,
  `insulin_since` datetime DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `local_medical_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `survival_status` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `centre` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  KEY `FK5A3F51C3F879A93` (`centre`),
  KEY `FK5A3F51C16F6E572` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `clinical_record_versions`
--
CREATE TABLE `clinical_record_versions` (
  `id` bigint(20) NOT NULL,
  `bpin_last12months` int(11) DEFAULT NULL,
  `blood_pressure_diastolicsd` float DEFAULT NULL,
  `blood_pressure_systolicsd` float DEFAULT NULL,
  `laser_rx_in_last12months` int(11) DEFAULT NULL,
  `proteinuria_dipstick_other` varchar(255) DEFAULT NULL,
  `acearb` int(11) DEFAULT NULL,
  `additional_comment` varchar(255) DEFAULT NULL,
  `adjust_insulin_dose_if_needed` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `analog` int(11) DEFAULT NULL,
  `appropriate_grade_for_age` int(11) DEFAULT NULL,
  `attending_school` int(11) DEFAULT NULL,
  `blood_glucose_self_monitoring_per_week` int(11) DEFAULT NULL,
  `blood_pressure_diastolicmmhg` int(11) DEFAULT NULL,
  `blood_pressure_systolicmmhg` int(11) DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `bmisd` float DEFAULT NULL,
  `bp_medications` int(11) DEFAULT NULL,
  `bp_medications_other` varchar(255) DEFAULT NULL,
  `cateract` int(11) DEFAULT NULL,
  `cholesterol_units` int(11) DEFAULT NULL,
  `consent_given` int(11) DEFAULT NULL,
  `creatinine_in_last12months` int(11) DEFAULT NULL,
  `creatinine_units` int(11) DEFAULT NULL,
  `creatinine_value` float DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_of_measurement` datetime DEFAULT NULL,
  `diabetes_coping_abilities` int(11) DEFAULT NULL,
  `diabetes_limiting_attendance` int(11) DEFAULT NULL,
  `exact_age` float DEFAULT NULL,
  `exact_age_months` float DEFAULT NULL,
  `eyes_comment` varchar(255) DEFAULT NULL,
  `eyes_examined_in_last_year` int(11) DEFAULT NULL,
  `fasted` int(11) DEFAULT NULL,
  `feet_comment` varchar(255) DEFAULT NULL,
  `feet_examined_in_last_year` int(11) DEFAULT NULL,
  `has_persistent_hypertension` int(11) DEFAULT NULL,
  `has_puberty_tannerb2_p2or_greater` int(11) DEFAULT NULL,
  `hba1c_method` int(11) DEFAULT NULL,
  `hba1c_method_other` varchar(255) DEFAULT NULL,
  `hba1c_percentage` float DEFAULT NULL,
  `hdl_cholesterol_in_last12months` int(11) DEFAULT NULL,
  `hdl_cholesterol_value` float DEFAULT NULL,
  `hdl_units` int(11) DEFAULT NULL,
  `heightcm` float DEFAULT NULL,
  `height_in_last12months` int(11) DEFAULT NULL,
  `heightsd` float DEFAULT NULL,
  `if_menarche_age` varchar(255) DEFAULT NULL,
  `insulin_per_kg` float DEFAULT NULL,
  `insulin_units_per_day` int(11) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `last_hba1c_in_last12months` int(11) DEFAULT NULL,
  `literate` int(11) DEFAULT NULL,
  `long_acting_human` int(11) DEFAULT NULL,
  `menarche` int(11) DEFAULT NULL,
  `microalbuminuria_in_last12months` int(11) DEFAULT NULL,
  `microalbuminuria_unit_of_measure` int(11) DEFAULT NULL,
  `microalbuminuria_value` varchar(255) DEFAULT NULL,
  `monofilament_abnormal` int(11) DEFAULT NULL,
  `monofilament_tested` int(11) DEFAULT NULL,
  `not_attending_school_why` int(11) DEFAULT NULL,
  `number_ketoacidosis_episodes` int(11) DEFAULT NULL,
  `number_of_hospital_admissions_related_to_diabetes` int(11) DEFAULT NULL,
  `number_of_insulin_injections_per_day` int(11) DEFAULT NULL,
  `number_of_severe_hypoglycaemia_episodes` int(11) DEFAULT NULL,
  `oral_agents` int(11) DEFAULT NULL,
  `oral_agents_description` varchar(255) DEFAULT NULL,
  `other_treatments` varchar(255) DEFAULT NULL,
  `routine_clinic_reviews_last_year` int(11) DEFAULT NULL,
  `senior_physician` varchar(255) DEFAULT NULL,
  `short_acting_human` int(11) DEFAULT NULL,
  `total_cholesterol_in_last12months` int(11) DEFAULT NULL,
  `total_cholesterol_value` float DEFAULT NULL,
  `triglycerides_in_last12months` int(11) DEFAULT NULL,
  `triglycerides_units` int(11) DEFAULT NULL,
  `triglycerides_value` float DEFAULT NULL,
  `tuning_fork_abnormal` int(11) DEFAULT NULL,
  `tuning_fork_tested` int(11) DEFAULT NULL,
  `urine_glucose_self_monitoring_per_week` int(11) DEFAULT NULL,
  `visual_acuity_left` varchar(255) DEFAULT NULL,
  `visual_acuity_right` varchar(255) DEFAULT NULL,
  `weight_in_last12months` int(11) DEFAULT NULL,
  `weightkg` float DEFAULT NULL,
  `weightsd` float DEFAULT NULL,
  `child` bigint(20) DEFAULT NULL,
  `person_completing_form` bigint(20) DEFAULT NULL,
  KEY `FK205556FD6F14F9FE` (`child`),
  KEY `FK205556FD5A903608` (`person_completing_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_versions`
--
CREATE TABLE `user_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `old_password` varchar(255) DEFAULT NULL,
  `old_username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `centre` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  `user_group` bigint(20) DEFAULT NULL,
  KEY `FK36EBCB19267F45` (`user_group`),
  KEY `FK36EBCB3F879A93` (`centre`),
  KEY `FK36EBCB16F6E572` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
