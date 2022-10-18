SELECT SUM(duration) 
FROM students 
JOIN assignment_submissions
on students.id = assignment_submissions.student_id
where students.name = 'Ibrahim Schimmel';