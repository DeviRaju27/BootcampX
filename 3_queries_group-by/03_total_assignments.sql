SELECT cohorts.name, count(assignment_submissions.*)
FROM assignment_submissions
JOIN students
ON student_id = students.id
JOIN cohorts
ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.*) desc;





