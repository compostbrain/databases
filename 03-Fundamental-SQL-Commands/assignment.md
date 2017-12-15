#### 1.List the commands for adding, updating, and deleting data
```SQL
INSERT INTO <table name> VALUES (val);
UPDATE <table name> SET <attribute>= val WHERE <attribute> = value;
DELETE FROM <table name> WHERE <attribute> = value;
```
#### 2.Explain the structure for each type of command.
- Insert into is used to add data to tables by specifying the table name and the declaring the values to be added.
- Update is used to change existing data by declaring the table and setting a specific attribute to a value.
- Delete is for removing data. Again, you specify the table and use a comparison operator in a where clause.
#### 3.What are some the data types that can be used in tables? Give a real world example of each.

---
 Data Types
---
Type | Example   
--|---
Number  |  phone number
  Text  |   name  
Date & Time  |  birthday
---  



#### 4.Think through how to create a new table to hold a list of people invited to a wedding. This table needs to have first and last name, whether they sent in their RSVP, the number of guests they are bringing, and the number of meals (1 for adults and 1/2 for children).

- Which data type would you use to store each of the following pieces of information?
First and last name.
Whether they sent in their RSVP.
Number of guests.
Number of meals.
- Write a command that makes the table to track the wedding.
```SQL
CREATE TABLE wedding_invites (
    id integer,
    first_name text,
    last_name text,
    rsvp boolean,
    number_of_guests integer,
    number_of_meals integer
);
```
- Using the table we just created, write a command that adds a column to track whether they were sent a thank you card.
```SQL
ALTER TABLE wedding_invites
ADD COLUMN sent_thank_you boolean
SET DEFAULT false;
```
- You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.
The guests are going to need a place to sit at the reception, so write a statement that adds a column for table number.
```SQL
ALTER TABLE wedding_invites DROP COLUMN number_of_meals;
```

- The wedding is over and we do not need to keep this information, so write a command that deletes the wedding table from the database.
```SQL
DROP TABLE wedding_invites
```
#### 5. Write a command to make a new table to hold the books in a library with the columns ISBN, title, author, genre, publishing date, number of copies, and available copies.

```SQL
CREATE TABLE books(
    id integer,
    isbn varchar(13),
    title varchar(87),
    author varchar(27),
    genre varchar(33),
    publishing_date char(4),
    num_of_copies integer,
    available_copies integer
);
```

- Find three books and add their information to the table.
```SQL
INSERT INTO books (isbn, title, author, genre, publishing_date)
    VALUES
    ('9781848000698', 'The Algorithm Design Manual', 'Steven S. Skiena', "computer science" , "2008"),
    ('9780984782857', 'Cracking the Coding Interview', 'Gayle McDowell', "computer science" , "2016"),
    ('9780316005364', 'Matter', 'Iain M. Banks', "science fiction" , "2008"),
    ;
```
- Say that someone has just checked out one of the books. Change the available copies column to 1 less.
```SQL
UPDATE books
SET available_copies -= 1
WHERE name = 'Matter';
```
- Now one of the books has been added to the banned books list. Remove it from the table.
```SQL
DELETE FROM books WHERE title = 'Matter';
```
#### 6. Write a command to make a new table to hold spacecrafts. Information should include id, name, year launched, country of origin, a brief description of the mission, orbiting body, if it is currently operating, and approximate miles from Earth.
```SQL
CREATE TABLE spacecrafts(
  id int,
  name varchar(42),
  year_launched varchar(4),
  origin_country_code varchar(4),
  mission_brief text,
  orbiting_body varchar(42),
  operational boolean,
  miles_from_earth int
);
```

- Add 3 non-Earth-orbiting satellites to the table.
```SQL
INSERT INTO spacecrafts(name, year_launched, orbiting_body)
VALUES
  ('sat 1', '2008', 'Pluto'),
  ('sat 2', '2008', 'Pluto'),
  ('sat 3', '2008', 'Pluto');
```
- Remove one of the satellites from the table since it has just been crashed into the planet.
```SQL
DELETE FROM spacecrafts WHERE name = 'sat 1';
```
- Edit another satellite because it is no longer operating and change the value to reflect that.
```SQL
UPDATE spacecrafts
SET operational = false
WHERE name = 'sat 2';
```
#### 7. Write a command to make a new table to hold the emails in your inbox. This table should include an id, the subject line, the sender, any additional recipients, the body of the email, the timestamp, whether or not it’s been read, and the id of the email chain it’s in.
```SQL
CREATE TABLE emails(
  id int,
  subject text,
  sender varchar(57),
  cc text,
  body text,
  time_sent timestamp,
  viewed boolean,
  email_chain_id int
);
```

- Add 3 new emails to the inbox.
```SQL
INSERT INTO emails(
VALUES
  (4001, 'driving', 'test@test.com', 'none', 'Do not send me more emails', 1970-01-01 00:00:01, true, 4006),
  (4002, 'driving', 'test@test.com', 'none', 'I told you: Do not send me more emails', 1970-01-01 00:00:02, true, 4006),
  (4003, 'driving', 'test@test.com', 'none', 'I really mean it. Do not send me more emails', 1970-01-01 00:00:03, true, 4006);
```
- You’ve just deleted one of the emails, so write a command to remove the row from the inbox table.
```SQL
DELETE FROM emails WHERE id = 4003;
```
- You started reading an email but just heard a crash in another room. Mark the email as unread before investigating, so you can come back to it later.
```SQL
UPDATE emails SET viewed = false WHERE id = 4002;
```
