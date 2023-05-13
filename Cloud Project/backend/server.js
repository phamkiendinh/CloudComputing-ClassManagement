const express = require('express')

const app = express();

const port = process.env.PORT || 3000;

const cors = require('cors');
app.use(cors());

// On normal, body json is not in json type, need a middleware
const body_parser = require('body-parser');
app.use(body_parser.urlencoded({extended:false}));
app.use(body_parser.json());

// Teacher Router
const teacher_router = require('./app/routes/teacher_route');
app.use('/teacher', teacher_router);

// Student Router
const student_router = require('./app/routes/student_route');
app.use('/student', student_router);

// Course Router
const course_router = require('./app/routes/course_route');
app.use('/course', course_router);

// Attendance Router
const attendance_router = require('./app/routes/attendance_route');
app.use('/attendance', attendance_router);


// Teacher Course Router
const teacher_course_router = require('./app/routes/teacher_course_route');
app.use('/teacher_course', teacher_course_router);

// Student Course Router
const student_course_router = require('./app/routes/student_course_route');
app.use('/student_course', student_course_router);


app.listen(port, () => {
    console.log('App is listening on port: ' + port);
});