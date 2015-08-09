import spock.lang.*
import groovy.sql.Sql

class ProcessorSpec extends Specification {
    
    def "#getInsertStatement returns insert statement with correct columns and values"() {
        given: 'data with false and null values'
        def map = [address: 'No. 2, 1A Cross, Marenahalli, JP Nagar II Phase 560078 Bangalore, India', version: 0, is_deleted: false, name: 'Jnana Sanjeevini Medical Cente', country: 2, no_value_column: null]

        when:
        def processor = new Processor([])
        def statement = processor.getInsertStatementWithoutId('diabetes_centre', map)

        then:
        statement == "insert into diabetes_centre (address,version,is_deleted,name,country,no_value_column) values ('No. 2, 1A Cross, Marenahalli, JP Nagar II Phase 560078 Bangalore, India','0',false,'Jnana Sanjeevini Medical Cente','2',null)"
    }

    def "#insertCentre"() {
        given: 'sql is mocked'
        def processor = new Processor([])
        Sql sourceSql = Mock(Sql)
        Sql destSql = Mock(Sql)

        and:
        sourceSql.rows(_) >> [
            [id: 13, address: 'No. 2, 1A Cross, Marenahalli', version: 1, name: 'My Centre']
        ]

        destSql.executeInsert(_) >> [[20]]

        processor.sourceSql = sourceSql
        processor.destSql = destSql

        def tableParam
        def dataParams = []
        processor.metaClass.getInsertStatementWithoutId = { table, data ->
            tableParam = table
            dataParams << data
            return "mock insert into statement..."
        }

        when: 
        Integer id = processor.insertCentre()

        then: 'insert to the right table, row does not have ID'
        tableParam == 'diabetes_centre'
        dataParams == [[address: 'No. 2, 1A Cross, Marenahalli', version: 1, name: 'My Centre']]

        and: 'correct id returned'
        id == 20
    }

    def "#insertToPrimaryTable returns a map from stagingId to prodId"() {
        given: 'sql is mocked'
        def processor = new Processor([])
        Sql sourceSql = Mock(Sql)
        Sql destSql = Mock(Sql)

        and: 'we have 2 rows in child table, ids 10 and 11'
        sourceSql.rows(_) >> [
            [id: 10, age_at_diagnosis: 7, ethnic_group: 'abc', centre: 13, country: 2],
            [id: 11, age_at_diagnosis: 9, ethnic_group: 'abc', centre: 13, country: 2],
        ]

        and: 'insert returns 2 ids: 20 and 21'
        destSql.executeInsert(_) >>> [
            [[20]],
            [[21]]
        ]

        processor.sourceSql = sourceSql
        processor.destSql = destSql

        def prodCentreId = 65

        def tableParam
        def dataParams = []
        processor.metaClass.getInsertStatementWithoutId = { table, data ->
            tableParam = table
            dataParams << data
            return "mock insert into statement..."
        }

        when:
        Map stagingToProdIds = processor.insertToPrimaryTable('child', [centre: prodCentreId])

        then: 'data inserted does not contain ID and centre ID has changed to the Production ones'
        tableParam == 'child'
        dataParams == [
            [age_at_diagnosis: 7, ethnic_group: 'abc', centre: 65, country: 2],
            [age_at_diagnosis: 9, ethnic_group: 'abc', centre: 65, country: 2]
        ]
        
        and: 'map with keys as 10, 11 and values as 20, 21'
        stagingToProdIds == [10: 20, 11: 21]
    }

