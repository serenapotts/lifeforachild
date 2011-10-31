update permissions set description = name;

update permissions set description ='User Administration', name='USER_ADMIN' where description='User Administation';
update permissions set name='CREATE_CHILD' where description='Add Child';
update permissions set name='EDIT_CHILD' where description='Edit Child';
update permissions set name='CREATE_RECORD' where description='Add Medical Record';
update permissions set name='EDIT_RECORD' where description='Edit Medical Record';
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
insert into permissions (version, name, description) values (1, 'CAN_DELETE', 'Delete Data');

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


update `user` set password='c63dad8f3c1552151b7b5ea105c49020886eff7e' where username='gogle';
update `user` set password='13519c12eeabc68c4a15f41baa304fd355752e10' where username='robyn';
update `user` set password='e8ca7d6501cc53e9414e531380c254509e71a423' where username='deo';
update `user` set password='dee1ebcd105d3d47adf43aba6fd674e80d1dc35f' where username='res';
update `user` set password='805b0bf50fcc8e9a4f8aa7d9ab4481fb7236f3f1' where username='bmanager';
update `user` set password='e018de7f09b4b54562c9bc51d3bd89e96d950708' where username='nmanager';
update `user` set password='d297dd777ce5735f0b0738d6df15fb58285b00f8' where username='imanager';
update `user` set password='666a4f85ca9565d6e0e0a2f4fa0f6995de9433dd' where username='badmin';
update `user` set password='389c21b16db320e26d1e586e4689bef66153a788' where username='nadmin';
update `user` set password='8e59b3d1e601e1613b38c9f6fffc06d94136abd4' where username='iadmin';
update `user` set password='a3c22dc3723dc314965bf5a0cd4e7979e962e365' where username='badmin2';
update `user` set password='42c196ca51fa9c1ffde7095e6c9cc07eabdc2a30' where username='iadmin2';
update `user` set password='456e1381371d940602352c929f95e162fdfea610' where username='nadmin2';
update `user` set password='56da45a802d0c732d34782614e6ba701d7ba29f9' where username='bstaff';
update `user` set password='1207e88ff3b5c5731333e2a2c9d327b416ffd1f8' where username='nstaff';
update `user` set password='f28b096fce8f5f9fbbd8a58f33f8acd018e47efc' where username='istaff';
update `user` set password='02744c68452507bb3b5501a9e85f82ddf140e9fd' where username='bstaff2';
update `user` set password='5807127c85dc1310b8d52aecfaf86d03137a2261' where username='nstaff2';
update `user` set password='96a3dbaf8f9e7b719e3f965f681be6cd96826a61' where username='istaff2';
update `user` set password='dab7d687a984d86c3cc31ab8fb86604b4543ddfc' where username='spotts';
