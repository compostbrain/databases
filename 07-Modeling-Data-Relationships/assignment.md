#### 1. Create a database for the model we built in the example. Create a SQL file that creates the tables and inserts sample data (the questions below will help you create the data). Write queries that demonstrate the following scenarios:

- Find a guest who exists in the database and has not booked a room.

```SQL
hotelx=# select g.id, g.first_name, g.last_name from guests g left join
bookings b
on g.id = b.guest_id
where b.guest_id is null;
 id | first_name | last_name
----+------------+-----------
  3 | Rick       | S
  4 | Cathy      | C
(2 rows)

```
- Find bookings for a guest who has booked two rooms for the same dates.

```SQL
hotelx=# SELECT * FROM guests
hotelx-# JOIN (
hotelx(#   SELECT b.guest_id, b.check_in_date, b.check_out_date, count(*)
hotelx(#   FROM bookings b GROUP BY b.guest_id, b.check_in_date, b.check_out_date
hotelx(#   HAVING count(*) > 1
hotelx(# )AS t
hotelx-# USING (guest_id);
 guest_id | first_name | last_name | address | phone_number | email | check_in_date | check_out_date | count
----------+------------+-----------+---------+--------------+-------+---------------+----------------+-------
        2 | Sally      | X         |         |              |       | 2017-06-23    | 2017-06-25     |     2
        1 | Tom        | B         |         |              |       | 2017-06-22    | 2017-06-23     |     2
(2 rows)
```
- Find bookings for a guest who has booked one room several times on different dates.

```SQL
hotelx=# SELECT g.guest_id, b.room_id, count (b.check_in_date)
hotelx-# FROM bookings b
hotelx-# JOIN guests g USING (guest_id)
hotelx-# GROUP BY b.room_id, g.guest_id
hotelx-# HAVING count(b.check_in_date) > 1;
 guest_id | room_id | count
----------+---------+-------
        2 |       2 |     5
(1 row)
```
- Count the number of unique guests who have booked the same room.

```SQL
hotelx=# select count(t.guest_id)
hotelx-# from (
hotelx(#   SELECT DISTINCT g.guest_id, g.first_name, g.last_name, b.room_id
hotelx(#   FROM bookings b
hotelx(#   JOIN guests g
hotelx(#   USING (guest_id)

hotelx(#   WHERE room_id = 2
hotelx(# ) AS t;
 count
-------
     2
(1 row)

hotelx=# select count(t.guest_id)
from (
  SELECT DISTINCT g.guest_id, g.first_name, g.last_name, b.room_id
  FROM bookings b
  JOIN guests g
  USING (guest_id)
  WHERE room_id = 4
) AS t;
 count
-------
     1
(1 row)
```

#### 2. Design a data model for students and the classes they have taken. The model should include the students' grades for a given class.

- Work through the questions from the example above.
- What classes/entites do we need to model? Students, classes, and grades
-What fields/attributes will each entity need?
Students: id, first name, last name, address, phone_number, email
Classes: id, title, description
Grades: join table with foreign key for Students and Classes, letter_grade, percent_grade

-What data types do we need to use? strings and integer
-What relationships exist between entities? many to many relationship exist between students and classes and they are joined by the grade table
-How should those relationships be represented in tables? We'll need three tables including Students, Classes and grades.

- Document any assumptions you make about what data should be stored, what data types should be used, etc., and include them in a text file.
I assume the data will be stored

- Ask questions of your mentor if you are unsure about parts of your model.

- Draw the model using the notation used in the checkpoint and submit a picture. You can also use a tool like StarUML or quickdatabasediagrams.com if you choose.

#### 3. Build a database for the students/classes data model. Create a SQL file that creates the tables and inserts sample data (the questions below will help you create the data). Write queries that demonstrate the following scenarios:

- Find all students who have taken a particular class.

```SQL
schoolx=# select * from students
schoolx-# join grades g
schoolx-# using(student_id)
schoolx-# where class_id = 1;
 student_id | first_name | last_name | address | phone_number | email | graduation_year | grade_id | class_id | letter_grade | percent_grade
------------+------------+-----------+---------+--------------+-------+-----------------+----------+----------+--------------+---------------
          1 | Tom        | B         |         |              |       |                 |        1 |        1 | A            |
          2 | Sally      | X         |         |              |       |                 |        6 |        1 | A            |
          3 | Rick       | S         |         |              |       |                 |       11 |        1 | A            |
          4 | Cathy      | C         |         |              |       |                 |       16 |        1 | A            |
          5 | Bill       | C         |         |              |       |                 |       21 |        1 | A            |
(5 rows)
```
- Count the number of each grade (using letter grades A-F) earned in a particular class.

```SQL
schoolx=# SELECT g.class_id, g.letter_grade, count(*)
FROM grades g
WHERE g.class_id = 1
GROUP BY g.class_id, g.letter_grade;
 class_id | letter_grade | count
----------+--------------+-------
        1 | A            |     2
        1 | B            |     2
        1 | D            |     1
(3 rows)
```

- Find class names and the total number of students who have taken each class in the list.

```SQL
schoolx=# SELECT c.title, count(*)
FROM classes c
JOIN grades g
USING(class_id)
GROUP BY c.title;
          title          | count
-------------------------+-------
 CS 50                   |     5
 Nature of Consciousness |     5
 Drinking Resposibly     |     5
 Intro To Pathology      |     5
 Knot Tying 101          |     5
(5 rows)
```


- Find the class taken by the largest number of students.

```SQL
schoolx=#
SELECT c.title, count(*) as student_num
FROM classes c
JOIN grades g
USING(class_id)
GROUP BY c.title
order by student_num DESC;
          title          | student_num
-------------------------+-------------
 Nature of Consciousness |           5
 Intro To Pathology      |           5
 Drinking Resposibly     |           4
 Knot Tying 101          |           4
 CS 50                   |           3
(5 rows)

```
