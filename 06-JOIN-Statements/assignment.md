
#### 1. How do you find data that is held in two separate data tables?
Using join statements
#### 2. Explain, in your own words, the difference between a CROSS JOIN, INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, and FULL OUTER JOIN. Give a real world example for each.
- A CROSS JOIN combines two tables by returning every possible combination such that if table 1 has x rows and table 2 has y rows the new table will have x*y rows. a real world example would be `SELECT * FROM FOODS CROSS JOIN company`
- Inner join is the default join and will return rows from the first table with rows from the second table  that match the join condition. For example: `SELECT * FROM foods INNER JOIN company ON food.company_id = company.id`
- Outer joins join two tables and return rows with empty values for non-matching rows.  The side specified determines which table will have all rows returned regardless of a match.  So a left outer join will return all the rows of the table specified to the left of the join operator while a right outer join will do so for the table to the right of the statement. For example: `SELECT c.company_id, f.item_name FROM company as c  LEFT OUTER JOIN foods as f ON f.company_id = c.id` or `SELECT * FROM foods RIGHT OUTER JOIN company ON food.company_id = company.id` with each one returning rows with null values for non-matching.
- A full outer join combines a left and right outer join so that the new table will have rows for the left table and right table that do not match the condition. For example: ` SELECT * FROM foods FULL OUTER JOIN company ON foods.company_id = company.id`

#### 3. Define primary key and foreign key. Give a real world example for each.
- A primary key is a special column in a table that uniquely identifies each row of data. It cannot be null.
- A foreign key is a special coulumn in a table that uniquely identifies a row in another table.  It refers to the primary key of another table.
#### 4. Define aliasing.
- Aliasing is technique of defining temporary names for columns or tables.
#### 5. Change this query so that you are using aliasing:

```SQL
SELECT p.name, c.salary, c.vacation_days FROM professor AS p JOIN compensation AS c ON p.id = c.professor_id;
```

#### 6. Why would you use a NATURAL JOIN? Give a real world example.
Using NATURAL JOIN when you want to return matching column names without specifying each one. For example: `SELECT * FROM foods NATURAL JOIN company;`

#### 7. Build an Employees table and a Shifts table with appropriate primary and foreign keys. Then, write queries to find the following information:

- List all employees and all shifts.

```SQL
company_x=# select * from employees full outer join shifts on employees.employee_id = shifts.employee_id;
 employee_id |   name   | pay_rate | id |   type    | employee_id
-------------+----------+----------+----+-----------+-------------
             |          |          |  1 | 1st Shift |
             |          |          |  2 | 2nd Shift |
             |          |          |  3 | 3rd Shift |
           2 | Justin N | 14.00    |    |           |
           1 | James P  | 12.00    |    |           |
           3 | Jorge R  | 17.00    |    |           |
(6 rows)
```

- Create a list of all possible schedules.

```SQL
company_x=# select * from employees cross join shifts;
 employee_id |   name   | pay_rate | id |   type    | employee_id
-------------+----------+----------+----+-----------+-------------
           1 | James P  | 12.00    |  1 | 1st Shift |
           2 | Justin N | 14.00    |  1 | 1st Shift |
           3 | Jorge R  | 17.00    |  1 | 1st Shift |
           1 | James P  | 12.00    |  2 | 2nd Shift |
           2 | Justin N | 14.00    |  2 | 2nd Shift |
           3 | Jorge R  | 17.00    |  2 | 2nd Shift |
           1 | James P  | 12.00    |  3 | 3rd Shift |
           2 | Justin N | 14.00    |  3 | 3rd Shift |
           3 | Jorge R  | 17.00    |  3 | 3rd Shift |
(9 rows)
```

#### 8. Given the Dogs table (described below), the Adoptions table (described below), the Adopters table (which has the columns id, first_name, last_name, address, and phone number), and the Volunteers table (which has the columns id, name, address, phone_number, available_to_foster, and foster_id), please write queries to retrieve the following information.

- Create a list of all volunteers. If the volunteer is fostering a dog, include each dog as well.

```SQL
select * from volunteers left outer join dogs on volunteers.foster_id = dogs.id;
```

- List the adopter’s name and the pet’s name for each animal adopted within the past month to be displayed as a ‘Happy Tail’ on social media.

```SQL
select a.adopter, a.dog  from adoptions as a where date >= date_trunc('month', current_date - interval '1' month)
  and date < date_trunc('month', current_date);
```

- Create a list of adopters who have not yet chosen a dog to adopt and generate all possible combinations of adopters and available dogs.

```SQL
select adopters.id, adopters.first_name, adopters.last_name, a.adopter from adoptions as a right outer join adopters on adopters.id = a.adopter;
select * from adopters cross join dogs where in_foster = false;

```

- Display a list of all cats and all dogs who have not been adopted.

```SQL
select * from cats full outer join dogs on dogs.adoption_date = null or cats.adoption_date = null;join the adoptions table
```

- Create a list of volunteers who are available to foster. If they currently are fostering a dog, include the dog. Also include all dogs who are not currently in foster homes.

```SQL
select v.last_name as "Volunteer", v.available_to_foster, d.name as "Dog Name", d.in_foster from volunteers v full outer join dogs d on v.foster_id = d.id;
```


#### 9. Write a query to find the name of the person who adopted Seashell given the tables Cats (depicted below), Adoptions (depicted below), and Adopters which has columns for id, address, phone number, and name.

- Dogs table has the columns id, name, gender, age, weight, intake_date, breed, and in_foster.

```SQL
select a.last_name as "Adopter", c.name as "Cat Name" from adopters a
left outer join adoptions adp on (a.id=adp.id)
left outer join cats c on (adp.id=c.id)
where c.name = 'Seashell';
```

NOTE: Shelter dogs’ breeds are typically guessed by the intake team, so the column may have multiple words. I.E. labrador collie mix
- Cats table has the columns id, name, gender, age, intake_date, adoption_date
- Adoptions table has the columns id, adopter, cat, dog, fee, date
-
#### 10. Given the tables Books (isbn, title, author), Transactions(id, checked_out_date, checked_in_date, user_id, isbn), Holds(id, isbn, user_id, rank, date), and Patrons(id, name, fine_amount), write queries to find the following information:

- To discern if the library should buy more copies of a given book, please provide the names and position, in order, of all of the patrons waiting in line for Harry Potter and the Sorcerer’s Stone.

```SQL
select h.id, h.rank, p.name
from Holds h
inner join Patrons p on h.user_id = p.id
order by h.rank DESC;

```

- Make a list of all book titles and denote whether or not a copy of that book is checked out.

```SQL
select b.title, t.checked_in_date, t.checked_out_date
from Books as b
left outer join Transactions as t on b.isbn = t.isbn;
```

- In an effort to learn which books take longer to read, the librarians would like you to create a list of total checked out time by book name in the past month.

```SQL
SELECT b.title, sum(t.check_in_date - t.check_out_date)
from Transactions t
inner join Books b
on t.isbn= b.isbn
where t.check_out_date > current_date - 30
group by b.title;
```

- In order to learn which items should be retired, make a list of all books that have not been checked out in the past 5 years.

```SQL
select b.name
from Books b
left join Transactions t
on b.isbn = t.isbn
where t.isbn is null
and t.date > current_date - integer 1825;
```

- List all of the library patrons. If they have one or more books checked out, correspond the books to the patrons.

```SQL
select p.name, b.title
from Patrons p
left join Transactions t
on p.id = t.user_id
left join Books b
on t.isbn = b.isbn
where t.check_out_date is not null
and t.check_in_date is null;
```
