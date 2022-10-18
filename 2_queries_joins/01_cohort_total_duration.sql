
SELECT SUM(assignment_submissions.duration) 
FROM assignment_submissions 
JOIN students
ON students.id = assignment_submissions.student_id
JOIN cohorts
on students.cohort_id = cohorts.id
where cohorts.name = 'FEB12';
