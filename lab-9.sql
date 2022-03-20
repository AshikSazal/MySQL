CREATE DATABASE baust
CREATE TABLE customers(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,cname VARCHAR(20),address TEXT)

INSERT INTO customers(cname,address)VALUES('karim','rangpur'),('rahim','dhaka'),('abdur','rajshahi'),('jamal','rangpur'),('rahman','dinajpur')

CREATE TABLE log_tbl(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,cname VARCHAR(20),address TEXT,
ldate DATE)

CREATE TABLE sale(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,cid INT,qty INT,price FLOAT,sdate DATE,FOREIGN KEY fk_id(cid) REFERENCES customers(id))
INSERT INTO sale(cid,qty,price,sdate)VALUES(1,10,150.50,'2020-01-01'),(2,20,100.60,'2020-01-02'),(3,30,300.23,'2020-01-04'),(1,10,200.5,'2020-01-06'),
(1,20,500.65,'2020-01-07'),(2,50,600,'2020-01-09'),(3,40,315.5,'2020-01-10'),(4,30,400,'2020-01-12'),(5,20,200.6,'2020-01-13'),(1,10,500,'2020-01-16'),
(4,10,600.5,'2020-01-17'),(5,20,400.6,'2020-01-19')

DELIMITER $$
CREATE PROCEDURE info_proc(IN c_name VARCHAR(20),IN s_date DATE,IN e_date DATE)
BEGIN

SELECT SUM(price) AS 'Total Price',SUM(qty) AS 'Total Quantity' FROM sale WHERE cid IN(
SELECT id FROM customers WHERE cname=c_name AND sdate BETWEEN s_date AND e_date);

END $$
DELIMITER ;

CALL info_proc('karim','2020-01-01','2020-01-07')

---------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER before_update_customers BEFORE UPDATE ON customers FOR EACH ROW
BEGIN

INSERT INTO log_tbl SET cname=old.cname,address=old.address,ldate=NOW();

END $$
DELIMITER ;

UPDATE customers SET cname='Abdur karim' WHERE id=1
