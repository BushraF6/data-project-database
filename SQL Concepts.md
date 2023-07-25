# SQL CONCEPTS #

## ACID ##

- DBMS is the management of data that should remain integrated when any changes are done in it. If the integrity of the data is affected, whole data will get disturbed and corrupted.
- Therefore, to maintain the integrity of the data, there are four properties described in the database management system, which are known as the ACID properties.
- ACID stands for Atomic, Consistent, Isolation, and Durability.

### Atomicity ###

- All changes to data are performed as if they are a single operation. That is, all the changes are performed, or none of them are.
- For example, in an application that transfers funds from one account to another, the atomicity property ensures that, if a debit is made successfully from one account, the corresponding credit is made to the other account.

![example: Failed transaction](https://static.javatpoint.com/dbms/images/acid-properties-in-dbms2.png)
![example: Successful Transaction](https://static.javatpoint.com/dbms/images/acid-properties-in-dbms3.png)

### Consistency ###

- Data is in a consistent state when a transaction starts and when it ends.
- For example, in an application that transfers funds from one account to another, the consistency property ensures that the total value of funds in both the accounts is the same at the start and end of each transaction.

![example: transaction](https://static.javatpoint.com/dbms/images/acid-properties-in-dbms4.png)

### Isolation ###

- The intermediate state of a transaction is invisible to other transactions. As a result, transactions that run concurrently appear to be serialized.
- For example, in an application that transfers funds from one account to another, the isolation property ensures that another transaction sees the transferred funds in one account or the other, but not in both, nor in neither.

![example: transactio](https://static.javatpoint.com/dbms/images/acid-properties-in-dbms5.png)

### Durability ###

- After a transaction successfully completes, changes to data persist and are not undone, even in the event of a system failure.
- For example, in an application that transfers funds from one account to another, the durability property ensures that the changes made to each account will not be reversed.

## CAP Theorem ##

- The CAP theorem (also called Brewer’s theorem) states that a distributed database system can only guarantee two out of these three characteristics:-
  - Consistency.
  - Availability.
  - Partition Tolerance.

### Consistency ###

- A system is said to be consistent if all nodes see the same data at the same time.
- Simply, if we perform a read operation on a consistent system, it should return the value of the most recent write operation. This means that, the read should cause all nodes to return the same data, i.e., the value of the most recent write.

![example](https://www.educative.io/api/edpresso/shot/6661082609352704/image/5685265389584384)

### Availability ###

Availability in a distributed system ensures that the system remains operational 100% of the time. Every request gets a (non-error) response regardless of the individual state of a node.

Note: this does not guarantee that the response contains the most recent write.

![example](https://www.educative.io/api/edpresso/shot/6661082609352704/image/5717271485874176)

### Partition Tolerance ###

- This condition states that the system does not fail, regardless of if messages are dropped or delayed between nodes in a system.

- Partition tolerance has become more of a necessity than an option in distributed systems.
- It is made possible by sufficiently replicating records across combinations of nodes and networks.

## JOINS ##

- JOINS in SQL are commands which are used to combine rows from two or more tables, based on a related column between those tables.  
- There are predominantly used when a user is trying to extract data from tables which have one-to-many or many-to-many relationships between them.

### TYPES OF JOINS ###

![overview of joins](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2019/03/Joins-in-SQL-SQL-Joins-Edureka.png)

### INNER JOIN ###

- This type of join returns those records which have matching values in both tables.
- Syntax:
  - SELECT Table1.Column1,Table1.Column2,Table2.Column1,....
    FROM Table1
    INNER JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;
NOTE: You can either use the keyword INNER JOIN or JOIN to perform this operation.

### LEFT OUTER JOIN ###

- The LEFT JOIN or the LEFT OUTER JOIN  returns all the records from the left table and also those records which satisfy a condition from the right table.
- Also, for the records having no matching values in the right table, the output or the result-set will contain the NULL values.
- Syntax:
  - SELECT Table1.Column1,Table1.Column2,Table2.Column1,....
    FROM Table1
    LEFT JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;

### RIGHT OUTER JOIN ###

- The RIGHT JOIN or the RIGHT OUTER JOIN  returns all the records from the right table and also those records which satisfy a condition from the left table.
- Also, for the records having no matching values in the left table, the output or the result-set will contain the NULL values.
- Syntax:
  - SELECT Table1.Column1,Table1.Column2,Table2.Column1,....
    FROM Table1
    RIGHT JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;

### FULL OUTER JOIN ###

- Full Join or the Full Outer Join returns all those records which either have a match in the left(Table1) or the right(Table2) table.
- Syntax:
  - SELECT Table1.Column1,Table1.Column2,Table2.Column1,....
    FROM Table1
    FULL JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;

## Aggregations and Filters ##

- SQL aggregation function is used to perform the calculations on multiple rows of a single column of a table. It returns a single value.
- It is also used to summarize the data.

### Aggregate Functions ###

- COUNT(*), COUNT(column):-
  - A common function used to counts the number of rows in the group if no column name is specified.
  - Otherwise, count the number of rows in the group with non-NULL values in the specified column.
- MIN(column):-
  - Finds the smallest numerical value in the specified column for all rows in the group.
- MAX(column):-
  - Finds the largest numerical value in the specified column for all rows in the group.
- AVG(column):-
  - Finds the average numerical value in the specified column for all rows in the group.
- SUM(column):-
  - Finds the sum of all numerical values in the specified column for the rows in the group.

Grouped aggregate functions:

- In addition to aggregating across all the rows, you can instead apply the aggregate functions to individual groups of data within that group. This would then create as many results as there are unique groups defined as by the GROUP BY clause.
- The GROUP BY clause works by grouping rows that have the same value in the column specified.

### Filter - WHERE Clause ###

- The WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.

- Syntax:-
  - SELECT column1, column2, ...
    FROM table_name
    WHERE condition;

Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.

## NORMALIZATION ##

- Normalization is the process to eliminate data redundancy and enhance data integrity in the table. - Normalization also helps to organize the data in the database.
- It is a multi-step process that sets the data into tabular form and removes the duplicated data from the relational tables.
- Following are the types of normal forms.

### 1st Normal Form (1NF) ###

- A table is referred to as being in its First Normal Form if atomicity of the table is 1.
- Here, atomicity states that a single cell cannot hold multiple values. It must hold only a single-valued attribute.
- The First normal form disallows the multi-valued attribute, composite attribute, and their combinations.

### 2nd Normal Form (2NF) ###

- The first condition for the table to be in Second Normal Form is that the table has to be in First Normal Form.
- The table should not possess partial dependency. The partial dependency here means the proper subset of the candidate key should give a non-prime attribute.

### 3rd Normal Form (3NF) ###

- The first condition for the table to be in Third Normal Form is that the table should be in the Second Normal Form.
- The second condition is that there should be no transitive dependency for non-prime attributes, which indicates that non-prime attributes (which are not a part of the candidate key) should not depend on other non-prime attributes in a table. Therefore, a transitive dependency is a functional dependency in which A → C (A determines C) indirectly, because of A → B and B → C (where it is not the case that B → A).
- The third Normal Form ensures the reduction of data duplication. It is also used to achieve data integrity.

### Boyce CoddNormal Form (BCNF) ###

- Boyce Codd Normal Form is also known as 3.5 NF.
- It is the superior version of 3NF and was developed by Raymond F.
- Boyce and Edgar F. Codd to tackle certain types of anomalies which were not resolved with 3NF.
- The first condition for the table to be in Boyce Codd Normal Form is that the table should be in the third normal form.
- Secondly, every Right-Hand Side (RHS) attribute of the functional dependencies should depend on the super key of that particular table.

## INDEXES ##

- The Index in SQL is a special table used to speed up the searching of the data in the database tables.
- It also retrieves a vast amount of data from the tables frequently. The INDEX requires its own space in the hard disk.
- An Index is created on the fields of the tables. We can easily build one or more indexes on a table.
- The creation and deletion of the Index do not affect the data of the database.
- SQL Indexes can search the information of the large database quickly.
- This concept is a quick process for those columns, including different values.
- This data structure sorts the data values of columns (fields) either in ascending or descending order. And then, it assigns the entry for each value.
- Each Index table contains only two columns. The first column is row_id, and the other is indexed-column.
- When indexes are used with smaller tables, the performance of the index may not be recognized.

## Transactions ##

- A transaction is the logical work unit that performs a single activity or multiple activities in a database.
- Transactions may consist of a single read, write, delete, or update operations or a combination of these.

### Transaction Control ###

The following commands are used to control transactions.

- COMMIT − to save the changes.

- ROLLBACK − to roll back the changes.

- SAVEPOINT − creates points within the groups of transactions in which to ROLLBACK.

- SET TRANSACTION − Places a name on a transaction.

Transactional control commands are only used with the DML Commands such as - INSERT, UPDATE and DELETE only. They cannot be used while creating tables or dropping them because these operations are automatically committed in the database.

## LOCKING MECHANISM ##

- The lock is a mechanism associated with a table for restricting unauthorized access to the data. It is mainly used to solve the concurrency problem in transactions.
- We can apply a lock on row level, database level, table level, and page level.
- For example, if an exclusive (X) lock is held on a row within a table by a transaction, no other transaction can modify that row until the lock is released.
- Minimizing locks increases concurrency, which can improve performance.
- Multiple instances of the Locks object can be monitored at the same time, with each instance representing a lock on a resource type.
- The basic syntax used for LOCKING a table in SQL is as follows:
  - LOCK [ TABLE ] [ ONLY ]
    table_name
    [ IN lock_mode MODE ] [ NOWAIT ];

## Database Isolation Levels ##

- Database isolation defines the degree to which a transaction must be isolated from the data modifications made by any other transaction(even though in reality there can be a large number of concurrently running transactions).
- The overarching goal is to prevent reads and writes of temporary, aborted, or otherwise incorrect data written by concurrent transactions.

### The four standard isolation levels ###

![four isolation levels](<https://media.geeksforgeeks.org/wp-content/cdn-uploads/transactnLevel.png>)

- Read Uncommitted: This is the lowest level of isolation where a transaction can see uncommitted changes made by other transactions. This can result in dirty reads, non-repeatable reads, and phantom reads.

- Read Committed: In this isolation level, a transaction can only see changes made by other committed transactions. This eliminates dirty reads but can still result in non-repeatable reads and phantom reads.

- Repeatable Read: This isolation level guarantees that a transaction will see the same data throughout its duration, even if other transactions commit changes to the data. However, phantom reads are still possible.

- Serializable: This is the highest isolation level where a transaction is executed as if it were the only transaction in the system. All transactions must be executed sequentially, which ensures that there are no dirty reads, non-repeatable reads, or phantom reads.

## TRIGGERS ##

- A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.

### Types of SQL Triggers ###

In SQL Server, we have 3 groups of triggers:

- DML (data manipulation language) triggers – We’ve already mentioned them, and they react to DML commands. These are – INSERT, UPDATE, and DELETE.
- DDL (data definition language) triggers – As expected, triggers of this type shall react to DDL commands like – CREATE, ALTER, and DROP.
- Logon triggers – This type reacts to LOGON events.

