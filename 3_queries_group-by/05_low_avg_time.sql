SELECT students.name, avg(assignment_submissions.duration) as peronal_avg ,avg(assignments.duration) as avg_duration
FROM students
JOIN assignment_submissions
ON assignment_submissions.student_id = students.Id
JOIN assignments
ON assignment_id = assignments.id
where students.end_date IS NULL
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg(assignment_submissions.duration);





