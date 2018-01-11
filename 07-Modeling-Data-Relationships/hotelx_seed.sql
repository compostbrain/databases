DROP TABLE if exists guests cascade;

CREATE TABLE guests (
  guest_id serial primary key,
  first_name text,
  last_name text,
  address text,
  phone_number text,
  email text
);

DROP TABLE if exists rooms cascade;

CREATE TABLE rooms (
  room_id serial primary key,
  type text,
  occupancy integer
);

DROP TABLE if exists bookings cascade;

CREATE TABLE bookings (
  id serial primary key,
  check_in_date date,
  check_out_date date,
  room_id integer references rooms(room_id),
  guest_id integer references guests(guest_id)
);

INSERT INTO guests(first_name, last_name)
  VALUES
  ('Tom', 'B'),
  ('Sally', 'X'),
  ('Rick', 'S'),
  ('Cathy', 'C'),
  ('Bill', 'C');

INSERT INTO rooms(room_id, type, occupancy)
  VALUES
  (1, 'single', 2),
  (2, 'single', 2),
  (3, 'single', 2),
  (4, 'double', 4),
  (5, 'single', 2),
  (6, 'double', 4);

INSERT INTO bookings(check_in_date, check_out_date,room_id, guest_id)
  VALUES
  ('2017-06-22','2017-06-23',1,1),
  ('2017-06-22','2017-06-23',2,1),
  ('2017-06-23','2017-06-25',2,2),
  ('2017-06-23','2017-06-25',4,5),
  ('2017-06-23','2017-06-25',2,2),
  ('2017-06-29','2017-06-30',2,2),
  ('2017-07-01','2017-07-02',2,2),
  ('2017-07-05','2017-07-06',2,2);
