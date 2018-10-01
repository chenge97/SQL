 /*
 First I created a table with the concats of the names with the t1.name first and then the t2.name first
*/
 SELECT * , CONCAT(t1.name, t2.name) concat, CONCAT(t2.name, t1.name) concat2 FROM (
    -> SELECT * FROM student s
    -> INNER JOIN student_like sl
    -> ON s.id = sl.liker_id) t1
    -> INNER JOIN
    -> (SELECT * FROM student) t2
    -> ON t2.id = t1.likee_id;

 /*After that I created a artial table witch I could modify later on, and add the 
 concat2 values in the concat column */

 CREATE TABLE amigos_parcial ( id INT NOT NULL AUTO_INCREMENT,
    -> PRIMARY KEY(id),
    -> id_liker INT(5),
    -> name VARCHAR(50),
    -> grade INT(2),
    -> id_likee INT(5),
    -> name1 VARCHAR(50),
    -> grade1 INT(2),
    -> concat VARCHAR(200),
    -> concat2 VARCHAR(200));

 INSERT INTO amigos_parcial(id_liker, name,grade,id_likee,name1,grade1,concat,concat2)
    -> SELECT * FROM (
    -> SELECT t1.id, t1.name,t1.grade, t2.id id1,t2.name name1,t2.grade grade1 , CONCAT(t1.name, t2.name) concat, CONCAT(t2.name, t1.name) concat2 FROM (
    -> SELECT * FROM student s
    -> INNER JOIN student_like sl
    -> ON s.id = sl.liker_id) t1
    -> INNER JOIN
    -> (SELECT * FROM student) t2
    -> ON t2.id = t1.likee_id) t3;

 INSERT INTO amigos_parcial (concat)
    -> SELECT concat2 FROM amigos_parcial;

  # At the end I took the ones with ID bigger to avoid rpetititions
   SELECT * FROM (
    -> SELECT id_liker, name, grade, id_likee, name1,grade1  FROM amigos_parcial
    -> GROUP BY concat
    -> HAVING COUNT(concat) > 1) t1
    -> WHERE id_liker < id_likee;


#9.5) 

/*I created the query in witch 1 kid likes the other one but the other one does not like back*/

 SELECT t1.name, t1.grade, t1.name1, t1.grade1 FROM (
    -> SELECT name, grade, name1,grade1 ,COUNT(concat) FROM amigos_parcial
    -> GROUP BY concat
    -> HAVING COUNT(concat) < 2) t1
    -> WHERE t1.name IS NOT NULL;