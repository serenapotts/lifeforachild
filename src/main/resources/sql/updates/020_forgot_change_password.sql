insert into message (message_key, version, english) values ('forgot.password', 1, 'Forgot Password');
insert into message (message_key, version, english) values ('forgot.password.title', 1, 'Forgot Password');
insert into message (message_key, version, english) values ('change.password.title', 1, 'Change Password');
insert into message (message_key, version, english) values ('reset.password.info', 1, 'A reset password email has been sent to your registered email address.');
insert into message (message_key, version, english) values ('change.password.info', 1, 'Your password has been successfully changed.');
insert into message (message_key, version, english) values ('forgot.password.username.message', 1, 'Enter your username');
insert into message (message_key, version, english) values ('forgot.password.username', 1, 'Username');
insert into message (message_key, version, english) values ('reset.password.request.info', 1, 'Enter your username and a password reset will be sent to your email address if one has been set. If you do not get an email you may need LFAC to add your email address to your account.');
insert into message (message_key, version, english) values ('account.label', 1, 'Account');
insert into message (message_key, version, english) values ('email.label', 1, 'Email Address:');
insert into message (message_key, version, english) values ('account.title', 1, 'Account');
insert into message (message_key, version, english) values ('account.success.info', 1, 'Account successfully updated');
insert into message (message_key, version, english) values ('button.change.password', 1, 'Change Password');
insert into message (message_key, version, english) values ('change.password.old', 1, 'Old password');
insert into message (message_key, version, english) values ('change.password.new', 1, 'New password');
insert into message (message_key, version, english) values ('change.password.confirm', 1, 'Confirm new password');
insert into message (message_key, version, english) values ('change.password.old.message', 1, 'Enter your current password');
insert into message (message_key, version, english) values ('change.password.new.message', 1, 'Enter a new password');
insert into message (message_key, version, english) values ('change.password.confirm.message', 1, 'Re-enter the new password');
insert into message (message_key, version, english) values ('user.email', 1, 'Email Address');
ALTER TABLE user ADD email varchar(255) default null;
ALTER TABLE user_versions ADD email varchar(255) default null;
insert into message (message_key, version, english) values ('user.old.password.invalid', 1, 'Old Password does not match current password');
insert into message (message_key, version, english) values ('user.new.password.mismatch', 1, 'New and confirm passwords must be the same');






