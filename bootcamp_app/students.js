const { Pool } = require('pg');
const [, , cohort_month, limit] = process.argv;
const values = [`%${cohort_month}%`,`${limit}`]
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'

})

const query = 
  `SELECT students.id as student_id, students.name as student_name, cohorts.name as cohort_name
  FROM students
  JOIN cohorts
  ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2 ;`


pool.query(query, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student_name} is in ${user.cohort_name}`)
  })
  
})
.catch(err => console.error("error",err.stack))