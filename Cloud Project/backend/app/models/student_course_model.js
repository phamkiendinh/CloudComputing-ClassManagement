const db = require('../database/connection');

const StudentCourse = function(student_course) {
    this.id = student_course.id;
    this.sid = student_course.sid
    this.cid = student_course.cid;
}

StudentCourse.getStudentCourseById = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM student_course WHERE student_course.id = ${id}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

StudentCourse.getAllStudentCourse = async function (result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = 'SELECT * FROM student_course ORDER BY student_course.id ASC';
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

StudentCourse.getStudentByCourseId = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM student_course AS sc WHERE sc.cid = ${id}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

StudentCourse.getCourseByStudentId = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM student_course AS sc WHERE sc.sid = ${id}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

StudentCourse.addStudentCourse = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var sid = data.sid;
    var cid = data.cid;
    var query = `INSERT INTO student_course (sid,cid) VALUES ('${sid}','${cid}');`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

StudentCourse.deleteStudentCourse = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `DELETE FROM student_course AS sc WHERE sc.id = ${id}`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

StudentCourse.updateStudentCourse = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var id = data.id
    var sid = data.sid;
    var cid = data.cid;
    var query = `UPDATE student_course SET student_course.sid = '${sid}', student_course.cid = '${cid}' WHERE student_course.id = ${id};`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

module.exports = StudentCourse;