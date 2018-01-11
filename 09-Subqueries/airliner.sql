-- Given the following tables in an airliner database, find the following information. airplanes (model, seat capacity, range), flights(flight_number, destination, origin, company, distance, flight_time, airplane_model), transactions(id, seats_sold, total_revenue, total_cost, flight_number, date)

DROP TABLE if exists airplanes cascade;

CREATE TABLE airplanes (
  id serial primary key,
  model text unique,
  seat_capacity integer,
  range integer
);

INSERT INTO airplanes(model, seat_capacity, range)
  VALUES
  ('747', 300, 3870),
  ('727', 200, 1570),
  ('737', 250, 1670),
  ('707', 150, 1570);

DROP TABLE if exists flights cascade;

CREATE TABLE flights (
  flight_number serial primary key,
  destination text,
  origin text,
  company text,
  distance integer,
  flight_time time,
  airplane_model text references airplanes(model)
);

INSERT INTO flights(flight_number, destination, origin, company, distance, airplane_model)
  VALUES
  (1, 'Moscow', 'New York', 'Aeroflot', 3800, '747'),
  (2, 'Tampa Bay', 'New York', 'Aeroflot', 1100, '747'),
  (3, 'Los Angeles', 'New York', 'TWA', 3100, '747'),
  (4, 'Atlanta', 'San Francisco', 'TWA', 300, '747'),
  (5, 'Los Angeles', 'San Francisco', 'TWA', 300, '707');

DROP TABLE if exists transactions cascade;

CREATE TABLE transactions (
  id serial primary key,
  seats_sold integer,
  total_revenue integer,
  total_cost integer,
  flight_number integer references flights(flight_number),
  date date
);

INSERT INTO transactions(seats_sold, total_revenue,total_cost, flight_number, date)
  VALUES
  (299, 46000, 42000, 1, '2018-01-06'),
  (289, 36000, 32000, 2, '2018-01-06'),
  (89, 16000, 32000, 3, '2018-01-06'),
  (189, 29000, 22000, 4, '2018-01-06'),
  (189, 29000, 22000, 4, '2018-01-07'),
  (189, 29000, 22000, 4, '2018-01-08'),
  (149, 29000, 18000, 5, '2018-01-05'),
  (149, 29000, 18000, 5, '2018-01-06'),
  (149, 29000, 18000, 5, '2018-01-07');
