insert into country (version, name) values (1, 'Bolivia');
insert into country (version, name) values (1, 'India');
insert into country (version, name) values (1, 'Nepal');

insert into diabetes_centre (version, name, country)
(select 0, 'Bolivia Medical', c.id from country c
where c.name='Bolivia');
insert into diabetes_centre (version, name, country)
(select 0, 'Bolivia Surgery', c.id from country c
where c.name='Bolivia');
insert into diabetes_centre (version, name, country)
(select 0, 'India Medical', c.id from country c
where c.name='India');
insert into diabetes_centre (version, name, country)
(select 0, 'India Surgery', c.id from country c
where c.name='India');
insert into diabetes_centre (version, name, country)
(select 0, 'Nepal Medical', c.id from country c
where c.name='Nepal');
insert into diabetes_centre (version, name, country)
(select 0, 'Bolivia Surgery', c.id from country c
where c.name='Nepal');

insert into permissions (version, name) values (1, 'View Child Name');
insert into permissions (version, name) values (1, 'Add Child');
insert into permissions (version, name) values (1, 'Edit Child');
insert into permissions (version, name) values (1, 'Add Medical Record');
insert into permissions (version, name) values (1, 'Edit Medical Record');
insert into permissions (version, name) values (1, 'View Medical Record');
insert into permissions (version, name) values (1, 'User Administation');

insert into user_group (version, group_name) values (1, 'Program Manager');
insert into user_group (version, group_name) values (1, 'PMs Assistants');
insert into user_group (version, group_name) values (1, 'Data Entry Operators');
insert into user_group (version, group_name) values (1, 'Country Manager');
insert into user_group (version, group_name) values (1, 'Centre Admin');
insert into user_group (version, group_name) values (1, 'Centre Staff');
insert into user_group (version, group_name) values (1, 'Researchers');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='User Administation');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='User Administation');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='User Administation');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='User Administation');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='View Child Name');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='View Child Name');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='View Child Name');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='Add Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='Add Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='Add Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='Add Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='Add Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='Add Child');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='Edit Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='Edit Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='Edit Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='Edit Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='Edit Child');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='Edit Child');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='Add Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='Add Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='Add Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='Add Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='Add Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='Add Medical Record');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='Edit Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='Edit Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Data Entry Operators' and
name='Edit Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='Edit Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='Edit Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Staff' and
name='Edit Medical Record');

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Program Manager' and
name='View Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='PMs Assistants' and
name='View Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Country Manager' and
name='View Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Centre Admin' and
name='View Medical Record');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_name='Researchers' and
name='View Medical Record');


insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'gogle', 'c63dad8f3c1552151b7b5ea105c49020886eff7e', true, ug.id, false from user_group ug
where ug.group_name='Program Manager');
insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'robyn', '13519c12eeabc68c4a15f41baa304fd355752e10', true, ug.id, false from user_group ug
where ug.group_name='PMs Assistants');
insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'deo', 'e8ca7d6501cc53e9414e531380c254509e71a423', true, ug.id, false from user_group ug
where ug.group_name='Data Entry Operators');
insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'res', 'dee1ebcd105d3d47adf43aba6fd674e80d1dc35f', true, ug.id, false from user_group ug
where ug.group_name='Researchers');

insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'bmanager', '805b0bf50fcc8e9a4f8aa7d9ab4481fb7236f3f1', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Country Manager' and c.name='Bolivia' and dc.name='Bolivia Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'imanager', 'd297dd777ce5735f0b0738d6df15fb58285b00f8', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Country Manager' and c.name='India' and dc.name='India Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nmanager', 'e018de7f09b4b54562c9bc51d3bd89e96d950708', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Country Manager' and c.name='Nepal' and dc.name='Nepal Medical');

insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'badmin', '666a4f85ca9565d6e0e0a2f4fa0f6995de9433dd', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Bolivia' and dc.name='Bolivia Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'iadmin', '8e59b3d1e601e1613b38c9f6fffc06d94136abd4', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='India' and dc.name='India Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nadmin', '389c21b16db320e26d1e586e4689bef66153a788', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Nepal' and dc.name='Nepal Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'badmin2', 'a3c22dc3723dc314965bf5a0cd4e7979e962e365', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Bolivia' and dc.name='Bolivia Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'iadmin2', '42c196ca51fa9c1ffde7095e6c9cc07eabdc2a30', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='India' and dc.name='India Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nadmin2', '456e1381371d940602352c929f95e162fdfea610', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Nepal' and dc.name='Nepal Surgery');

insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'bstaff', '56da45a802d0c732d34782614e6ba701d7ba29f9', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Bolivia' and dc.name='Bolivia Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'istaff', 'f28b096fce8f5f9fbbd8a58f33f8acd018e47efc', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='India' and dc.name='India Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nstaff', '1207e88ff3b5c5731333e2a2c9d327b416ffd1f8', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Nepal' and dc.name='Nepal Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'bstaff2', '02744c68452507bb3b5501a9e85f82ddf140e9fd', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Bolivia' and dc.name='Bolivia Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'istaff2', '96a3dbaf8f9e7b719e3f965f681be6cd96826a61', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='India' and dc.name='India Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nstaff2', '5807127c85dc1310b8d52aecfaf86d03137a2261', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Nepal' and dc.name='Nepal Surgery');

insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'spotts', 'dab7d687a984d86c3cc31ab8fb86604b4543ddfc', true, ug.id, false from user_group ug
where ug.group_name='Program Manager');

update user set first_name ='Graham', last_name='Ogle' where username='gogle';
update user set first_name ='Robyn', last_name='' where username='robyn';
update user set first_name ='Data Entry Operator', last_name='' where username='deo';
update user set first_name ='Reasearcher', last_name='' where username='res';
update user set first_name ='Bolivia', last_name='Manager' where username='bmanager';
update user set first_name ='Nepal', last_name='Manager' where username='nmanager';
update user set first_name ='India', last_name='Manager' where username='imanager';
update user set first_name ='Bolivia', last_name='Admin' where username='badmin';
update user set first_name ='Nepal', last_name='Admin' where username='nadmin';
update user set first_name ='India', last_name='Admin' where username='iadmin';
update user set first_name ='Bolivia', last_name='Admin Two' where username='badmin2';
update user set first_name ='Nepal', last_name='Admin Two' where username='nadmin2';
update user set first_name ='India', last_name='Admin Two' where username='iadmin2';
update user set first_name ='Bolivia', last_name='Staff' where username='bstaff';
update user set first_name ='Nepal', last_name='Staff' where username='nstaff';
update user set first_name ='India', last_name='Staff' where username='istaff';
update user set first_name ='Bolivia', last_name='Staff Two' where username='bstaff2';
update user set first_name ='Nepal', last_name='Staff Two' where username='nstaff2';
update user set first_name ='India', last_name='Staff Two' where username='istaff2';
update user set first_name ='Serena', last_name='Potts' where username='spotts';
