#### 1. Write out a generic SELECT statement.
```SQL
SELECT <select list> FROM <table name>;
```

#### 2. Create a fun way to remember the order of operations in a SELECT statement, such as a mnemonic.
```SQL

```
#### 3. Create a pets database. Create a dogs table using this file. From the dogs table with the columns id, name, gender, age, weight, intake_date, breed, and in_foster, write statements to select the following pieces of data.
- Display the name, gender, and age of all dogs that are part Labrador.
```SQL

```
- Display the ids of all dogs that are under 1 year old.
```SQL

```
- Display the name and age of all dogs that are female and over 35lbs.
```SQL

```
- Display all of the information about all dogs that are not Shepherd mixes.
- Display the id, age, weight, and breed of all dogs that are either over 60lbs or Great Danes.
Intake teams typically guess the breed of shelter dogs, so the breed column may have multiple words (for example, "Labrador Collie mix").

#### 4.From the cats table below, what pieces of data would be returned from these queries?
- SELECT name, adoption_date FROM cats;
- SELECT name, age FROM cats;

#### 5. From the cats table, write queries to select the following pieces of data.
- Display all the information about all of the available cats.
- Choose one cat of each age to show to potential adopters.
- Find all of the names of the cats, so you don’t choose duplicate names for new cats.

#### 6. List each comparison operator and explain, in your own words, when you would use it. Include a real world example for each.
- If you can’t list these from memory, do these flashcards until you can!

#### 7. From the cats table below, what data would be returned from these queries?
- SELECT name FROM cats WHERE gender = ‘F’;
- SELECT name FROM cats WHERE age <> 3;
- SELECT ID FROM cats WHERE name != ‘Mushi’ AND gender = ‘M’;
