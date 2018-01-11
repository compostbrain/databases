#### 1. Explain a subquery in your own words.
- A subquery is query is nested within another query.  It can be in the WHERE, FROM or SELECT clause.

#### 2. Where can you use a subquery within a SELECT statement?
- You can use a subquery within a SELECT statement for retrieving a calculation that you don't want applied to the main query.
#### 3. When would you employ a subquery?
- Subqueries may be more readable than joins when you want to get facts from table A, given a conditional from table B.  Subqueries will not retrieve duplicate data as well
#### 4. Explain a row constructor in your own words.
- A row constructor matches a subquery against a predefined row.

#### 5. What happens if a row in the subquery result provides a NULL value to the comparison?
- If a null value is provided then the comparison will be null not true.

#### 6. What are the ways to use a subquery within a WHERE clause? If you can't remember them, do these flashcards until you can.
- Subqueries in the WHERE clause can use either a row constructor or an expression.A nested subquery in  the where clause can use the following keywords: IN,NOT IN, EXISTS, NOT EXISTS, ANY, SOME, ALL.  All of these can be used to nest a subquery in a where clause in order to narrow the results depending on the boolean returned.

#### 7. Build an employees table and a shifts table with appropriate primary and foreign keys. Then, write queries to find the following information:
- List all employees and all shifts.

```SQL
company_x=# select * from employees;
 employee_id |   name   | pay_rate
-------------+----------+----------
           1 | James P  | 12.00
           2 | Justin N | 14.00
           3 | Jorge R  | 17.00
(3 rows)

company_x=# select * from shifts;
 id |   type    | employee_id
----+-----------+-------------
  1 | 1st Shift |
  2 | 2nd Shift |
  3 | 3rd Shift |

(3 rows)
Linter
Severity  Provider  Description Line

```
- Create a list of all possible schedules.

```SQL
company_x=# select * from employees, (select * from shifts) as shifts;
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

#### 8. Given a dogs table, adoptions table, adopters table, and volunteers table , write queries to retrieve the following information. All tables are described below.

- Create a list of all volunteers. If the volunteer is fostering a dog, include each dog as well.

```SQL
animal_shelter=# select v.first_name, (select d.name from dogs d where v.foster_id = d.id) from volunteers v;
 first_name | name
------------+-------
 James      | Ninja
 Thomas     | Spot
 Sally      |
 Nancy      |
 Carrol     | Fido
(5 rows)
```

- List the adopter’s name and the pet’s name for each animal adopted within the past month to be displayed as a ‘Happy Tail’ on social media.

```SQL
animal_shelter=# select a.id, (select ad.first_name from adopters ad where ad.id = a.adopter) "Adopter", (select d.name from dogs d where a.dog = d.id and a.adopter = a.id) "Adopted Dog", (select c.name fr
om cats c where a.cat = c.id and a.adopter = a.id) "Adopted Cat" from adoptions a where date > current_date - 30;
 id | Adopter | Adopted Dog | Adopted Cat
----+---------+-------------+-------------
  1 | Tom     | Spot        |
  2 | Tom     |             |
(2 rows)
```

- Create a list of adopters who have not yet chosen a dog to adopt and generate all possible combinations of adopters and available dogs.

```SQL
animal_shelter=# select a.first_name, d.name from adopters a, dogs d where a.id not in (select adopter from adoptions adp where adp.adopter = a.id) and d.id not in (select dog from adoptions adp where adp.
dog = d.id);
 first_name | name
------------+-------
 Dallas     | Ninja
 Sue        | Ninja
 Gary       | Ninja
 Dallas     | Fido
 Sue        | Fido
 Gary       | Fido
 Dallas     | P-dog
 Sue        | P-dog
 Gary       | P-dog
 Dallas     | Allie

 Sue        | Allie
 Gary       | Allie
