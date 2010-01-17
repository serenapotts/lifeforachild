delete FROM user_group_permissions;
delete FROM permissions;
delete from user;
delete from user_group;

insert into permissions (version, name) values (1, 'View Child Name');
insert into permissions (version, name) values (1, 'Add Child');
insert into permissions (version, name) values (1, 'Edit Child');
insert into permissions (version, name) values (1, 'Add Medical Record');
insert into permissions (version, name) values (1, 'Edit Medical Record');
insert into permissions (version, name) values (1, 'View Medical Record');
insert into permissions (version, name) values (1, 'ACCESS_ADMIN');

insert into user_group (version, group_name) values (1, 'Program Manager');
insert into user_group (version, group_name) values (1, 'PMs Assistants');
insert into user_group (version, group_name) values (1, 'Data Entry Operators');
insert into user_group (version, group_name) values (1, 'Centre Admin');
insert into user_group (version, group_name) values (1, 'Centre Staff');
insert into user_group (version, group_name) values (1, 'Researchers');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='View Child Name');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='ACCESS_ADMIN');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='Centre Staff');

insert into user (version, username, password, enabled, user_group)
(select 1, 'gogle', 'gogle', true, ug.id from user_group ug
where ug.group_name='Program Manager');
insert into user (version, username, password, enabled, user_group)
(select 1, 'robyn', 'robyn', true, ug.id from user_group ug
where ug.group_name='PMs Assistants');
insert into user (version, username, password, enabled, user_group)
(select 1, 'spotts', 'spotts', true, ug.id from user_group ug
where ug.group_name='Program Manager');