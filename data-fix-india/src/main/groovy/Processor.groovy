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
            if (rowData[it] == null || rowData[it].getClass() == Boolean) {
                rowData[it]
            } else {
                // wrap around quote to turn to String for insert.
                "'${rowData[it]}'"
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

        def prodCentreId = insertCentre()
        //only need to update centre ID. Country ID and user_group are the same in both Staging and Production
        def stagingToProdUserIdMap = insertToPrimaryTable('user', [centre: prodCentreId])
        insertToVersionTable('user_versions', [centre: prodCentreId], stagingToProdUserIdMap)

        //only need to update centre ID. Country ID is the same in both Staging and Production
        def stagingToProdChildIdMap = insertToPrimaryTable('child', [centre: prodCentreId])
        insertToVersionTable('child_versions', [centre: prodCentreId], stagingToProdChildIdMap)
    }

    Integer insertCentre() {
        log.info "Inserting 'diabetes_centre'..."
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

    Map insertToPrimaryTable(tableName, updateFieldValueMap) {
        log.info "Inserting '$tableName'..."

        def stagingToProdIdMap = [:]
        def query = "select * from " + tableName + " where centre = $STAGING_CENTRE_ID"
        sourceSql.rows(query).each { row ->
            def stagingId = row['id']

            row.remove('id')
            updateFieldValueMap.each { field, value -> 
                row[field] = value
            }

           def insert = getInsertStatementWithoutId(tableName, row)
           
           log.debug "  Executing statement: $insert"
           def result = destSql.executeInsert(insert)
           def id = result[0][0]
           
           stagingToProdIdMap[stagingId] = id
        }

        log.info("  stagingToProdIdMap = $stagingToProdIdMap")

        return stagingToProdIdMap
    }

    void insertToVersionTable(tableName, updateFieldValueMap, stagingToProdIdMap) {
        log.info "Inserting '$tableName'..."

        def query = "select * from " + tableName + " where centre = $STAGING_CENTRE_ID"
        sourceSql.rows(query).each { row ->
            // update ID to point to the Production IDs
            // update centre to point to Production centre ID
            row['id'] = stagingToProdIdMap[row['id']]

            updateFieldValueMap.each { field, value -> 
                row[field] = value
            }
            
            def insert = getInsertStatement(tableName, row)
             
            log.debug "  Executing statement: $insert"
            def result = destSql.executeInsert(insert)
        }
    }
}
