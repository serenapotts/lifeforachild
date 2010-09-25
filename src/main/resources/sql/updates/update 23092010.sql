update user_group set group_name ='Centre Manager' where group_name='Centre Admin';
update user_group set group_name ='Assistant to Program Manager' where group_name='PMs Assistants';

ALTER TABLE clinical_record MODIFY
COLUMN if_menarche_age varchar(255);