\\\ db lab-6 \\\
CREATE TABLE cust(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(30),age INT,address VARCHAR(20),salary FLOAT)
INSERT INTO cust(NAME,age,address,salary)VALUES('rahim',20,'rangpur',25000),('karim',23,'dhaka',5000),
('abdur',25,'dinajpur',4200),('rahman',27,'sylhet',5000),('abul',23,'norail',10000),('salma',24,'dhaka',20000),
('kamal',26,'rangpur',4500),('salim',24,'dhaka',3000),('kamran',25,'dinajpur',12000),('kalam',26,'dhaka',1000)

SELECT NAME FROM cust WHERE salary BETWEEN 4000 AND 10000

SELECT SUM(salary) FROM cust WHERE salary=5000

SELECT MAX(salary) FROM cust

SELECT MIN(salary) FROM cust

SELECT COUNT(id) FROM cust WHERE salary<20000

/*-------------*/
CREATE DATABASE shop

CREATE TABLE Products(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,P_name VARCHAR(20),Category INT)
INSERT INTO Products(P_name,Category)VALUES('Pen',1),('Pencil',1),('Calculator',2),('Sharpner',1),('Math',3)

CREATE TABLE Categories(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,C_name VARCHAR(20))
INSERT INTO Categories (C_name) VALUES ('Stationary'),('Electric'),('Book'),('Color Box')

CREATE TABLE Invoice(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,inv_no INT,Product INT,qty INT,Price INT)
INSERT INTO Invoice(inv_no,Product,qty,Price)VALUES(101,1,10,50),(102,2,15,150),(103,2,5,45),(104,1,20,100),
(105,5,1,250),(106,2,20,300),(107,3,2,1400)

SELECT Products.P_name AS product,Categories.C_name AS category FROM Products INNER JOIN Categories ON Products.Category=Categories.id

SELECT Products.P_name AS product,Categories.C_name AS category,Invoice.qty AS quantity FROM Products 
INNER JOIN Categories ON (Products.Category=Categories.id)
INNER JOIN Invoice ON (Products.id=Invoice.Product) WHERE Products.P_name="Math"

SELECT Products.P_name AS product,SUM(Invoice.Price) AS total_price FROM Products LEFT JOIN Invoice ON (Products.id=Invoice.Product) 
GROUP BY Products.P_name ORDER BY Products.P_name desc