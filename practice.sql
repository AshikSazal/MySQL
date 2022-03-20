CREATE TABLE buyer(
bid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
bname VARCHAR(100),
address VARCHAR(100))
INSERT INTO buyer(bname,address)VALUES('Ask','Dhaka'),('csk','Rangpur'),('rsk','Dinajpur')
UPDATE buyer SET bname='ashik' WHERE bid=1;
UPDATE buyer SET bname='sos' WHERE bid=2;
UPDATE buyer SET bname='zhorna' WHERE bid=3;

CREATE TABLE factory(
fid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname VARCHAR(100),
address VARCHAR(100))

INSERT INTO factory(fname,address)VALUES('fAk','Dhaka'),('dak','Rangpur'),('tak','Dinajpur')

CREATE TABLE buyer_order(
bpo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product VARCHAR(100),
color VARCHAR(100),
qty INT,
bprice INT,
bid INT,
FOREIGN KEY buyer_order_bid(bid) REFERENCES buyer(bid))

INSERT INTO buyer_order(product,color,qty,bprice,bid)VALUES('pen','black',10,5000,1),
('pencil','white',20,100000,2),('rubber','yellow',15,15000,2),('craser','black',25000,125,3),
('khata','white',5,25000,2)

CREATE TABLE factory_order(
fpo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
qty INT,
fprice DOUBLE,
bpo_id INT,
fid INT,
FOREIGN KEY buyer_order_bid1(bpo_id) REFERENCES buyer_order(bpo_id ),
FOREIGN KEY buyer_order_bid2(fid) REFERENCES factory(fid))

INSERT INTO factory_order(qty,fprice,bpo_id,fid)VALUES(10,60000,1,1),(20,40000,3,2),(30,55000,4,2),
(40,30000,2,3),(50,45000,5,2)
UPDATE factory_order SET bpo_id=4 WHERE fpo_id=5
UPDATE factory_order SET bpo_id=5 WHERE fpo_id=5


#select bpo_id from buyer_order where bid in(select bid from buyer where bname='csk')
#select bname from buyer where bid in(select bid from buyer_order where bpo_id in(1,2))

SELECT fname FROM factory WHERE fid IN(SELECT fid FROM factory_order WHERE bpo_id IN(
SELECT bpo_id FROM buyer_order WHERE bid IN(SELECT bid FROM buyer WHERE bname='csk')))

SELECT fpo_id FROM factory_order WHERE fprice IN(SELECT MAX(fprice) FROM factory_order WHERE bpo_id IN (
SELECT bpo_id FROM buyer_order WHERE bid IN (SELECT bid FROM buyer WHERE bname='cisalpha')))

SELECT fname FROM factory WHERE fid IN(SELECT fid FROM factory_order WHERE bpo_id IN(
SELECT bpo_id FROM buyer_order GROUP BY bprice HAVING SUM(bprice)>50000))

SELECT bpo_id FROM buyer_order WHERE bid IN(SELECT bid FROM buyer WHERE bname LIKE 'a_%_%_%' OR 
bname LIKE 's_%_%_%' OR bname LIKE 'z_%_%_%')

CREATE INDEX buyer_order_index ON buyer_order(product,color)
SHOW INDEX FROM buyer_order


