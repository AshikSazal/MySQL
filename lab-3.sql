CREATE DATABASE information
CREATE TABLE Student(id INT ,LEVEL VARCHAR(5),term VARCHAR(5))
ALTER TABLE Student RENAME TO st_tbl
ALTER TABLE st_tbl CHANGE COLUMN id id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
ALTER TABLE st_tbl CHANGE COLUMN term term INT
ALTER TABLE st_tbl CHANGE COLUMN id st_id INT
information
INSERT INTO st_tbl(NAME,LEVEL,term)VALUES('abdur','2',1),
('karim','3',2),('rahman','1',2),('shamim','4',1),('kabir','1',2)

CREATE TABLE grade(g_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,gpa FLOAT NOT NULL,s_id INT,
FOREIGN KEY fk_grade_sid(s_id)REFERENCES st_tbl(id))
INSERT INTO grade(gpa,s_id)VALUES(3.75,3),(3.45,1),(4,5),(4.00,2),(3.68,4)
UPDATE grade SET gpa=4 WHERE s_id=1
