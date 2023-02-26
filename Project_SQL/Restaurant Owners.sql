-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- write SQL 3-5 queries analyze data
-- 1x subquery/with
-----------------------------------------------------------------
-- Create 1st dimension table
CREATE TABLE customers(
  customer_id INT UNIQUE PRIMARY KEY,
  name   TEXT,
  sex   TEXT,
  start_member DATE,
  end_member DATE
);

INSERT INTO customers VALUES
(1,	'Olivia',	'female',	'2022-03-01',	'2023-05-01'),
(2,	'Cruz',	'male',	'2022-04-02',	'2023-04-02'),
(3,	'Sven',	'male',	'2022-07-03',	'2023-07-03'),
(4,	'Chloe',	'female',	'2022-07-04',	'2023-07-04'),
(5,	'Cara',	'female',	'2022-07-05',	'2023-07-05'),
(6,	'Emma',	'female',	'2022-08-06',	'2023-08-06'),
(7,	'Angelo',	'male',	'2022-08-07',	'2023-08-07'),
(8,	'Ryder',	'male',	'2022-09-08',	'2023-09-08'),
(9,	'Bryant',	'male',	'2022-10-09',	'2023-10-09'),
(10,	'Colt',	'male',	'2022-11-10',	'2023-11-10');

--------------------------------------------------------------------
-- Create 2nd dimension table
CREATE TABLE branchs(
  branch_id INT UNIQUE PRIMARY KEY,
  city   TEXT,
  country  TEXT
);

INSERT INTO branchs VALUES
(1,	'Bangkok',	'Thailand'),
(2,	'New York',	'USA'),
(3,	'Basel',	'Switzerland'),
(4,	'Rome',	'Italy'),
(5,	'Berlin',	'Germany');

--------------------------------------------------------------------
-- Create 3rd dimension table
CREATE TABLE payments(
  payment_id INT UNIQUE PRIMARY KEY,
  methods  TEXT
);

INSERT INTO payments VALUES
(1,	'cash'),
(2,	'paypal'),
(3,	'QR Cord'),
(4,	'credit card'),
(5,	'debit card');

--------------------------------------------------------------------
-- Create 4th dimension table
CREATE TABLE discounts(
  discount_id TEXT UNIQUE PRIMARY KEY,
  description  TEXT
);

INSERT INTO discounts VALUES
('CB10JAN',	'Minimum 1,000 cashback 10%'),
('B3JANH',	'Minimum 700 discount 7%'),
('FD2JAN',	'Free delivery'),
('2XPOINT',	'2x extra points');