    def "#insertToPrimaryTable for report returns a map from stagingId to prodId"() {
        given: 'sql is mocked'
        def processor = new Processor([])
        Sql sourceSql = Mock(Sql)
        Sql destSql = Mock(Sql)

        and: 'we have 2 rows in report table, ids 10 and 11'
        sourceSql.rows(_) >> [
            [id: 10, record_number: 13, centre: 13, country: 2, viewable_by: 22],
            [id: 11, record_number: 14, centre: 13, country: 2, viewable_by: 23]
        ]

        and: 'insert returns 2 ids: 20 and 21'
        destSql.executeInsert(_) >>> [
            [[20]],
            [[21]]
        ]

        processor.sourceSql = sourceSql
        processor.destSql = destSql

        def prodCentreId = 65

        def tableParam
        def dataParams = []
        processor.metaClass.getInsertStatementWithoutId = { table, data ->
            tableParam = table
            dataParams << data
            return "mock insert into statement..."
        }

        def userStagingToProdIdMap = [22: 32, 23: 33]

        when:
        Map stagingToProdIds = processor.insertToPrimaryTable('report', [centre: prodCentreId], [viewable_by: userStagingToProdIdMap])

        then: 'data inserted does not contain ID and centre ID has changed to the Production ones'
        tableParam == 'report'
        dataParams == [
            [record_number: 13, centre: 65, country: 2, viewable_by: 32],
            [record_number: 14, centre: 65, country: 2, viewable_by: 33]
        ]
        
        and: 'map with keys as 10, 11 and values as 20, 21'
        stagingToProdIds == [10: 20, 11: 21]
    }

    def "#insertToNonPrimaryKeyTable test for child_versions"() {
        given: 'sql is mocked'
        def processor = new Processor([])
        Sql sourceSql = Mock(Sql)
        Sql destSql = Mock(Sql)

        and: 'we have 2 rows in child_versions table, ids 10 and 11'
        sourceSql.rows(_) >> [
            [id: 10, age_at_diagnosis: 7, ethnic_group: 'abc', centre: 13, country: 2],
            [id: 11, age_at_diagnosis: 9, ethnic_group: 'abc', centre: 13, country: 2],
        ]

        processor.sourceSql = sourceSql
        processor.destSql = destSql

        def prodCentreId = 65

        def tableParam
        def dataParams = []
        processor.metaClass.getInsertStatement = { table, data ->
            tableParam = table
            dataParams << data
            return "mock insert into statement..."
        }

        def stagingToProdChildIds = [10: 20, 11: 21]

        def query = processor.getQueryForCentre('child_versions')

        when:
        processor.insertToNonPrimaryKeyTable('child_versions', query, [centre: prodCentreId], [id: stagingToProdChildIds])

        then: 'data inserted contains Production Child ID and Production Centre ID'
        tableParam == 'child_versions'
        dataParams == [
            [id: 20, age_at_diagnosis: 7, ethnic_group: 'abc', centre: 65, country: 2],
            [id: 21, age_at_diagnosis: 9, ethnic_group: 'abc', centre: 65, country: 2]
        ]
    }

    def "#insertToNonPrimaryKeyTable test for report_childfields"() {
        given: 'sql is mocked'
        def processor = new Processor([])
        Sql sourceSql = Mock(Sql)
        Sql destSql = Mock(Sql)

        and: 'we have 2 rows in child_versions table, ids 10 and 11'
        sourceSql.rows(_) >> [
            [report: 10, element: 30, child_fields: 1],
            [report: 11, element: 31, child_fields: 2]
        ]

        processor.sourceSql = sourceSql
        processor.destSql = destSql

        def tableParam
        def dataParams = []
        processor.metaClass.getInsertStatement = { table, data ->
            tableParam = table
            dataParams << data
            return "mock insert into statement..."
        }

        def reportStagingToProdIdMap = [10: 20, 11: 21]

        def query = processor.getQueryForReport('report_childfields', reportStagingToProdIdMap.keySet())

        when:
        processor.insertToNonPrimaryKeyTable('report_childfields', query, null, [report: reportStagingToProdIdMap])

        then: 'data inserted contains Production report ID'
        tableParam == 'report_childfields'
        dataParams == [
            [report: 20, element: 30, child_fields: 1],
            [report: 21, element: 31, child_fields: 2]
        ]
    }

    def "#getQueryForReport"() {
        given:
        def reportStagingToProdIdMap = [10: 20, 11: 21]
        def processor = new Processor([])

        when:
        def query = processor.getQueryForReport('report_childfields', reportStagingToProdIdMap.keySet())

        then:
        query == 'select * from report_childfields where report in (10,11)'
    }
}