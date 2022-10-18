SELECT cohorts.name,count(students.id)
FROM students
JOIN cohorts
on students.cohort_id = cohorts.id
GROUP BY cohorts.name 
HAVING count(students.id)>= 18
ORDER BY count(students.id);