--------------------------------------------------------------------
-- Create 1 fact table
CREATE TABLE transactions (
    order_id INT NOT NULL PRIMARY KEY,
    order_date DATETIME,
    customer_id INT,
    branch_id INT,
    payment_id INT,
    discount_id TEXT,
    amount REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branchs(branch_id),
    FOREIGN KEY (discount_id) REFERENCES discounts(discount_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);
-- Insert data in fact table
INSERT INTO transactions VALUES 
  (1,	'2022-01-01 17:30:00',	1,	2,	3,	'B3JANH',	999),
  (2,	'2023-01-01 18:10:00',	1,	1,	3,	'B3JANH',	1820),
  (3,	'2023-01-01 18:45:00',	5,	1,	4,	'B3JANH',	1148),
  (4,	'2023-01-01 19:30:00',	3,	4,	1,	'CB10JAN',	1218),
  (5,	'2023-01-02 12:30:00',	9,	5,	3,	'2XPOINT',	576),
  (6,	'2023-01-02 13:30:00',	7,	2,	3,	'FD2JAN',	725),
  (7,	'2023-01-02 15:30:00',	3,	2,	3,	'CB10JAN',	1832),
  (8,	'2023-01-02 18:30:00',	10,	3,	4,	'CB10JAN',	1434),
  (9,	'2023-01-02 18:47:00',	7,	3,	5,	'CB10JAN',	1712),
  (10,	'2023-01-02 18:50:00',	3,	2,	3,	'CB10JAN',	1916),
  (11,	'2023-01-02 18:59:00',	1,	1,	2,	'CB10JAN',	1141),
  (12,	'2023-01-03 12:30:00',	1,	5,	3,	'FD2JAN',	685),
  (13,	'2023-01-03 12:45:00',	6,	4,	5,	'FD2JAN',	1382),
  (14,	'2023-01-03 12:59:00',	3,	5,	1,	'FD2JAN',	1834),
  (15,	'2023-01-03 18:47:00',	2,	2,	2,	'FD2JAN',	578),
  (16,	'2023-01-04 12:30:00',	4,	2,	3,	'2XPOINT',	642),
  (17,	'2023-01-05 12:15:00',	8,	3,	4,	'2XPOINT',	755),
  (18,	'2023-01-05 12:20:00',	10,	1,	5,	'B3JANH',	1575),
  (19,	'2023-01-05 13:30:00',	10,	1,	5,	'2XPOINT',	1421),
  (20,	'2023-01-05 14:30:00',	8,	3,	4,	'2XPOINT',	1487),
  (21,	'2023-01-06 12:00:00',	6,	4,	4,	'FD2JAN',	1167),
  (22,	'2023-01-06 12:10:00',	7,	3,	2,	'2XPOINT',	598),
  (23,	'2023-01-06 12:50:00',	4,	3,	4,	'CB10JAN',	1980),
  (24,	'2023-01-06 15:30:00',	4,	5,	1,	'CB10JAN',	1260),
  (25,	'2023-01-06 16:20:00',	8,	3,	3,	'CB10JAN',	1482),
  (26,	'2023-01-07 12:30:00',	5,	3,	5,	'B3JANH',	1290),
  (27,	'2023-01-07 12:31:00',	2,	2,	4,	'B3JANH',	1872),
  (28,	'2023-01-07 12:48:00',	2,	5,	3,	'2XPOINT',	567),
  (29,	'2023-01-07 15:27:00',	4,	3,	1,	'2XPOINT',	720),
  (30,	'2023-01-07 17:30:00',	8,	2,	5,	'CB10JAN',	1291);
--------------------------------------------------------------------
.mode markdown
.header on
--------------------------------------------------------------------
--01 Which customer has the most purchases?
select
  customers.name AS customer_name,
  SUM(transactions.amount) AS total
from transactions
join customers
on transactions.customer_id = customers.customer_id
group by 1
order by 2 desc;
--------------------------------------------------------------------
--02 Count of transaction by branchs
SELECT
  branchs.city, 
  COUNT(*) AS nTransaction
from transactions
join branchs
on transactions.branch_id = branchs.branch_id
GROUP BY 1
ORDER BY 2 DESC;
--------------------------------------------------------------------
-- 03 Which branch sells the best on 2/01/2022?
with sub AS (
  select
    CAST(STRFTIME('%Y',order_date)AS INT) year,
    CAST(STRFTIME('%m',order_date)AS INT) month,
    CAST(STRFTIME('%d',order_date)AS INT) day,
    branch_id,
    amount
  from transactions
  where day = 2
)
select
  sub.year,
  sub.month,
  sub.day,
  branchs.city,
  branchs.country,
  SUM(sub.amount) AS total_sales
from sub
join branchs
on sub.branch_id = branchs.branch_id 
GROUP BY 4,5
ORDER BY 6 DESC;
--------------------------------------------------------------------
--04 Count of using promotion by customer
with sub AS (
  select
   transactions.customer_id,
   transactions.discount_id as id,
   discounts.description as detail,
   transactions.amount as total_sales
  from transactions
  left join discounts 
  on transactions.discount_id = discounts.discount_id
)
select
  customers.customer_id,
  customers.name as name,
  sub.detail,
  COUNT(sub.id) as count_discount,
  SUM(sub.total_sales) as revenue
from sub
join customers 
on sub.customer_id = customers.customer_id
group by 1,2,3
order by 5 DESC;
--------------------------------------------------------------------
