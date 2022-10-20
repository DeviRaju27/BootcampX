const { Pool } = require('pg');
const [, , cohort_month, limit] = process.argv;
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'

})

pool.query(
  `SELECT DISTINCT teachers.name as teacher_name, cohorts.name as cohort_name
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name = '${cohort_month}'
  ORDER BY teacher_name;` 
)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort_name}: ${user.teacher_name}`)
  })
  
})
.catch(err => console.error("error",err.stack))