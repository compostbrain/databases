
DROP TABLE if exists employees CASCADE;

CREATE TABLE employees (
  employee_id serial primary key,
  name text not null,
  pay_rate text
);

DROP TABLE if exists shifts;

CREATE TABLE shifts (
  id serial primary key,
  type text,
  employee_id integer REFERENCES employees(employee_id)
);

Insert into employees (name, pay_rate)
  VALUES
  ('James P', '12.00'),
  ('Justin N', '14.00'),
  ('Jorge R', '17.00');
Insert into shifts (type)
  VALUES
  ('1st Shift'),
  ('2nd Shift'),
  ('3rd Shift');
