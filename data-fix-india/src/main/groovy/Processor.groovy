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

        def query

        def prodCentreId = insertCentre()
        //only need to update centre ID. Country ID and user_group are the same in both Staging and Production
        def userStagingToProdIdMap = insertToPrimaryTable('user', [centre: prodCentreId])
        query = getQueryForCentre('user_versions')
        insertToNonPrimaryKeyTable('user_versions', query, [centre: prodCentreId], [id: userStagingToProdIdMap])

        //only need to update centre ID. Country ID is the same in both Staging and Production
        def childStagingToProdIdMap = insertToPrimaryTable('child', [centre: prodCentreId])
        query = getQueryForCentre('child_versions')
        insertToNonPrimaryKeyTable('child_versions', query, [centre: prodCentreId], [id: childStagingToProdIdMap])

        def reportStagingToProdIdMap = insertToPrimaryTable('report', [centre: prodCentreId], [viewable_by: userStagingToProdIdMap])
        query = getQueryForReport('report_childfields', reportStagingToProdIdMap.keySet())
        insertToNonPrimaryKeyTable('report_childfields', query, null, [report: reportStagingToProdIdMap])

        query = getQueryForReport('report_clinicalrecordfields', reportStagingToProdIdMap.keySet())
        insertToNonPrimaryKeyTable('report_clinicalrecordfields', query, null, [report: reportStagingToProdIdMap])
    }

    Integer insertCentre() {
        log.info "Inserting 'diabetes_centre'..."
        def centreId
        def query = """
            select * from diabetes_centre
            where id = $STAGING_CENTRE_ID
        """
        log.debug "  Query = $query"
        sourceSql.rows(query).each { row ->
           row.remove('id')
           def insert = getInsertStatementWithoutId('diabetes_centre', row)
           
           log.debug "  Executing statement: $insert"
           def result = destSql.executeInsert(insert)
           centreId = result[0][0]
           log.debug "  ID inserted: $centreId"
        }
        return centreId
    }

    Map insertToPrimaryTable(tableName, updateFieldValueMap, referenceFieldValueMap = null) {
        log.info "Inserting '$tableName'..."

        def stagingToProdIdMap = [:]
        def query = "select * from " + tableName + " where centre = $STAGING_CENTRE_ID"
        log.debug "  Query = $query"
        sourceSql.rows(query).each { row ->
            def stagingId = row['id']

            row.remove('id')
            updateFieldValueMap.each { field, value -> 
                row[field] = value
            }

            referenceFieldValueMap?.each { field, idMap ->
                row[field] = idMap[row[field]]
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

    void insertToNonPrimaryKeyTable(tableName, query, updateFieldValueMap, referenceFieldValueMap) {
        log.info "Inserting '$tableName'..."

        log.debug "  Query = $query"
        sourceSql.rows(query).each { row ->
            updateFieldValueMap?.each { field, value -> 
                row[field] = value
            }

            referenceFieldValueMap?.each { field, idMap ->
                row[field] = idMap[row[field]]
            }

            def insert = getInsertStatement(tableName, row)
             
            log.debug "  Executing statement: $insert"
            def result = destSql.executeInsert(insert)
        }
    }

    String getQueryForCentre(tableName) {
        "select * from " + tableName + " where centre = $STAGING_CENTRE_ID"
    }

    String getQueryForReport(tableName, ids) {
        "select * from " + tableName + " where report in (" + ids.join(',') + ")"
    }
}
