import groovy.sql.Sql
import org.apache.log4j.*
import groovy.util.logging.*

@Log4j
class Processor {
    def opts
    def host

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

    String getInsertStatement(tableName, rowData) {
        assert !rowData.keySet().contains('id')
        def columns = rowData.keySet().join(',')
        def values = rowData.keySet().collect { rowData[it].getClass() == Boolean ? rowData[it] : "'${rowData[it]}'" }.join(',')
        "insert into $tableName ($columns) values ($values)"
    }

    void run() {
        log.info "Host: $host"
        log.info "User  : ${opts.u}"
        log.info "Password: ${opts.p}"
        log.info "Source schema: ${opts.s}"
        log.info "Destination schema: ${opts.d}"

        def sourceDb = [url: "jdbc:mysql://${host}:3306/${opts.s}", user: opts.u, password: opts.p, driver: 'com.mysql.jdbc.Driver']
        def sourceSql = Sql.newInstance(sourceDb.url, sourceDb.user, sourceDb.password, sourceDb.driver)

        def destDb = [url: "jdbc:mysql://${host}:3306/${opts.d}", user: opts.u, password: opts.p, driver: 'com.mysql.jdbc.Driver']
        def destSql = Sql.newInstance(destDb.url, destDb.user, destDb.password, destDb.driver)

        def diabetesCentreQuery = """
            select * from diabetes_centre
            where id = 13
        """
        sourceSql.rows(diabetesCentreQuery).each { row ->
           row.remove("id")
           def insert = getInsertStatement('diabetes_centre', row)

           log.debug insert

           
           
        }
    }
}
