#Build Queries with the SELECT statement

Retreive data from a table and/or view with a *query*.  Combine with a hierarchical query or subqueries which are covered after the basiscs.

General syntax:
    
>SELECT   *expression_lists*, comma separated, becomes a column in the results.
>
>FROM     *data_source*
>
>WHERE    *predicates*
>
>GROUP BY *expression_lists*
>
>HAVING   *predicates*
>
>ORDER BY *expression_lists*


**SELECT Statements**

Return specific list of columns, all * or an expression
Select expressions example:
    
>SELECT name, ROUND(population * 0.90, 0)
>
>FROM county;

Oracle has a special table that contains one row of the current date time:
    
>SELECT SYSDATE
>
>FROM dual;

MySQL select date time:
    
>SELECT getdate();

Specify an alias for the expression, separate by at least one space:
    
>SELECT id, name,
>
>   ROUND(population * 0.90, 0) est_pop  --optional AS est_pop 
>FROM county;

Case and Punctuation in Names:

    
    
Subqueries in the SELECT statement:


Qualifying column names:
    
    
ALL and DISTINCT:
Eliminate duplicate rows in the result set. 





____
**Predicates**

|Comparison operators  | Usage                                            |

|---------------------:|--------------------------------------------------|
    
|=                     | Equals                                           |
|!= , <>               | Inequality                                       |
|< , <=                | Less than or equal to                            |
|>, >=                 | Greater than or equal to                         |
|BETWEEN               | Is value within range                            |
|EXISTS, NOT EXISTS    | Does it match a condition                        |
|IN                    | Is value contained in a set of specified values  |
|IS NOT NULL           | Nullity tests                                    |
|LIKE, NOT LIKE        |Does a value match a pattern                      |
|LIKEC, LIKE2, LIKE4   |Oralc only: Unicode chars, code units, code points|
|REGEXP, RLIKE         |MySQL only, comparison operators                  |
|REGEXP_LIKE           |Oracle only, value matches pattern tests          |


____
____
*WHERE  examples* Between:
    
>SELECT c.name
>
>FROM county c
>
>WHERE c.population BETWEEN 5432 AND 12345;


Between with operators:
    
>SELECT c.name
>
>FROM county c
>
>WHERE   c.population >= 5432
>
>    AND c.population <= 12345;


Exists:
    
>SELECT o.id, o.name
>
>FROM owner o  
>
>WHERE EXISTS (SELECT * FROM upfall u     --replace with NOT EXISTS as needed
>
>    WHERE u.owner_id = o.id);


In:
    
>SELECT o.id, o.name
>
>FROM owner o
>
>WHERE o.id IN (1,3,5,7);


Another IN example, should return the same as above EXISTS example:

>SELECT o.id, o.name
>
>FROM county c
>
>WHERE o.id IN (SELECT u.owner_id
>                
>    FROM upfall u);


Null examples:
    
>IS NULL
>
>IS NOT NULL

    
LIKE, NOT LIKE
Provides basic pattern-matching predicates. %Percent multi-char, _underscore one-char.

>SELECT u.id, u.name
>
>FROM upfall u
>
>WHERE u.name LIKE '%Pirates%';


Find all falls without "Pirates", PostgreSQL and MySQL:
    
Use the backslash character

>SELECT u.id, u.name
>
>FROM upfall u
>
>WHERE u.name NOT LIKE '%\%%'; --find all falls w/o % in the name


The ESCAPE clause in PostgreSQL and MySQL if you need to quote the backslash

>SELECT u,id, u.name
>
>FROM upfallu
>
>WHERE u.name NOT LIKE '%\%%'   ESCAPE '\\';



ESCAPE example for Oracle syntax:
    
>SELECT u.id, u.name
>
>FROM upfall u
>
>WHERE u.name NOT LIKE '%\%%' ESCAPE '\';