(12 rows
```

- Display a list of all cats and all dogs who have not been adopted.

```SQL
animal_shelter=# select dogs.name "Adoptable Animals", 'dog' "Type" from dogs where id not in (select dog from adoptions where adoptions.dog = dogs.id) union
animal_shelter-# select c.name "Adoptable Cats", 'cat' from cats c where id not in (select cat from adoptions where adoptions.cat = c.id) ;
 Adoptable Animals | Type
-------------------+------
 Fido              | dog
 Blackie           | cat
 Juicy             | cat
 Audrey            | cat
 Ninja             | dog
 P-dog             | dog
 Allie             | dog
 Yoda              | cat

(8 rows)
```

- Create a list of volunteers who are available to foster. If they currently are fostering a dog, include the dog. Also include all dogs who are not currently in foster homes.

```SQL
animal_shelter=# select v.first_name "Volunteer Foster", (select d.name "Dog" from dogs d where v.foster_id = d.id), 'in foster' "Status" from volunteers v where available_to_foster = true union select 'no
ne', d.name, 'not in foster' from dogs d where id not in (select ad.id from adoptions ad where ad.dog = d.id);
 Volunteer Foster |  Dog  |    Status
------------------+-------+---------------
 Sally            | P-dog | in foster
 none             | Fido  | not in foster
 James            | Ninja | in foster
 none             | Allie | not in foster
 Nancy            |       | in foster
 none             | Ninja | not in foster
 none             | P-dog | not in foster
 none             | Spot  | not in foster

(8 rows)
```

#### 9. Write a query to find the name of the person who adopted Seashell given the tables cats, adoptions, and adopters. All tables are described below


```SQL
animal_shelter=# select a.first_name "Adopter" from adopters a where exists (select id from adoptions ad where ad.adopter = a.id and (select c.name from cats c where c.id = ad.cat) = 'Seashell');
 Adopter
---------
 Sue
(1 row)
```


#### 10. Given the tables books (isbn, title, author), transactions (id, checked_out_date, checked_in_date, user_id, isbn), holds (id, isbn, user_id, rank, date), and patrons (id, name, fine_amount), write queries to find the following information:

- To discern if the library should buy more copies of a given book, please provide the names and position, in order, of all of the patrons waiting in line for Harry Potter and the Sorcerer’s Stone.

```SQL
library=# select p.name "Patron", (select h.rank from holds h where h.user_id = p.id) "Rank" from patrons p where p.id in (select h.user_id from holds h where isbn = '9780439708180') order by "Rank";
    Patron    | Rank
--------------+------
 James Jordan |    1
 Jorge Rivas  |    2
 Kim Walsh    |    3
 Tae Lee      |    4
(4 rows)

```

- Make a list of all book titles and denote whether or not a copy of that book is checked out.

```SQL
library=# select b.title "Book Title", t.check_out_date, t.check_in_date from books b, (select b.isbn as isbn, tr.check_in_date as check_in_date, tr.check_out_date as check_out_date
library(# from books b, transactions tr
library(# where b.isbn = tr.isbn) t;
              Book Title               | check_out_date | check_in_date
---------------------------------------+----------------+---------------
 Harry Potter and the Sorcerer's Stone | 2018-01-02     |
 Charlie and the Chocolate Factory     | 2018-01-02     |
 Charlotte's Web                       | 2018-01-02     |
 Harry Potter and the Sorcerer's Stone | 2018-01-02     | 2018-01-07
 Charlie and the Chocolate Factory     | 2018-01-02     | 2018-01-07
 Charlotte's Web                       | 2018-01-02     | 2018-01-07
(6 rows)
```

- In an effort to learn which books take longer to read, the librarians would like you to create a list of total checked out time by book name in the past month.

```SQL
select b.title "Book Title" , sum(trd.cid - trd.cod) "Days Checked Out in last 30 Days" from books b, (select t.id id, t.isbn isbn, t.check_in_date cid, t.check_out_date cod  from transactions t
where t.check_out_date > (current_date - 30)) trd
where b.isbn = trd.isbn
group by b.title;
              Book Title               | Days Checked Out in last 30 Days
---------------------------------------+----------------------------------
 Harry Potter and the Sorcerers Stone |                                5
 Charlie and the Chocolate Factory     |
(2 rows)

```

- In order to learn which items should be retired, make a list of all books that have not been checked out in the past 5 years.

```SQL
select b.title from books b where isbn not in (select b.isbn from books where isbn in (select t.isbn from transactions t where t.check_out_date > current_date - 1825));
```

- List all of the library patrons. If they have one or more books checked out, correspond the books to the patrons.

```SQL
library=# select p.name from patrons p union select b.title from books b where isbn in (select tr.isbn from transactions tr where tr.check_out_date is not null and tr.check_in_date is null);
               name
-----------------------------------
 Kim Walsh
 Jorge Rivas
 Charlie and the Chocolate Factory
 John Eaton
 James Jordan
 Tim Helper
 Tae Lee
(7 rows)
```

#### 11. Given the following tables in an airliner database, find the following information. airplanes (model, seat capacity, range), flights(flight_number, destination, origin, company, distance, flight_time, airplane_model), transactions(id, seats_sold, total_revenue, total_cost, flight_number, date)

- To determine the most profitable airplanes, find all airplane models where each flight has had over 100 paying customers in the past month.

```SQL
airliner=# select f.airplane_model from flights f where flight_number in (select t.flight_number from transactions t where seats_sold > 100 and date > current_date - 30) group by f.airplane_model;
 airplane_model
----------------
 707
 747
(2 rows)
```

- To determine the most profitable flights, find all destination-origin pairs where 90% or more of the seats have been sold in the past month.

```SQL
select f.origin "Origin City", f.destination "Destination City"
from flights f
where flight_number in
(select t.flight_number
from transactions t
where (t.seats_sold / (select a.seat_capacity from airplanes a where a.model = f.airplane_model)) > 0.89);
 Origin City | Destination City
-------------+------------------
(0 rows)
```

- The airline is looking to expand its presence in the US Southeast and globally. Find the total revenue of any flight arriving at or departing from Atlanta.

```SQL
airliner=# select sum(tr.trev) "Atlanta Revenue" from (select t.total_revenue as trev from transactions t where flight_number in (select f.flight_number from flights f where f.origin = 'Atlanta' or f.desti
nation = 'Atlanta'))tr;
 Atlanta Revenue
-----------------
           87000
(1 row)
```

#### 12. Compare the subqueries you've written above. Compare them to the joins you wrote in Checkpoint 6. Which ones are more readable? Which were more logical to write?

- The one that are logical as subqueries are the ones that are of the form get facts from A, given this conditional on facts from B.

dogs table has the columns id, name, gender, age, weight, intake_date, breed, and in_foster. NOTE: Shelter dogs’ breeds are typically guessed by the intake team, so the column may have multiple words. I.E. labrador collie mix

cats table has the columns id, name, gender, age, intake_date, adoption_date

adoptions table has the columns id, adopter, cat, dog, fee, date

adopters table has the columns first_name, last_name, address, and phone number

volunteers table has the columns id, name, address, phone_number, available_to_foster, and foster_id
