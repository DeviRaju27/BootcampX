const { Pool } = require('pg');
const [, , cohort_month] = process.argv;
const values = [`${cohort_month}`]
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})
const query = `SELECT DISTINCT teachers.name as teacher_name, cohorts.name as cohort_name
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher_name;` 

pool.query(query, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort_name}: ${user.teacher_name}`)
  })
  
})
.catch(err => console.error("error",err.stack))