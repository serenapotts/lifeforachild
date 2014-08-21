insert into user_group (version, group_name, group_code, is_deleted) values (1, 'Translation Country Manager', 'TRANSLATION_COUNTRY_MANAGER', 0);

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='CREATE_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='VIEW_REPORT');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='EDIT_REPORT');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='USER_ADMIN');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='VIEW_CHILD_NAME');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='CREATE_CHILD');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='EDIT_CHILD');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='CREATE_RECORD');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='EDIT_RECORD');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='VIEW_RECORD');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Translation Country Manager' and
name='EDIT_TRANSLATIONS');