#### 1. Given the values table below, what data types do each of these values represent?
- A Clockwork Orange is a string data type
- 42 in an integer
- 09/02/1945 is a date
- 98.7 is a float
- 15.99 is also a float

#### 2.Explain in your own words when a database might be used. Explain when a text file might be used.
 A database might be used when multiple applications need to access the same persisted data.  They are also useful when managing complex sets of data. They have a number of potential advantages over other systems of storing data.  These include the ability to roll back to the current state if part of a transaction fails, the ability to validate format before committing data, the ability to execute transactions sequentially that may occur simultaneously, and the ability to save the data in the event of power loss or crashes.

#### 3.Describe one difference between SQL and other programming languages.
SQL is a declarative language while many other languages can be considered procedural.

#### 4.In your own words, explain how the pieces of a database system fit together at a high level.
Relational databases use a formal structure to define relations.  These relations are represented as tables with each row containing data for a single object. The object has attributes whose values are stored in each column.  The database must use ACID transactions in order to operate correctly.  A programming language such as SQL is query the data as well as add data to the database and to create relations between different table. 

#### 5.Explain the meaning of table, row, column, and value.
A database table is a collection of rows and columns representing structured data. Each row in a database table represents an object of the table type(ie for a users table each row would be a user).  Each object may have different attributes with specific values which are separated by attribute into columns. A value can be any data type and may have validations applied to it before it can be saved to the database.

#### 6.List 3 data types that can be used in a table.
- integer
- string
- float

#### 7.Given the payments table below, provide an English description and the results for the following queries:
- Select the date and amount from the payments table: date: 5/1/2016 amount: 1500.00, date: 5/10/2016, date: 5/15/2016 amount: 124.93, date:5/23/201 amount: 54.72

- Select the amount from the payments table where the amount is less than 500:
  amount: 1500.00

- Select everything from the payments table where the payee is equal to "Mega Foods": date: 5/15/2016 	payee: Mega Foods	amount: 124.93	memo: Groceries

#### 8.Given the users table below, write the following SQL queries and their results:

- Select the email and sign-up date for the user named DeAndre Data
```SQL
SELECT email, signup
FROM users
WHERE name = "DeAndre Data";
```
- Select the user ID for the user with email 'aleesia.algorithm@uw.edu'.
```SQL
SELECT userid
FROM users
WHERE email = "aleesia.algorithm@uw.edu";
```
- Select all the columns for the user ID equal to 4.
```SQL
SELECT *
FROM users
WHERE userid = 4;
```
