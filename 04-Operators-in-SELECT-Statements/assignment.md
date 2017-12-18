#### 1. Write out a generic SELECT statement.
```SQL
SELECT <select list> FROM <table name>;
```

#### 2. Create a fun way to remember the order of operations in a SELECT statement, such as a mnemonic.
SELECT clause FROM clause WHERE clause. Select? I don't know From Where?

#### 3. Create a pets database. Create a dogs table using this file. From the dogs table with the columns id, name, gender, age, weight, intake_date, breed, and in_foster, write statements to select the following pieces of data.
- Display the name, gender, and age of all dogs that are part Labrador.

```SQL
pets=# SELECT (name, gender, age) FROM dogs WHERE breed LIKE '%labrador%';
     row
--------------
 (Boujee,F,3)
 (Marley,M,0)
(2 rows)
```
- Display the ids of all dogs that are under 1 year old.

```SQL
pets=# SELECT id FROM dogs WHERE age < 1;
  id
-------
 10002
 10004
(2 rows)
```

- Display the name and age of all dogs that are female and over 35lbs.

```SQL
pets=# SELECT (name, age) FROM dogs WHERE gender = 'F' AND weight > 35;
    row
------------
 (Boujee,3)
(1 row)
```

- Display all of the information about all dogs that are not Shepherd mixes.

```SQL
pets=# SELECT * FROM dogs WHERE breed NOT LIKE '%shepherd%';
  id   |   name    | gender | age | weight |       breed        | intake_date | in_foster
-------+-----------+--------+-----+--------+--------------------+-------------+------------
 10001 | Boujee    | F      |   3 |     36 | labrador poodle    | 2017-06-22  |
 10002 | Munchkin  | F      |   0 |      8 | dachsund chihuahua | 2017-01-13  | 2017-01-31
 10004 | Marley    | M      |   0 |     10 | labrador           | 2017-05-04  | 2016-06-20
 10006 | Marmaduke | M      |   7 |    150 | great dane         | 2016-03-22  | 2016-05-15
 10007 | Rosco     | M      |   5 |    180 | rottweiler         | 2017-04-01  |
(5 rows)
```

- Display the id, age, weight, and breed of all dogs that are either over 60lbs or Great Danes.
Intake teams typically guess the breed of shelter dogs, so the breed column may have multiple words (for example, "Labrador Collie mix").

```SQL
pets=# SELECT id, age, weight, breed FROM dogs WHERE weight > 60 OR breed LIKE '%greate dane%';
  id   | age | weight |   breed
-------+-----+--------+------------
 10006 |   7 |    150 | great dane
 10007 |   5 |    180 | rottweiler
(2 rows)
```

#### 4.From the cats table below, what pieces of data would be returned from these queries?
- SELECT name, adoption_date FROM cats;

name  | adoption_date     
--|---
Mushi | 2016-03-22    
Seashell  |     
Azul  |  2016-04-17   
Victoire  |   2016-09-01  
Nala  |

- SELECT name, age FROM cats;

name  | age     
--|---
Mushi | 1   
Seashell  | 7    
Azul  |  3  
Victoire  |  7  
Nala  | 1

#### 5. From the cats table, write queries to select the following pieces of data.
- Display all the information about all of the available cats.

```SQL
SELECT * FROM cats;
```
- Choose one cat of each age to show to potential adopters.

```SQL
SELECT DISTINCT ON(age) * FROM cats;
```
or
```SQL
SELECT name FROM cats WHERE age = 1 LIMIT 1;
SELECT name FROM cats WHERE age = 3 LIMIT 1;
SELECT name FROM cats WHERE age = 7 LIMIT 1;
```
- Find all of the names of the cats, so you don’t choose duplicate names for new cats.
```SQL
SELECT name FROM cats;
```

#### 6. List each comparison operator and explain, in your own words, when you would use it. Include a real world example for each.
- = equal to is used when you need an exact match such as: SELECT (name, age) FROM dogs WHERE gender = 'F';
- > greater than is used when you want records with an attribute value above a certain amount such as SELECT name FROM dogs WHERE age > 3;
- < less than is used when you want all records below a certain attribute value such as SELECT name FROM dogs WHERE age< 3;
- >= greater than or equal to used when you want to include a attribute value and above such as SELECT name FROM dogs WHERE age >= 3;
- <= less than or equal to is used when you want to include an attribute value and below such as SELECT name FROM dogs WHERE age <= 3;
- <> not equal to is used when you want everything except for a certain value such as SELECT name FROM dogs WHERE breed <> 'spaniel';

#### 7. From the cats table below, what data would be returned from these queries?
- SELECT name FROM cats WHERE gender = ‘F’;
Seashell, Nala
- SELECT name FROM cats WHERE age <> 3;
Mushi, Seashell, Victoire, Nala
- SELECT ID FROM cats WHERE name != ‘Mushi’ AND gender = ‘M’;
00003, 00004
