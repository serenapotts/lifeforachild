import spock.lang.*

class ProcessorSpec extends Specification {
    def "#getInsertStatement returns insert statement with correct columns and values"() {
        given:
        def map = [address: 'No. 2, 1A Cross, Marenahalli, JP Nagar II Phase 560078 Bangalore, India', version: 0, is_deleted: false, name: 'Jnana Sanjeevini Medical Cente', country: 2]

        when:
        def processor = new Processor([])
        def statement = processor.getInsertStatementWithoutId('diabetes_centre', map)

        then:
        statement == "insert into diabetes_centre (address,version,is_deleted,name,country) values ('No. 2, 1A Cross, Marenahalli, JP Nagar II Phase 560078 Bangalore, India','0',false,'Jnana Sanjeevini Medical Cente','2')"
    }

}