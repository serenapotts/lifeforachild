cd ..\MySQL\MySQL Server 5.5\bin

net stop MYSQL
mysqld --remove

REM uninstall MYSQL as well -- not possible i think

REM ---- delete unzipped files as well ----


cd ..\..\..\LifeForAChild"

rmdir /s /q initialise
rmdir /s /q updates
del initAll.sql


cd ..\Apache Software Foundation\Tomcat 6.0

rem net stop tomcat6

rem rmdir /s /q lifeforachild
rem del lifeforachild.war

rem cd ..

uninstall.exe -ServiceName=tomcat6

-- may need to delete data but in general probably don't want to do this in practise when used live
REM cd "\Documents and Settings\All Users\Application Data\MySQL\MySQL Server 5.5"
REM rmdir /s /q data