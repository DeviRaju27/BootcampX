-- SELECT  MAX(average) FROM (
-- SELECT cohorts.name as name, AVG(completed_at-started_at) as average
-- FROM assistance_requests
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name ) 
-- AS maximum;

SELECT cohorts.name, AVG(completed_at-started_at) as average
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average DESC
LIMIT 1;