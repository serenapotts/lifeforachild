import groovy.sql.Sql
import org.apache.log4j.*
import groovy.util.logging.*

@Log4j
class Processor {
    def opts
    def host

    def sourceSql
    def destSql

    def STAGING_CENTRE_ID = 13

    Processor(opts) {
        log.level = Level.DEBUG
        // add an appender to log to file
        // log.addAppender(new FileAppender(new TTCCLayout(), 'myscript.log'));

        this.opts = opts
        if(opts.h) {
            host = opts.h
        } else {
            host = 'localhost'
        }
    }

    String getInsertStatementWithoutId(tableName, rowData) {
        assert !rowData.keySet().contains('id')
        getInsertStatement(tableName, rowData)
    }

    String getInsertStatement(tableName, rowData) {
        def columns = rowData.keySet().join(',')
        def values = rowData.keySet().collect {
            if (rowData[it] != null) {
                rowData[it].getClass() == Boolean ? rowData[it] : "'${rowData[it]}'"
            } else {
                null
            }
        }.join(',')

        "insert into $tableName ($columns) values ($values)"
    }

    void run() {
        log.info "Host               : $host"
        log.info "User               : ${opts.u}"
        log.info "Password           : ${opts.p}"
        log.info "Source schema      : ${opts.s}"
        log.info "Destination schema : ${opts.d}"

        def sourceDb = [url: "jdbc:mysql://${host}:3306/${opts.s}", user: opts.u, password: opts.p, driver: 'com.mysql.jdbc.Driver']
        sourceSql = Sql.newInstance(sourceDb.url, sourceDb.user, sourceDb.password, sourceDb.driver)

        def destDb = [url: "jdbc:mysql://${host}:3306/${opts.d}", user: opts.u, password: opts.p, driver: 'com.mysql.jdbc.Driver']
        destSql = Sql.newInstance(destDb.url, destDb.user, destDb.password, destDb.driver)

        def centreId = insertCentre()
        def stagingToProdUserIdMap = insertUser(centreId)
        insertUserVersions(centreId, stagingToProdUserIdMap)

        def stagingToProdChildIdMap = insertChild(centreId)
    }

    Integer insertCentre() {
        log.info "Inserting Centre..."
        def centreId
        def diabetesCentreQuery = """
            select * from diabetes_centre
            where id = $STAGING_CENTRE_ID
        """
        sourceSql.rows(diabetesCentreQuery).each { row ->
           row.remove('id')
           def insert = getInsertStatementWithoutId('diabetes_centre', row)
           
           log.debug "  Executing statement: $insert"
           def result = destSql.executeInsert(insert)
           centreId = result[0][0]
           log.debug "  ID inserted: $centreId"
        }
        return centreId
    }

    Map insertUser(prodCentreId) {
        log.info "Inserting User..."

        def stagingToProdUserIdMap = [:]
        def userQuery = """
            select * from user
            where centre = $STAGING_CENTRE_ID
        """
        sourceSql.rows(userQuery).each { row ->
           def stagingUserId = row['id']

           row.remove('id')
           row['centre'] = prodCentreId   // update the centre ID
           // user_group is the same for Staging and Prod database, so we don't need to modify reference key to user_group
           def insert = getInsertStatementWithoutId('user', row)
           
           log.debug "  Executing statement: $insert"
           def result = destSql.executeInsert(insert)
           def userId = result[0][0]
           
           stagingToProdUserIdMap[stagingUserId] = userId
        }

        log.debug("  stagingToProdUserIdMap = $stagingToProdUserIdMap")

        return stagingToProdUserIdMap
    }

    void insertUserVersions(prodCentreId, stagingToProdUserIdMap) {
        log.info "Inserting User Versions..."

        def query = """
            select * from user_versions
            where centre = $STAGING_CENTRE_ID
        """
        sourceSql.rows(query).each { row ->
            // update ID to point to the Production IDs
            // update centre to point to Production centre ID
            row['id'] = stagingToProdUserIdMap[row['id']]
            row['centre'] = prodCentreId   // update the centre ID
            // user_group is the same for Staging and Prod database, so we don't need to modify reference key to user_group
            def insert = getInsertStatement('user_versions', row)
             
            log.debug "  Executing statement: $insert"
            def result = destSql.executeInsert(insert)
        }
    }

    //child has 2 foreign keys: centre and country.
    Map insertChild(prodCentreId) {
        log.info "Inserting Child..."

        def stagingToProdChildIdMap = [:]
        def query = """
            select * from child
            where centre = $STAGING_CENTRE_ID
        """
        sourceSql.rows(query).each { row ->
            //only need to change centre ID, country is the same id.
            def stagingChildId = row['id']

            row.remove('id')  // ID will be generated when inserting
            row['centre'] = prodCentreId   // update the centre ID

            def insert = getInsertStatementWithoutId('child', row)
            log.debug "  Executing statement: $insert"
            def result = destSql.executeInsert(insert)
            def insertedChildId = result[0][0]
            stagingToProdChildIdMap[stagingChildId] = insertedChildId
        }
        return stagingToProdChildIdMap
    }

}
