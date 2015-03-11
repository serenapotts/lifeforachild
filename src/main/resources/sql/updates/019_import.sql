insert into message (message_key, version, english) values ('import.title', 1, 'Import Child and Visit Data');
insert into message (message_key, version, english) values ('import.result', 1, 'Import Result');
insert into message (message_key, version, english) values ('menu.category.web_mvc_jsp_import_category.label', 1, 'Import');
insert into message (message_key, version, english) values ('label.import', 1, 'Import');
insert into message (message_key, version, english) values ('import.menu.show', 1, 'Import Excel');
insert into message (message_key, version, english) values ('import.info', 1, 'Select an excel spreadsheet to upload child and visit data into the application.');

insert into permissions (version, name, description, is_deleted) values (1, 'IMPORT_DATA', 'Import Child and Visit Data', 0);

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_code='PROGRAM_MANAGER' and
name='IMPORT_DATA');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_code='PMS_ASSISTANTS' and
name='IMPORT_DATA');
