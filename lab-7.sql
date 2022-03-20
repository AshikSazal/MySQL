CREATE DATABASE baust
CREATE TABLE students(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,sname VARCHAR(20),address TEXT,
contact VARCHAR(20))
INSERT INTO students (sname,address,contact)VALUES('rahim','dinajpur','123456'),('rummun','dhaka','12356'),('mun','norail','789456'),
('munmun','rangpur','123456'),('rohan','comilla','01234'),('kamrun','dhaka','0123456'),('kamal','rajshahi','0745856'),('munna','comilla','0123456'),
('rahul','dinajpur','0178522'),('karim','dhaka','025364')

CREATE TABLE courses(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,course_name VARCHAR(20),CODE INT)
INSERT INTO courses(course_name,CODE)VALUES('math',1001),('dbms',1002),('network',1003)

CREATE TABLE registration(sid INT NOT NULL,cid INT NOT NULL,reg_date DATE,
FOREIGN KEY fk_sid(sid) REFERENCES students(id),FOREIGN KEY fk_cid(cid) REFERENCES courses(id))
INSERT INTO registration(sid,cid,reg_date)VALUES(1,1,'2020-02-01'),(2,3,'2020-02-05'),(3,3,'2020-02-06'),(4,3,'2020-03-03'),(5,2,'2020-03-04'),
(6,2,'2020-03-06'),(7,3,'2020-03-08'),(8,3,'2020-04-05'),(9,1,'2020-04-06'),(10,3,'2020-04-06')

SELECT COUNT(*) AS COUNT FROM registration WHERE cid=2

SELECT CODE FROM courses INNER JOIN registration ON courses.id=registration.cid GROUP BY courses.code 
HAVING COUNT(*)>5

SELECT courses.course_name FROM courses INNER JOIN students ON students.id=courses.id 
WHERE sname LIKE '%mun%' AND LENGTH(sname)>4 GROUP BY students.id

SELECT reg_date AS DATE,COUNT(reg_date) AS number FROM registration GROUP BY reg_date

----------------------------------------------------------------------------------------------------------------

CREATE TABLE grade_tbl(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,sub1 INT,sub2 INT,sub3 INT)
INSERT INTO grade_tbl(sub1,sub2,sub3)VALUES(55,67,50),(45,48,49),(60,67,75),(76,73,72),(85,76,90),(42,40,47),(59,55,51)

DELIMITER $$
CREATE FUNCTION grade(sub1 INT,sub2 INT,sub3 INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE g VARCHAR(50);
DECLARE avg_mark FLOAT;
SET avg_mark=(sub1+sub2+sub3)/3;
IF avg_mark>90.0 THEN SET g='Good';
ELSEIF avg_mark>70.0 AND avg_mark<90.0 THEN SET g='Average';
ELSE SET g='Bad';
END IF;
RETURN (g);
END $$
DELIMITER ;

SELECT id,grade(sub1,sub2,sub3) AS STATUS FROM grade_tbl;