update clinical_record set microalbuminuria_unit_of_measure = '0';

ALTER TABLE clinical_record MODIFY
COLUMN microalbuminuria_unit_of_measure int(11);

ALTER TABLE clinical_record MODIFY
COLUMN heightcm float;

ALTER TABLE clinical_record MODIFY
COLUMN microalbuminuria_value varchar(255);