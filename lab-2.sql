CREATE TABLE customer(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,c_name VARCHAR(20),address VARCHAR(20),salary DOUBLE)

INSERT INTO customer(c_name,address,salary)VALUES('rahim','rangpur',19500.56),('karim','dhaka',2536.25),('sumon','dinajpur',12580),('kalam','saidpur',14500.35),
('rahman','silhet',15400.38),('abdur','rajshahi',15400),('rebeka','nilphamari',14780.36),('pial','dinajpur',14800.45),('raju','gopalgong',12543.25),
('rabeya','josser',1200.36)

CREATE TABLE salary(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,c_name VARCHAR(20),salary DOUBLE)

INSERT INTO salary(c_name,salary)VALUES('rahim',19500.56),('karim',2536.25),('sumon',12580),('kalam',14500.35),('rahman',15400.38),('abdur',15400),
('rebeka',14780.36),('pial',14800.45),('raju',12543.25),('rabeya',1200.36)

ALTER TABLE customer RENAME TO customer_tbl /*Table name change*/

ALTER TABLE customer_tbl ADD COLUMN phone VARCHAR(20) AFTER address/*Add new column*/
ALTER TABLE customer_tbl ADD COLUMN email VARCHAR(20) AFTER phone

ALTER TABLE customer_tbl DROP COLUMN email /*Drop column*/
ALTER TABLE customer_tbl DROP COLUMN phone

ALTER TABLE customer_tbl CHANGE COLUMN c_name s_name VARCHAR(20) /*Column name change*/
ALTER TABLE customer_tbl CHANGE COLUMN id s_id INT

ALTER TABLE customer_tbl ADD COLUMN phone INT DEFAULT 10 AFTER address /*default value add*/