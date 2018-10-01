SELECT * FROM (
    -> SELECT * FROM student
    -> INNER JOIN student_like
    -> ON student.id = student_like.liker_id
    -> WHERE student.name = 'gabriel') t1
    -> INNER JOIN
    -> (SELECT * FROM student) t2
    -> ON t1.likee_id = t2.id;