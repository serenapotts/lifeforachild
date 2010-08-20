alter table permissions add description varchar(255);
update permissions set description = name;

update permissions set description ='User Administration', name='USER_ADMIN' where description='User Administation';
update permissions set name='CREATE_CHILD' where description='Add Child';
update permissions set name='EDIT_CHILD' where description='Edit Child';
update permissions set name='CREATE_RECORD' where description='Add Medical Record';
update permissions set name='UPDATE_RECORD' where description='Edit Medical Record';
update permissions set name='VIEW_RECORD' where description='View Medical Record';
update permissions set name='VIEW_CHILD_NAME' where description='View Child Name';

insert into permissions (version, name, description) values (1, 'EDIT_COUNTRY', 'Edit Country');
insert into permissions (version, name, description) values (1, 'CREATE_COUNTRY', 'Add Country');
insert into permissions (version, name, description) values (1, 'CREATE_CENTRE', 'Add Centre');
insert into permissions (version, name, description) values (1, 'EDIT_CENTRE', 'Edit Centre');
insert into permissions (version, name, description) values (1, 'CREATE_REPORT', 'Add Report');
insert into permissions (version, name, description) values (1, 'VIEW_REPORT', 'View Report');
insert into permissions (version, name, description) values (1, 'EDIT_REPORT', 'Edit Report');
insert into permissions (version, name, description) values (1, 'USER_GROUP_ADMIN', 'User Group Administration');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='USER_GROUP_ADMIN');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='EDIT_COUNTRY');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='EDIT_COUNTRY');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='CREATE_COUNTRY');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='CREATE_COUNTRY');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='CREATE_CENTRE');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='CREATE_CENTRE');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='EDIT_CENTRE');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='EDIT_CENTRE');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='CREATE_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='CREATE_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='CREATE_REPORT');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='CREATE_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='CREATE_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='CREATE_REPORT');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='VIEW_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='VIEW_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='VIEW_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='VIEW_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='VIEW_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='VIEW_REPORT');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='EDIT_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='EDIT_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='EDIT_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='EDIT_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='EDIT_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='EDIT_REPORT');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='VIEW_RECORD');


