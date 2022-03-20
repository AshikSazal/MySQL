CREATE DATABASE shop
CREATE TABLE product(product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,price DOUBLE,product_name VARCHAR(10))
INSERT INTO product(price,product_name)VALUES (10000,'pant'),(2000,'shirt'),(3000,'trouser'),
(12000,'jacket'),(6000,'shoe')

CREATE TABLE customer(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(20),address VARCHAR(20),issue DATE,product_code INT,
FOREIGN KEY fk_id(product_code)REFERENCES product(product_id))

INSERT INTO customer(NAME,address,issue,product_code)VALUES('karim','dhaka','2019-12-7',5),('rahim','rangpur','2015-06-13',4),('abdur','dhaka','2016-02-15',3),
('kalam','dinajpur','2016-03-04',2),('rahman','rangpur','2016-05-23',1)

DELETE FROM customer WHERE product_code IN(1,4,5)

DELETE FROM customer WHERE address='dhaka'

UPDATE product SET price=6000 WHERE product_name='shirt'

SELECT NAME,address FROM customer

SELECT product_name,price FROM product

SELECT product_name,price FROM product WHERE price>=5000

# Lab Query

CREATE TABLE orders(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,order_no INT,order_date DATE,product VARCHAR(20),qty INT,price DOUBLE)

INSERT INTO orders(order_no,order_date,product,qty,price)VALUES(101,'2020-01-02','Pen',50,250),(101,'2020-01-02','Note Book',20,400),
(102,'2020-01-05','Pencil',60,600),(102,'2020-01-05','Note Book',10,200),(102,'2020-01-05','Sharpner',60,300),(103,'2020-01-07','Pen',70,350)

SELECT order_no FROM orders WHERE price<300 AND qty>30

SELECT MAX(price) FROM orders
SELECT MAX(price) AS max_price FROM orders
SELECT MIN(price) FROM orders
SELECT AVG(price) FROM orders
SELECT COUNT(id) FROM orders
SELECT COUNT(*) FROM orders
SELECT SUM(qty) FROM orders

SELECT order_no FROM orders WHERE order_date BETWEEN '2020-01-02' AND '2020-03-05'
SELECT DISTINCT order_no FROM orders WHERE order_date BETWEEN '2020-01-02' AND '2020-03-05'

SELECT DATABASE()
SHOW COLUMNS FROM orders
DESC orders