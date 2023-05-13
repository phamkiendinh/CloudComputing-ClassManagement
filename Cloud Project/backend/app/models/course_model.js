const db = require('../database/connection');

const Course = function(course) {
    this.id = course.id;
    this.name = course.name;
    this.sid = course.sid;
    this.tid = course.tid;
}

Course.getAllCourse = async function (result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = 'SELECT * FROM course ORDER BY course.id ASC';
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.getCourseById = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM course WHERE course.id = ${id}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.getCourseByName = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM course WHERE course.cname = ${data.cname}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.addCourse = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var cname = data.cname;
    var query = `INSERT INTO course (cname) VALUES ('${cname}');`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.deleteCourse = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `DELETE FROM course WHERE course.id = ${id}`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.updateCourse = async function (id, data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var cname = data.cname;
    var query = `UPDATE course SET course.cname = '${cname}' WHERE course.id = ${id};`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.updateCourse = async function (id, data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var cname = data.cname;
    var query = `UPDATE course SET course.cname = '${cname}' WHERE course.id = ${id};`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Course.getTotalStudent = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `
    SELECT COUNT(sc.sid) AS totalStudent 
    FROM student_course as sc, course
    WHERE sc.cid = course.id AND course.id = ${id};
    `;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

module.exports = Course;