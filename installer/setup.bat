unzip.exe sql.zip

cd ..\MySQL\MySQL Server 5.5\bin

mysqld --install
net start MYSQL

mysql -u root -e "create database if not exists life_for_a_child;"

mysql -u root life_for_a_child -e "CREATE USER 'dev'@'localhost' IDENTIFIED BY 'password';"
mysql -u root life_for_a_child -e "GRANT ALL PRIVILEGES ON *.* TO 'dev'@'localhost' WITH GRANT OPTION;"

mysql -u root life_for_a_child -e "source ../../../LifeForAChild/initialise/initialiseDB_schema.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/001_users.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/002_bmiage.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/003_statage.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/004_wtageinf.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/005_wtage.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/006_permissions.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/007_20100923_update.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/008_20110301_update.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/009_mark_deleted_false.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/010_sync_versions_tables.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/011_new_child_fields.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/012_new_report_fields.sql"
mysql -u root life_for_a_child -e "source ../../../LifeForAChild/updates/triggers.sql"

cd ..\..\..\LifeForAChild
copy lifeforachild.war "..\Apache Software Foundation\Tomcat 6.0\webapps\lifeforachild.war"

net stop tomcat6
net start tomcat6








