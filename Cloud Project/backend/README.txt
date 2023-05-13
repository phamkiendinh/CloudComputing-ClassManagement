Please run these following commands to run npm environment


Step 1: Install npm via https://docs.npmjs.com/cli/v8/commands/npm-install
Step 2: Open command line
Step 3: run "npm install nodejs --save"      Note: --save is optional 
Step 4: run "npm install express --save"
Step 5: run "npm i --save body-parser" or run "npm install body-parser --save"
Step 6: run "npm install mysql@latest"
Step 7: run "npm install nodemon - g"
Step 7: Navigate to "backend" directory  
Step 8: Run "npm run start" or "node server.js", first version is preferred

There you go, the server is ready and waiting for requests
Routing path:

Main url starts with :/, specifically https:/..../url/
where url stands before all routers

***Course Route***:
Expected JSON format:
{
    "cname": not null unique
}

url/course/all: Get Method, get all courses
url/course/id : Get Method, get one course by course ID
url/course/add: Post Method, add new course
url/course/delete/id: Delete Method, delete a course by ID 
url/course/update/id: Update a method base on ID
url/course/:id/count/student: Count student of one course belong to one teacher

***Student Route***:
Expected JSON format:
{
    "lname": not null,
    "fname": not null,
}

url/student/all: Get Method, get all students
url/student/id : Get Method, get one student by student ID
url/student/add: Post Method, add new student
url/student/delete/id: Delete Method, delete a student by ID 
url/student/update/id: Update a student base on ID


***Teacher Route***:
Expected JSON format:
{
    "lname": not null,
    "fname": not null,
}

url/teacher/all: Get Method, get all teachers
url/teacher/id : Get Method, get one teacher by teacher ID
url/teacher/add: Post Method, add new teacher
url/teacher/delete/id: Delete Method, delete a teacher by ID 
url/teacher/update/id: Update a teacher base on ID


***Attendance Route***:
Expected JSON format:

~ POST Method For adding ~
{
    "date": DATE NOT NULL,
    "sid" : NULLABLE,
    "tid" : NULLABLE,
    "present" : BOOLEAN NOT NULL
}

~ Other POST Methods~
url/attendance/student/id/date | url/attendance/student/id/week 
{
    "date": 'yyyy-mm-dd',
}
url/attendance/student/id/month 
{
    month: "int"
}

url/attendance/add: POST Method, add new attendance
url/attendance/student/id : Get Method, get all attendances by student ID
url/attendance/student/id/date : POST Method, get all attendances by student ID in a specific date
url/attendance/student/id/week : POST Method, get all attendances by student ID in a specific week
url/attendance/student/id/month : POST Method, get all attendances by student ID in a specific month
url/attendance/all/date : POST Method, get all attendances in a specific date
url/attendance/all/month : POST Method, get all attendances in a specific month

url/attendance/teacher_course/present: POST method, get all student attendances of a course of a teacher
Expected JSON format:
{
    date: "",
    tid: "",
    cid: ""
}

***Teacher Course Route***:
Expected JSON format:

~ POST Method For adding ~
{
    "tid" : NOT NULLABLE,
    "cid" : NOT NULLABLE,
}


url/teacher_course/all: GET Method that returns all teacher course
url/teacher_course/id: GET Method that returns teacher course with specific id 
url/teacher_course/course/id: GET Method that returns teacher course with specific cid
url/teacher_course/teacher/id: GET Method that returns teacher course with specific tid 
url/teacher_course/add: POST Method that returns an added teacher course with JSON format
url/teacher_course/teacher/delete: DELETE Method that deletes specific teacher course with specific id cascaded
url/teacher_course/teacher/update: GET Method that updates teacher course with specific id 
url/teacher_course/teacher/:id/course/:id/count: GET method that returns total number of students that has same course taught by the teacher
url/teacher_course/most/teacher: GET method that return the teacher that has the most classes

***Student Course Route***:
Expected JSON format:

~ POST Method For adding ~
{
    "sid" : NOT NULLABLE,
    "cid" : NOT NULLABLE,
}


url/student_course/all: GET Method that returns all student course
url/student_course/id: GET Method that returns student course with specific id 
url/student_course/course/id: GET Method that returns student course with specific cid
url/student_course/student/id: GET Method that returns student course with specific tid 
url/student_course/add: POST Method that returns an added student course with JSON format
url/student_course/student/delete: DELETE Method that deletes specific student course with specific id cascaded
url/student_course/student/update: GET Method that updates student course with specific id 
