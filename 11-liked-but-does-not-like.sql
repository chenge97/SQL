 /*First I repeated the process to see witch kid does not have any info of who do the like*/

SELECT * FROM student
    -> LEFT JOIN student_like
    -> ON student.id = student_like.liker_id
    -> ORDER BY liker_id;

    /*Then I separated the ones that have 1 kid that likes them*/

    SELECT t1.likee_id, t2.name,t2.grade FROM (
    -> SELECT likee_id FROM student_like
    -> WHERE likee_id NOT IN (SELECT liker_id FROM student_like)
    -> AND liker_id NOT IN (SELECT likee_id FROM student_like)) t1
    -> INNER JOIN
    -> (SELECT * FROM student) t2
    -> ON t1.likee_id = t2.id;

   # And I joined both queries

    SELECT t1.name, t1.grade, t2.name name1, t2.grade grade1 FROM (
    -> SELECT * FROM student
    -> LEFT JOIN student_like
    -> ON student.id = student_like.liker_id) t1
    -> INNER JOIN
    -> (SELECT s1.likee_id, s2.name, s2.grade FROM
    -> (SELECT likee_id FROM student_like
    -> WHERE likee_id NOT IN (SELECT liker_id FROM student_like)
    -> AND liker_id NOT IN (SELECT likee_id FROM student_like)) s1
    -> INNER JOIN
    -> (SELECT * FROM student) s2
    -> ON s1.likee_id = s2.id) t2
    -> ON t1.likee_id = t2.likee_id;