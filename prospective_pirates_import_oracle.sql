--create a practice schema to import into the db
CREATE TABLE prospective_pirates_IO_table
(
        first_name        VARCHAR2(50),
        last_name         VARCHAR2(50),
        slip_number       VARCHAR2(5),
        port              VARCHAR2(60),
        govenar           VARCHAR2(50),
        snail_mail        VARCHAR2(50) ,
        date_of_piercing  DATE,
        grog_ration       NUMBER(3,2)
)
ORGANIZATION EXTERNAL --the secction below is what makes this an external table
         TYPE ORACLE_LOADER   --tells Oracle we are importing a flat or text file, i.e. not data pump files
         DEFAULT DIRECTORY data_import --specify dir object
         ACCESS PARAMETERS --importing a fixed width files
         RECORDS  FIXED 149  --this is the length of each line in the file in bytes, includes new line chars at end
         LOGFILE  data_import:'prospective_students_fw.log'  --will do default, better to name them
         BADFILE  data_import:'prospective_students_fw.bad'  --rejected records not imported go here
         FIELDS  --most important part, specify the structure of import file, tells Oracle how to read it
         (     first_name     CHAR(22),  --Oracle will map these names to the above table def,
               middle_init    CHAR(1),   --note this is not needed in the create table statement, db still needs to know
               last_name      CHAR(22),
               street_address CHAR(33), 
               city           CHAR(22), 
               state          CHAR(2),
               email_address  CHAR(66),
               date_of_birth  CHAR(10), DATE_FORMAT DATE MASK "MM/DD/YYYY", --do not import as text
               gpa            CHAR(4)
          )
        )
LOCATION ('prospective_students.dat')  --no absolute path, referenced above
)
REJECT LIMIT UNLIMITED;    --bad data is all rejected, or import and filter out later