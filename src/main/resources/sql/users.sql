delete FROM user_group_permissions;
delete FROM permissions;
delete from user;
delete from user_group;
delete from diabetes_centre;
delete from country;

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
(select 1, 'gogle', 'gogle', true, ug.id, false from user_group ug
where ug.group_name='Program Manager');
insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'robyn', 'robyn', true, ug.id, false from user_group ug
where ug.group_name='PMs Assistants');
insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'deo', 'deo', true, ug.id, false from user_group ug
where ug.group_name='Data Entry Operators');
insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'res', 'res', true, ug.id, false from user_group ug
where ug.group_name='Researchers');

insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'bmanager', 'bmanager', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Country Manager' and c.name='Bolivia' and dc.name='Bolivia Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'imanager', 'imanager', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Country Manager' and c.name='India' and dc.name='India Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nmanager', 'nmanager', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Country Manager' and c.name='Nepal' and dc.name='Nepal Medical');

insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'badmin', 'badmin', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Bolivia' and dc.name='Bolivia Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'iadmin', 'iadmin', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='India' and dc.name='India Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nadmin', 'nadmin', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Nepal' and dc.name='Nepal Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'badmin2', 'badmin2', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Bolivia' and dc.name='Bolivia Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'iadmin2', 'iadmin2', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='India' and dc.name='India Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nadmin2', 'nadmin2', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Admin' and c.name='Nepal' and dc.name='Nepal Surgery');

insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'bstaff', 'bstaff', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Bolivia' and dc.name='Bolivia Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'istaff', 'istaff', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='India' and dc.name='India Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nstaff', 'nstaff', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Nepal' and dc.name='Nepal Medical');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'bstaff2', 'bstaff2', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Bolivia' and dc.name='Bolivia Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'istaff2', 'istaff2', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='India' and dc.name='India Surgery');
insert into user (version, username, password, enabled, user_group, country, centre, is_deleted)
(select 1, 'nstaff2', 'nstaff2', true, ug.id, c.id, dc.id, false
from user_group ug, country c, diabetes_centre dc
where ug.group_name='Centre Staff' and c.name='Nepal' and dc.name='Nepal Surgery');

insert into user (version, username, password, enabled, user_group, is_deleted)
(select 1, 'spotts', 'spotts', true, ug.id, false from user_group ug
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
