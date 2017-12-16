```
usage: neo4j-admin import [--mode=csv] [--database=<name>]
                          [--additional-config=<config-file-path>]
                          [--report-file=<filename>]
                          [--nodes[:Label1:Label2]=<"file1,file2,...">]
                          [--relationships[:RELATIONSHIP_TYPE]=<"file1,file2,...">]
                          [--id-type=<STRING|INTEGER|ACTUAL>]
                          [--input-encoding=<character-set>]
                          [--ignore-extra-columns[=<true|false>]]
                          [--ignore-duplicate-nodes[=<true|false>]]
                          [--ignore-missing-nodes[=<true|false>]]
                          [--multiline-fields[=<true|false>]]
                          [--delimiter=<delimiter-character>]
                          [--array-delimiter=<array-delimiter-character>]
                          [--quote=<quotation-character>]
                          [--max-memory=<max-memory-that-importer-can-use>]
usage: neo4j-admin import --mode=database [--database=<name>]
                          [--additional-config=<config-file-path>]
                          [--from=<source-directory>]

environment variables:
    NEO4J_CONF    Path to directory which contains neo4j.conf.
    NEO4J_DEBUG   Set to anything to enable debug output.
    NEO4J_HOME    Neo4j home directory.
    HEAP_SIZE     Set size of JVM heap during command execution.
                  Takes a number and a unit, for example 512m.

Import a collection of CSV files with --mode=csv (default), or a database from a
pre-3.0 installation with --mode=database.

options:
  --database=<name>
      Name of database. [default:graph.db]
  --additional-config=<config-file-path>
      Configuration file to supply additional configuration in. [default:]
  --mode=<database|csv>
      Import a collection of CSV files or a pre-3.0 installation. [default:csv]
  --from=<source-directory>
      The location of the pre-3.0 database (e.g. <neo4j-root>/data/graph.db).
      [default:]
  --report-file=<filename>
      File in which to store the report of the csv-import.
      [default:import.report]
  --nodes[:Label1:Label2]=<"file1,file2,...">
      Node CSV header and data. Multiple files will be logically seen as one big
      file from the perspective of the importer. The first line must contain the
      header. Multiple data sources like these can be specified in one import,
      where each data source has its own header. Note that file groups must be
      enclosed in quotation marks. [default:]
  --relationships[:RELATIONSHIP_TYPE]=<"file1,file2,...">
      Relationship CSV header and data. Multiple files will be logically seen as
      one big file from the perspective of the importer. Thefirst line must
      contain the header. Multiple data sources like these can be specified in
      one import, where each data source has its own header.Note that file
      groups must be enclosed in quotation marks. [default:]
  --id-type=<STRING|INTEGER|ACTUAL>
      Each node must provide a unique id. This is used to find the correct nodes
      when creating relationships. Possible values are:
        STRING: arbitrary strings for identifying nodes,
        INTEGER: arbitrary integer values for identifying nodes,
        ACTUAL: (advanced) actual node ids.
      For more information on id handling, please see the Neo4j Manual:
      https://neo4j.com/docs/operations-manual/current/tools/import/
      [default:STRING]
  --input-encoding=<character-set>
      Character set that input data is encoded in. [default:UTF-8]
  --ignore-extra-columns=<true|false>
      If un-specified columns should be ignored during the import.
      [default:false]
  --ignore-duplicate-nodes=<true|false>
      If duplicate nodes should be ignored during the import. [default:false]
  --ignore-missing-nodes=<true|false>
      If relationships referring to missing nodes should be ignored during the
      import. [default:false]
  --multiline-fields=<true|false>
      Whether or not fields from input source can span multiple lines, i.e.
      contain newline characters. [default:false]
  --delimiter=<,>
      Delimiter character between values in CSV data. [default:,]
  --array-delimiter=<,>
      Delimiter character between array elements within a value in CSV data.
      [default:;]
  --quote=<quotation-character>
      Character to treat as quotation character for values in CSV data. Quotes
      can be escaped as per RFC 4180 by doubling them, for example "" would be
      interpreted as a literal ". You cannot escape using \.[default:"]
  --max-memory=<max-memory-that-importer-can-use>
      Maximum memory that neo4j-admin can use for various data structures and
      caching to improve performance. Values can be plain numbers, like 10000000
      or e.g. 20G for 20 gigabyte, or even e.g. 70%. [default:90%]
```
