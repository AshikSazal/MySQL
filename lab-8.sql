CREATE DATABASE baust
CREATE TABLE customers(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(50),credit_limit DOUBLE,cdate DATE)
INSERT INTO customers(NAME,credit_limit,cdate)VALUES('rahim',5000,'2020-01-01'),('karim',6000,'2020-01-01'),('abdul',12000,'2020-01-05'),
('rahman',15000,'2020-01-05'),('roton',45000,'2020-01-08'),('faruq',55000,'2020-01-08'),('siam',70000,'2020-01-15'),('rejaul',90000,'2020-01-15'),
('rifat',110000,'2020-01-26'),('sifat',115000,'2020-02-05'),('saikot',60000,'2020-02-15'),('salam',6000,'2020-02-20'),('shaon',40000,'2020-02-20')

DELIMITER $$
CREATE FUNCTION GetLevelByCredit(credit_limit DOUBLE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
IF credit_limit<10000 THEN RETURN 'Silver';
ELSEIF credit_limit>=10000 AND credit_limit<50000 THEN RETURN 'Gold';
ELSEIF credit_limit>=50000 AND credit_limit<100000 THEN RETURN 'Platinum';
ELSEIF credit_limit>100000 THEN RETURN 'Star';
END IF;
END $$
DELIMITER ;

SELECT GetLevelByCredit(credit_limit) AS 'credit limit' FROM customers;

--------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE NoCustByDate(IN start_date DATE,IN end_date DATE,OUT no_cust INT)
BEGIN
SELECT COUNT(*) INTO no_cust FROM customers WHERE cdate BETWEEN start_date AND end_date;
END $$
DELIMITER ;

CALL NoCustByDate('2020-01-01','2020-02-20',@no_cust)
SELECT @no_cust AS 'Number of Customer'