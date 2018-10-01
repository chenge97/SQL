/*Fisrt I created a query in witch you can see clearly where are NULLS to see that we dont have any info of witch 
kids the like but one kid likes them */

 SELECT * FROM student s
    -> LEFT JOIN student_like sl
    -> ON s.id = sl.likee_id
    -> OR s.id = sl.liker_id;

# And then I reoved the ones that they have at least one kid that likes thems

SELECT t1.name, t1.grade FROM (
    -> SELECT * FROM student s
    -> LEFT JOIN student_like sl
    -> ON s.id = sl.likee_id
    -> OR s.id = sl.liker_id) t1
    -> WHERE t1.likee_id IS NULL
    -> AND t1.liker_id IS NULL;
