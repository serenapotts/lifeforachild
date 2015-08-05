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

    def "#insertChild returns a map from stagingChildId to prodChildId"() {
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
        Map stagingToProdIds = processor.insertChild(prodCentreId)

        then: 'data inserted does not contain ID and centre ID has changed to the Production ones'
        tableParam == 'child'
        dataParams == [
            [age_at_diagnosis: 7, ethnic_group: 'abc', centre: 65, country: 2],
            [age_at_diagnosis: 9, ethnic_group: 'abc', centre: 65, country: 2]
        ]
        
        and: 'map with keys as 10, 11 and values as 20, 21'
        stagingToProdIds == [10: 20, 11: 21]
    }
}