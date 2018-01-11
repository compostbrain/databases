
DROP TABLE if exists books cascade;

CREATE TABLE books (
  isbn varchar(13) primary key,
  title text,
  author text
);

INSERT INTO books(isbn, title, author)
    VALUES
    ('9780439708180', 'Harry Potter and the Sorcerer''s Stone', 'J. K. Rowling'),
    ('9780142410318', 'Charlie and the Chocolate Factory', 'Roald Dahl'),
    ('9780061124952', 'Charlotte''s Web', 'E.B. White');

DROP TABLE if exists transactions cascade;

CREATE TABLE transactions (
  id serial primary key,
  check_out_date date,
  check_in_date date,
  user_id integer references patrons(id),
  isbn varchar(13) references books(isbn)
);

INSERT INTO transactions(check_out_date, check_in_date, user_id, isbn)
  VALUES
  ('2018-01-02', null, 1, '9780142410318'),
  ('2018-01-02', '2018-01-07', 2, '9780439708180');

DROP TABLE if exists holds cascade;

CREATE TABLE holds (
  id serial primary key,
  isbn varchar(13) references books(isbn),
  user_id integer references patrons(id),
  rank integer unique not null,
  date date
);

INSERT INTO holds(isbn, user_id, rank, date)
  VALUES
  ('9780439708180', 1, 1,'2018-01-01'),
  ('9780439708180', 2, 2,'2018-01-02'),
  ('9780439708180', 3, 3,'2018-01-03'),
  ('9780439708180', 4, 4,'2018-01-04');

DROP TABLE if exists patrons cascade;

CREATE TABLE patrons (
  id serial primary key,
  fine_amount integer,
  name text
);

INSERT INTO patrons(name, fine_amount)
  VALUES
  ('James Jordan', 500),
  ('Jorge Rivas', 42),
  ('Kim Walsh', 21),
  ('Tae Lee', 1),
  ('John Eaton', 35),
  ('Tim Helper', 3);
