alter table user_group add group_code varchar(255);

update user_group set group_code ='CENTRE_ADMIN' where group_name='Centre Manager';
update user_group set group_code ='PMS_ASSISTANTS' where group_name='Assistant to Program Manager';
update user_group set group_code ='DATA_ENTRY_OPERATORS' where group_name='Data Entry Operators';
update user_group set group_code ='PROGRAM_MANAGER' where group_name='Program Manager';
update user_group set group_code ='COUNTRY_MANAGER' where group_name='Country Manager';
update user_group set group_code ='CENTRE_STAFF' where group_name='Centre Staff';
update user_group set group_code ='RESEARCHERS' where group_name='Researchers';

update user_group set group_name ='usergroup.type.centreManager' where group_name='Centre Manager';
update user_group set group_name ='usergroup.type.pmAssistant' where group_name='Assistant to Program Manager';
update user_group set group_name ='usergroup.type.deo' where group_name='Data Entry Operators';
update user_group set group_name ='usergroup.type.programManager' where group_name='Program Manager';
update user_group set group_name ='usergroup.type.countryManager' where group_name='Country Manager';
update user_group set group_name ='usergroup.type.centreStaff' where group_name='Centre Staff';
update user_group set group_name ='usergroup.type.researchers' where group_name='Researchers';