const db = require('../database/connection');

const Student = function(student) {
    this.id = student.id;
    this.lname = student.lname;
    this.fname = student.fname;
    this.cid = student.cid;
}

Student.getAllStudent = async function (result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = 'SELECT * FROM student ORDER BY student.id ASC';
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Student.getStudentById = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM student WHERE student.id = ${id}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Student.addStudent = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var lname = data.lname;
    var fname = data.fname;
    var query = `INSERT INTO student (fname,lname) VALUES ('${lname}','${fname}');`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Student.deleteStudent = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `DELETE FROM student WHERE student.id = ${id}`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Student.updateStudent = async function (id, data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var lname = data.lname;
    var fname = data.fname;
    var query = `UPDATE student SET student.lname = '${lname}', student.fname = '${fname}' WHERE student.id = ${id};`;   
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

module.exports = Student;