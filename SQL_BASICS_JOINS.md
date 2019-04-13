#SQL Basics
------
**Sources**

Links to SQL code sources:

[Learning PostgreSQL](https://www.packtpub.com/big-data-and-business-intelligence/learning-postgresql)

[SQL Pocket Guide by Jonathan Gennick](http://shop.oreilly.com/product/9780596005122.do)

["Sam's Teach Yourself SQL"](https://www.oreilly.com/library/view/sams-teach-yourself/9780132603911/)
 
[Dave Berry : Pluralsight](https://www.pluralsight.com/authors/david-berry)

 

Syntax for database builds and queries are included in this notebook.
The various code blocks should work across vendors and platforms unless noted otherwise.

##Table Joins


Multiple tables are combined to return one result-set row.
Old syntax used comma separate table list. Now you can specify with the JOIN clause.
Generally you do not want a Cartesian product or CROSS JOIN on large data sets.
___
>SELECT o.name AS office, d.name AS deck
> 
>FROM facility_office o, ship_deck d;
___

Add the WHERE clause to reduce the number of rows returned:
 
>WHERE o.room_id = c.room_id;


___
**Cross Joins, Cartesian Product**
If you do not join the tables, all possible rows will result.

>SELECT *
> 
>FROM upfall CROSS JOIN county;
>
>SELECT e.emp_id, e.last_name, p.position
> 
>FROM employee_tbl e,
> 
>     employee_pay_table p;

___
**Equijoins, Non-Equijoins**
Usually based on primary keys common to both tables. 

>SELECT table1.col1, table2.col2 .....
>
>FROM table1, table2, table3
>
>WHERE table1.col_name = table2.col_name
>
> AND table1.col_name = table3.col_name


Non-equijoin, each row is matched with all rows from table2 
Syntax:
 
>SELECT table1, table 2, table3
> 
>WHERE table1.col_name != table2.col_name
> 
>AND table1.col_name != table3.col_name;
> 
>//AND table1.col_name <> table3.col_name;


___
**Inner joins**
Returns records from the left table and the matched records from the right.
Forms a Cartesian product, then filters the rows with the join conditions.
 Table order does not matter with inner joins. 
 
Basic syntax:
 
>SELECT  table1.col1, table2.col2 ...
> 
>FROM table1
> 
>INNER JOIN table2 ON table1.col_name = table2.col_name;
 

Another example:
>SELECT *
> 
>FROM orders
> 
>INNER JOIN customers
>
>ON orders.customer_id = customers.customer_id;


Employee example:
 
>SELECT a.last_name, b.last_name, a.first_name
> 
>FROM employee_tbl a
> 
>INNER JOIN employee_tbl b
> 
>ON a.last_name = b.last_name;

 
Waterfall example WITH clause 

>SELECT u.name AS fall, c.name AS county
>
>FROM upfall u INNER JOIN county c
> 
>  ON u.county_id = c.id
> 
>WHERE c.population > 10000;
 
  

_________
**Self Joins:** 
Join a table to itself, want to compare records.
Can use the INNER JOIN ..ON .. syntax, or include the table twice in
the FROM clause of the query, give two aliases. 
 

>SELECT e1.name, e2.name
> 
>FROM emp e1, emp e2
> 
>WHERE e1.mgr_id = e2.id;
 

Another example:
 
>SELECT a.last_name, b.last_name, a.first_name
> 
>FROM employee_tbl a,
> 
>     employee_tbl b
> 
>WHERE a.last_name = b.last_name;




___
**Outer Joins**
Return all rows in table1, even if related row in table2 does not exist.

General syntax:
 
>FROM table1
> 
>RIGHT LEFT FULL OUTER JOIN
> 
>ON table2

 
*Left Outer Join*
 
Returns all records from the left table, and the matched records from the right table.
e.g. you want a list of all waterfalls, its ok that some do not have owners. 

 
>SELECT *
> 
>FROM orders
> 
>LEFT JOIN customers
> 
>ON orders.cust_id = customers.cust_id;

 
Another example:
 
>SELECT p.prod_desc, o.qty
> 
>FROM products_tbl p
> 
>LEFT OUTER JOIN orders_tbl o
> 
>ON p.prod_id = o.prod_id;
>//all products are returned even if orders = 0
 

*Right Outer Join*
Return all records fromthe right table, and the matched records from the left.
 
>SELECT *
> 
>FROM orders
> 
>RIGHT JOIN customers
> 
>ON orders.customer_id = customers.customer_id'




Oracle: The plus (+) symbol goes after the table that is missing rows.
Syntax:
 
>FROM table1 , table2, table3
> 
>WHERE table1.col_name, = table2.col_name(+)
> 
>AND table1.col_name = table3.col_name(+);

 
Oracle product example:
 
>SELECT P.PROD_DESC, O.QTY
> 
>FROM PRODUCTS_TBL P,
> 
>     ORDERS_TBL O
> 
>WHERE P.PROD_ID = O.PROD_ID(+);
 
 
A more verbose version of the above join syntax:
 
>SELECT P.PROD_DESC, O.QTY
> 
>FROM PRODUCTS_TBL P
> 
>LEFT OUTER JOIN ORDERS_TBL 0
> 
>ON P.PROD_ID = O.PROD_ID;
 


