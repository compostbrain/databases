DROP TABLE if exists students cascade;

CREATE TABLE students (
  student_id serial primary key,
  first_name text not null,
  last_name text not null,
  address text,
  phone_number text,
  email varchar(100),
  graduation_year varchar(4)
);

DROP TABLE if exists classes cascade;

CREATE TABLE classes (
  class_id serial primary key,
  title varchar(50) not null,
  description text not null
);

DROP TABLE if exists grades cascade;

CREATE TABLE grades (
  grade_id serial primary key,
  class_id integer references classes(class_id),
  student_id integer references students(student_id),
  letter_grade varchar(1),
  percent_grade integer
);

INSERT INTO students(first_name, last_name)
  VALUES
  ('Tom', 'B'),
  ('Sally', 'X'),
  ('Rick', 'S'),
  ('Cathy', 'C'),
  ('Bill', 'C');

INSERT INTO classes(title, description)
  VALUES
  ('Intro To Pathology', 'Medical examination of the effects of sickness'),
  ('Drinking Resposibly', 'A class for new students'),
  ('CS 50', 'Entry level introduction to Computer Science'),
  ('Nature of Consciousness', 'Metaphysical explantions for the creation of you'),
  ('Knot Tying 101', 'How to bind things');

INSERT INTO grades (student_id, class_id, letter_grade)
  VALUES
  (1,1,'A'),
  (1,2,'B'),

  (1,4,'C'),
  (1,5,'D'),
  (2,1,'B'),
  (2,2,'B'),

  (2,4,'C'),
  (2,5,'D'),
  (3,1,'A'),

  (3,3,'F'),
  (3,4,'C'),
  (3,5,'D'),
  (4,1,'B'),
  (4,2,'B'),
  (4,3,'F'),
  (4,4,'C'),
  (4,5,'D'),
  (5,1,'D'),
  (5,2,'B'),
  (5,3,'F'),
  (5,4,'C');
