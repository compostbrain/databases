
DROP TABLE if exists adopters cascade;

CREATE TABLE adopters (
  id serial primary key,
  first_name text,
  last_name text,
  address text,
  phone_number text
);

INSERT INTO adopters(first_name)
  VALUES
  ('Tom'),
  ('Dallas'),
  ('Sue'),
  ('Gary');

DROP TABLE if exists volunteers cascade;

CREATE TABLE volunteers (
  id serial primary key,
  first_name text,
  last_name text,
  address text,
  phone_number text,
  available_to_foster boolean,
  foster_id integer references dogs(id)
);

INSERT INTO volunteers(first_name, available_to_foster, foster_id)
  VALUES
  ('James',true, 1),
  ('Thomas',false, 2),
  ('Sally',true, 4),
  ('Nancy',true, null),
  ('Carrol',false, 3);

DROP TABLE if exists dogs cascade;

create table dogs (
  id serial primary key,
  name text,
  gender text,
  age integer,
  weight integer,
  intake_date date,
  breed text,
  adoption_date date,
  in_foster boolean
);
INSERT INTO dogs(name,intake_date, adoption_date, in_foster)
  VALUES
  ('Ninja', '2017-06-22', '2018-01-02', true),
  ('Spot', '2017-06-22', '2018-01-04', true),
  ('Fido', '2017-06-22', '2018-01-06', true),
  ('P-dog', '2017-06-22', '2017-08-02', true),
  ('Allie', '2017-06-22', '2018-01-01', false);

DROP TABLE if exists cats cascade;

create table cats (
  id serial primary key,
  name text,
  gender text,
  age integer,
  intake_date date,
  adoption_date date
);

INSERT INTO cats(name,intake_date, adoption_date)
  VALUES
  ('Yoda', '2017-06-22', '2018-01-02'),
  ('Audrey', '2017-06-22', '2018-01-03'),
  ('Mouser', '2017-06-22', '2018-01-01'),
  ('Juicy', '2017-06-22', '2018-08-01'),
  ('Blackie', '2017-06-22', '2018-01-05'),
  ('Seashell', '2017-06-22', '2018-01-07');

DROP TABLE if exists adoptions cascade;

CREATE TABLE adoptions (
  id serial primary key,
  adopter integer references adopters(id),
  dog integer references dogs(id) ,
  cat integer references cats(id),
  fee integer,
  date date
);

INSERT INTO adoptions(adopter, dog, cat, date)
  VALUES
  (1,2,null,'2018-01-02'),
  (1,null,3,'2018-01-04'),
  (3,null,6,'2018-01-07');
