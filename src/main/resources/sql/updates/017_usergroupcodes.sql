update user_group set group_name ='usergroup.type.researchers' where group_name='Researchers';
update user_group set group_name ='usergroup.type.translation.country.manager' where group_name='Translation Country Manager';

insert into message (message_key, version, english) values ('usergroup.type.translation.country.manager', 1, 'Translation Country Manager');