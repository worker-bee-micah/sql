# sql


Coding examples for the SQL programming language.

General concepts for building tables, select statements, joins and inserts are covered in notebooks that begin with two zeros.

Data sets are chosen for their cross platform compatibility, you should be able to load them into PostgreSQL, Oracle and SQLite3.

Links to SQL code sources:


[Learning PostgreSQL](https://www.packtpub.com/big-data-and-business-intelligence/learning-postgresql)

[SQL Pocket Guide by Jonathan Gennick](http://shop.oreilly.com/product/9780596005122.do)

[Sam's Teach Yourself SQL](https://www.oreilly.com/library/view/sams-teach-yourself/9780132603911/)
 
[Dave Berry : Pluralsight](https://www.pluralsight.com/authors/david-berry)


I have some SQLite3 examples in this [notebook]{https://nbviewer.jupyter.org/github/worker-bee-micah/sql/blob/master/00_mt_SQLite_builds.ipynb}, This assumes that you have installed the default configuration of Anaconda.  SQLite3 schema contain basic data types, dates are stored a text columns.  The cursor examples will work on a local host, multi-system transactions will require additionalnetwork configurations.


Some basic Oracle based code examples are included here, you should be able to paste these code blocks into SQL*Develper.
[Oracle core builds]{https://nbviewer.jupyter.org/github/worker-bee-micah/sql/blob/master/00_mt_SQL_Oracle_core_builds.ipynb}

This notebook will create the output files prospective_students_import_oracle.sql, treasure_map_yorders.sql.  You should be able to paste these into an IDE console or terminal shell.



PostgreSQL examples that cover the basics are covered in this [notebook]{https://nbviewer.jupyter.org/github/worker-bee-micah/sql/blob/master/00_mt_PostgreSQL_core_builds.ipynb}.  This notebook will create the output files mt_botanica_shema.sql, pg_test_conn.sh   .

Advanced builds and PL/pgSQL notebooks coming soon.







Fin
