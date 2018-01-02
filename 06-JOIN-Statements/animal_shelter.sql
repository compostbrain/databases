
DROP TABLE if exists adopters cascade;

CREATE TABLE adopters (
  id serial primary key,
  first_name text,
  last_name text,
  address text,
  phone_number text
);

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
DROP TABLE if exists cats cascade;

create table cats (
  id serial primary key,
  name text,
  gender text,
  age integer,
  intake_date date,
  adoption_date date
);

DROP TABLE if exists adoptions cascade;

CREATE TABLE adoptions (
  id serial primary key,
  adopter integer references adopters(id),
  dog integer references dogs(id) ,
  cat integer references cats(id),
  fee integer,
  date date
);
