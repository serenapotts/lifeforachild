ALTER TABLE clinical_record MODIFY 
COLUMN microalbuminuria_unit_of_measure VARCHAR(255);

alter table child add column is_deleted boolean;
update child set is_deleted = false;

alter table clinical_record add column is_deleted boolean;
update clinical_record set is_deleted = false;

alter table country add column is_deleted boolean;
update country set is_deleted = false;

alter table diabetes_centre add column is_deleted boolean;
update diabetes_centre set is_deleted = false;

alter table report add column is_deleted boolean;
update report set is_deleted = false;

alter table user add column is_deleted boolean;
update user set is_deleted = false;

alter table user_group add column is_deleted boolean;
update user_group set is_deleted = false;

alter table permissions add column is_deleted boolean;
update permissions set is_deleted = false;