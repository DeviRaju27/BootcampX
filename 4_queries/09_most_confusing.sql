SELECT assignments.id,day,chapter,name, count(assistance_requests.*) as counted
FROM assignments
JOIN assistance_requests
ON assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY counted DESC;