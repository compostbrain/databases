#### 1. In your own words, explain the benefits of normalization. Include a real-world scenario where normalization is necessary.
- The benefits of normalization include faster write times for create update and delete, reduced data errors or anomalies, optimized queries using joins, and reduced space needs.  If you had a table with employees and departments in a single table and then you decide to change an attribute of a department you would need to update across multiple employees who had that department.  This could lead to inconsistent state if not all records got updated due to an error. This database would benefit from splitting employees and departments in to two tables.

#### 2. List and explain the different normal forms and how they relate to one another, with regard to your real-world scenario in the first question.
- 1NF cannot contain multiple values for the same attribute. Each attribute must be atomic.  In the employee table this might mean splitting the name into first and last name.
- 2NF must be 1NF and any non-key columns must be dependent on the primary key. When the primary key is composite then non-key columns cannot depend on only part of the primary key.  If we had employee table with an employee_id and department and candidate keys and phone number attribute that was only dependent on the employee this would not be 2NF. You would need to have seperate tables in order to achieve 2NF.
- 3NF must be 2NF and cannot have transitive functional dependencies. This means 3NF is violated when one column depends on another column which depends on the primary key.  For example if the employee payrate was a column that depended on the department column and the department was dependent on the employee id these would need to be in seperate tables to be compliant with 3NF.

#### 3. The student_records table below shows the students and their grades in different subjects. The table is already in first normal form (1NF). Convert this table to the third normal form (3NF) using the techniques you learned in this checkpoint.


|student_id | student_name | student_email |
| ----------|--------------|--------------|


| professor_id | professor_name | subject |
|-------------|

| entry_id | grade | student_id | professor_id |
|-----------|

#### 4. In your own words, explain the potential disadvantages of normalizing the data above. What are its trade-offs? Discuss this with your mentor.
- The disadvantages of normalizing the data include using more space to store the data and the need to write more complex queries in order the access the data.  Performance may be slower as the amount of data increases.

#### 5. Looking at the tables you have normalized. If you need to denormalize to improve query performance or speed up reporting, how would you carry out denormalization for this database design? Discuss potential strategies with your mentor.
- In order to denormalize you could add professor_name and subject to the entry table in order increase read times.

#### 6. Discuss the trade-offs between data normalization and denormalization in this scenario with your mentor.
- In the denormalized database there would be redundant data in the professor table and the entry table thus requiring more space to store the data. Read times would be quicker when accessing some data.  The normalized database would have more space efficiency storing the data since there is less duplication.  However the queries would be more complicated an require more time to complete.
