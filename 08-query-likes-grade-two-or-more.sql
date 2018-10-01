 # query to find all the likes relations
	SELECT * FROM (
    -> SELECT * FROM student
    -> INNER JOIN student_like
    -> ON student.id = student_like.liker_id
    -> OR student.id = student_like.likee_id) t1
    -> INNER JOIN
    -> (SELECT * FROM student) t2
    -> ON t1.likee_id = t2.id
    -> OR t1.liker_id = t2.id
    -> ;


   # 2) Final query
    SELECT t1.name, t1.grade, t2.name FROM (
    -> SELECT * FROM student
    -> INNER JOIN student_like
    -> ON student.id = student_like.liker_id
    -> OR student.id = student_like.likee_id) t1
    -> INNER JOIN
    -> (SELECT * FROM student) t2
    -> ON t1.likee_id = t2.id
    -> OR t1.liker_id = t2.id
    -> WHERE t1.grade -2 >= t2.grade;