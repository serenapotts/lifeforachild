Setup dev environment on mac

0. Download and install java 8.0
1. Download and install Springsource Tool Suite (STS) latest version
2. Download and install msql community server 5.5.x dmg file
3. Download and unzip/install Tomcat 8.0
3a. Download and install maven as per instructions on download page
4. Checkout code from github
5. Open STS
6. File --> Import
7. Select General --> Existing projects from workspace and select the checkout directory
8. Right click on lifeforachild in project window, maven —> update project
9. In Server window, Right Click, New —> Apache —> select Tomcat 8.0 and point to tomcat install directory


10. start mysql: 
either start in System Preferences OR 
cd /usr/local/mysql/bin
sudo ./mysqld_safe
11. run setupDB.bat script to initialise DB:
cd lifeforachild/src/main/resources/sql
./setupDB.bat
12. copy settings.txt with encryption key to /<user.home>/lifeforachild/settings.txt
13. Start server

Go to localhost:8080/lifeforachild in browser

To run test install firefox selenium hq plugin
Run test suite in /src/main/webapp/selenium an ensure all pass before committing


