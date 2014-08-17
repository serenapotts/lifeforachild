DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_key` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `english` varchar(512) DEFAULT NULL,
  `french` varchar(512) DEFAULT NULL,
  `spanish` varchar(512) DEFAULT NULL,
  `russian` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into permissions (version, name, description, is_deleted) values (1, 'EDIT_TRANSLATIONS', 'Edit Language Translations', 0);

insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_code='PROGRAM_MANAGER' and
name='EDIT_TRANSLATIONS');
insert into user_group_permissions (user_group, permissions)
(select ug.id, p.id from user_group ug, permissions p
where ug.group_code='PMS_ASSISTANTS' and
name='EDIT_TRANSLATIONS');

insert into message (message_key, version, english) values ('message.menu.list', 1, 'List all Translations');
insert into message (message_key, version, english) values ('message.list.messageKey', 1, 'Translation Key');
insert into message (message_key, version, english) values ('message.list.english', 1, 'English Translation');
insert into message (message_key, version, english) values ('message.messagekey', 1, 'Key:');
insert into message (message_key, version, english) values ('message.english', 1, 'English:');
insert into message (message_key, version, english) values ('message.french', 1, 'French:');
insert into message (message_key, version, english) values ('message.spanish', 1, 'Spanish:');
insert into message (message_key, version, english) values ('message.russian', 1, 'Russian:');
insert into message (message_key, version, english) values ('label.messages', 1, 'Translations');
insert into message (message_key, version, english) values ('label.message', 1, 'Translation');
insert into message (message_key, version, english) values ('menu.category.web_mvc_jsp_message_category.label', 1, 'Translation');

