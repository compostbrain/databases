#### 1. List 5 aggregate functions and explain, in your own words, what they are for. Include a real world example for each.

#### 2. Create a database called iron-bank-foundation. Create a donations table, and import CSV data from this file. Select the following data from the table:

- Find the total of all donations received in the past year.
- Find the total donations over time per donor. (i.e. Tanysha has donated 3 times with the amounts $25, $30, and $50. Her total is $105. )
- What is the average donation per donor?
- How many donations over $100 have been received?
- What is the largest donation received in a single instance from a single donor?
- What is the smallest donation we’ve received?

#### 3. How would you determine the display order of data returned by your SELECT statement?

#### 4. What is a real world situation where you would use OFFSET?

#### 5. Why is it important to use ORDER BY when limiting your results?

#### 6. What is the difference between HAVING and WHERE?

#### 7.Correct the following SELECT statement:
```SQL
 SELECT id, SUM (amount)
 FROM payment
 HAVING SUM (amount) > 200;
```
 
#### 8. Write queries to retrieve the following information.

- From the cats table, list all cats organized by intake date.
- Given an adoptions table with the columns id, date, adopter, cat, and fee, determine the 5 most recent adoptions to be featured as “Happy Tails” on social media.
- There is a potential adopter looking for an adult female cat. In the most efficient way possible, from the Cats table, list all female cats 2 or more years old.
- From the donations table (described in problem #2), find the top 5 donors with the highest cumulative donation amounts to be honored as “Platinum Donors”.
-
From the donations table (described in problem #2), find donors 6-15 with the next highest cumulative donation amounts to be honored as “Gold Donors”.
