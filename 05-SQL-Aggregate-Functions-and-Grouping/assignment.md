#### 1. List 5 aggregate functions and explain, in your own words, what they are for. Include a real world example for each.
- SUM returns the result of adding all attributes queried. An example might include selecting the sum of all population count for a table of cities.
- AVG returns the average of the attribute queried.  This might include the average age of table of college students.
- COUNT returns the number of rows in a table. This could be used for returning the number of cities in a state capital table.
- MIN returns the minimum value for the attribute being queried.  This would be useful for discovering the city with the least population in a cities table
- MAX returns the max value.  This would be useful for finding the max price for a collection of rare records table.

#### 2. Create a database called iron-bank-foundation. Create a donations table, and import CSV data from this file. Select the following data from the table:

- Find the total of all donations received in the past year.

```SQL
iron-banks-foundation=# select sum(amount) from donations;
 sum
-----
 993
(1 row)
```

- Find the total donations over time per donor. (i.e. Tanysha has donated 3 times with the amounts $25, $30, and $50. Her total is $105. )

```SQL
iron-banks-foundation=# select sum(amount) as total_donation, donor from donations group by donor;
```

- What is the average donation per donor?

```SQL

iron-banks-foundation=# select avg(amount) as average_donation, donor from donations group by donor;
```
- How many donations over $100 have been received?

```SQL
iron-banks-foundation=# select count(amount) from donations where amount > 100;
 count
-------
     2
```
- What is the largest donation received in a single instance from a single donor?

```SQL
iron-banks-foundation=# select max(amount) from donations;
 max
-----
 120
(1 row)
```
- What is the smallest donation we’ve received?

```SQL
iron-banks-foundation=# select min(amount) from donations;
 min
-----
   5
(1 row)
```

#### 3. How would you determine the display order of data returned by your SELECT statement
- You determine the display order by specifying after the select keyword the order of attributes.

#### 4. What is a real world situation where you would use OFFSET?
- A real world use of the offset function would be when you want to skip a certain number of rows before returning rows. When used in conjunction with order by it allows you to view rows based on attribute value.  For example if you wanted the songs rated 11 through 20 in a certain year you could order by rating and limit 10 and offset 10.

#### 5. Why is it important to use ORDER BY when limiting your results?
This is important because it allows you to have a meaningful group of records returned based on some value.

#### 6. What is the difference between HAVING and WHERE?
HAVING operates after an aggregation function is performed unlike WHERE and it also eliminates groups of results rather than filtering individual rows.

#### 7.Correct the following SELECT statement:
```SQL
 SELECT id, SUM (amount) as total_payments
 FROM payment
 HAVING SUM (amount) > 200;
```

#### 8. Write queries to retrieve the following information.

- From the cats table, list all cats organized by intake date.

```SQL
select * from cats order by intake_date;
```

- Given an adoptions table with the columns id, date, adopter, cat, and fee, determine the 5 most recent adoptions to be featured as “Happy Tails” on social media.

```SQL
select * from adoptions order by date limit 5;
```

- There is a potential adopter looking for an adult female cat. In the most efficient way possible, from the Cats table, list all female cats 2 or more years old.

```SQL
select name from cats where age >= 2 and gender = 'F';
```

- From the donations table (described in problem #2), find the top 5 donors with the highest cumulative donation amounts to be honored as “Platinum Donors”.

```SQL
iron-banks-foundation=# select donor as "Platinum Donors", sum(amount) as total_donations from donations group by donor order by total_donations desc limit 5;
 Platinum Donors | total_donations
-----------------+-----------------
 Daenerys        |             173
 Margaery        |             120
 Tyrion          |             120
 Missandei       |              90
 Brienne         |              75
(5 rows)
```

-From the donations table (described in problem #2), find donors 6-15 with the next highest cumulative donation amounts to be honored as “Gold Donors”.

```SQL
iron-banks-foundation=# select donor as "Gold Donors", sum(amount) as total_donations from donations group by donor order by total_donations desc limit 10 offset 5;
 Gold Donors | total_donations
-------------+-----------------
 Petyr       |              70
 Arya        |              60
 Tormund     |              50
 Melisandre  |              45
 Sansa       |              33
 Ygritte     |              30
 Jon         |              25
 Bran        |              25
 Theon       |              20
 Bronn       |              20
(10 rows)
```
