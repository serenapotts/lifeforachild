#!/usr/bin/env groovy

@GrabConfig(systemClassLoader=true)
@Grab('mysql:mysql-connector-java:5.1.27')
@Grab('log4j:log4j:1.2.17')

def cli = new CliBuilder(usage:'data-fix-india-centre')
cli.u(longOpt: 'user', args: 1, argName: 'user', required: true, 'DB user')
cli.p(longOpt: 'password', args: 1, argName: 'password', required: true, 'DB password')
cli.s(longOpt: 'sourceSchema', args: 1, argName: 'sourceDbSchema', required: true, 'staging DB schema')
cli.d(longOpt: 'destinationSchema', args: 1, argName: 'destDbSchema', required: true, 'production DB schema')
cli.h(longOpt: 'host', args: 1, argName: 'dbHost', 'DB host, default to be localhost')

def opts = cli.parse(args)
if (!opts) {
    System.exit(1)
}

new Processor(opts).run()
