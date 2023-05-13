const db = require('../database/connection');

const Teacher = function(teacher) {
    this.id = teacher.id;
    this.lname = teacher.lname;
    this.fname = teacher.fname;
    this.cid = teacher.cid;
}

Teacher.getAllTeacher = async function (result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = 'SELECT * FROM teacher ORDER BY teacher.id ASC';
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });

}

Teacher.getTeacherById = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM teacher WHERE teacher.id = ${id}`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Teacher.addTeacher = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var lname = data.lname;
    var fname = data.fname;
    var query = `INSERT INTO teacher (fname,lname) VALUES ('${lname}','${fname}');`;
    db.query(query, (err, data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Teacher.deleteTeacher = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `DELETE FROM teacher WHERE teacher.id = ${id}`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

Teacher.updateTeacher = async function (id, data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var lname = data.lname;
    var fname = data.fname;
    var query = `UPDATE teacher SET teacher.lname = '${lname}', teacher.fname = '${fname}' WHERE teacher.id = ${id};`;
    db.query(query, (err,data) => {
        if (err) console.log(err);
        else result(data);
    });
}

module.exports = Teacher;