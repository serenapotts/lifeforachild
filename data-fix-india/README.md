# Purpose

In July 2015, we identified users have been using Staging system to enter children's data, particularly centre ID 13. The purpose of this script is to safely migrate data in Staging database to Production database for centre 13.

# Design decision

As part of migration, we need to make sure all foreign keys are pointing to the new ID inserted into Prod. We agreed on using Groovy as it has good MySQL integration, tests; and anyone with Java knowledge can maintain.

# Installation
## Groovy
To run this script, Developer will need to download and install Groovy. This can be done via package manager:

```
$ sudo apt-get install groovy
```

OR 
```
$ brew install groovy
```

OR just download binary from Groovy at: http://dl.bintray.com/groovy/maven/apache-groovy-binary-2.4.4.zip , unzip and put `bin` directory in the `PATH`

## Gradle
Developer can install Gradle, or just use the Gradle wrapper:
```
[data-fix-india] $ ./gradlew
```

# Run test
The script has unit test done in Spock. Dependencies are managed by Gradle. To run test:
```
[data-fix-india] $ ./gradlew --info clean test

This should output pass or failure message. To view more details test report, you can open test report with browser:
[data-fix-india] $ google-chrome build/reports/tests/index.html
```

## Dependencies management
At runtime, we use Grape (`@Grab`) for dependencies for simplicity as Grape just require Groovy to run, hence we just need to install Groovy on Production server.

In test, we use Spock and Gradle. Gradle doesn't work with Grape, so we need to disable Grape and duplicate the dependencies in @Grab to `build.gradle` dependencies block. This is not ideal, but a small price to pay.

```
test {                                        
  systemProperty 'groovy.grape.enable', 'false'  
}

compileGroovy {
  groovyOptions.forkOptions.jvmArgs = [ '-Dgroovy.grape.enable=false' ]
}
compileTestGroovy {
  groovyOptions.forkOptions.jvmArgs = [ '-Dgroovy.grape.enable=false' ]
}
```

# Run script
## Setting up the data
Data dump can be done on the Hope server:
Staging:
```
$ mysqldump -u<username> -p<password> --add-drop-database --databases staging_db_name > staging_backup.sql
```
Prod: (the command below grab all data, alternatively you can grab just the schema):
```
$ mysqldump -u<username> -p<password> --add-drop-database --databases prod_db_name > prod_backup.sql

# Or just grab the scchema:
$ mysqldump -u<username> -p<password> --no-data --add-drop-database --databases prod_db_name > prod_schema.sql
```

SCP those files to your machine and import them to your computer:
```
$ mysql -u<username> -p<password> < staging_backup.sql
$ mysql -u<username> -p<password> < prod_backup.sql
```

## Running script
```
# make sure groovy is in the path before running this.
$ cd data-fix-india/src/main/groovy
$ ./data-fix-india-centre.groovy 
error: Missing required options: u, p, s, d
usage: data-fix-india-centre
 -d,--destinationSchema <destDbSchema>   production DB schema
 -h,--host <dbHost>                      DB host, default to be localhost
 -p,--password <password>                DB password
 -s,--sourceSchema <sourceDbSchema>      staging DB schema
 -u,--user <user>                        DB user

 $ ./data-fix-india-centre.groovy -h localhost -uroot -p<password> -s <staging_db> -p <prod_db>
```










