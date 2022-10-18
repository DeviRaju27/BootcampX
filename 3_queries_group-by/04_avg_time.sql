
SELECT students.name, avg(assignment_submissions.duration)
FROM assignment_submissions
JOIN students
ON assignment_submissions.student_id = students.id
where students.end_date IS NULL
GROUP BY students.name
ORDER BY avg(assignment_submissions.duration) desc;





