# 1.Query the existence of 1 course
select * from student_course a where a.courseId = '1';
# 2.Query the presence of both 1 and 2 courses
select * from course a where a.id in ('1','2');
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select
    t1.studentId,
    t2.`name`,
    avg(t1.score) as avg_score
from
    student_course t1
left join student t2 on
    t1.studentId = t2.id
group by
    t1.studentId
having
    avg(t1.score) >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student t1 where t1.id not in(SELECT studentId from student_course);
# 5.Query all SQL with grades
select * from student t1 where t1.id in(SELECT studentId from student_course);
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student t1 where t1.id in(
        select studentId from student_course where courseId='1' and studentId in (select studentId from student_course where courseId='2'));
# 7.Retrieve 1 student score with less than 60 scores in descending order
select * from student_course t1 where (select score from student_course where courseId = '1' and studentId = t1.studentId) < 60 GROUP BY studentId order by score DESC;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId, avg(score) from student_course group by courseId;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT st.`name` as studentName,st.id as studentId,co.`name` as courseName, sc.score FROM 
student as st 
INNER JOIN 
student_course as sc on st.id=sc.studentId
INNER JOIN
course as co on sc.courseId=co.id
WHERE co.`name`='Math' and sc.score < 60;
