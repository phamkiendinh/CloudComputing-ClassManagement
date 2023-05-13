const db = require('../database/connection');

const Attendance = function(attendance) {
    this.days = attendance.days;
    this.sid = attendance.sid;
    this.tid = attendance.tid;
    this.present = attendance.present;
}

Attendance.addAttendance = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var date = data.date;
    var sid = data.sid;
    var tid = data.tid;
    var present = data.present;
    var query = `INSERT INTO attendance (days, sid, tid, present) VALUES ('${date}', ${sid}, ${tid}, ${present});`;
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

Attendance.getStudentAttendanceById = async function (id, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var query = `SELECT * FROM attendance WHERE attendance.sid = ${id};`;
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

Attendance.getAttendanceByDate = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var date = data.date;
    var query = `SELECT * FROM attendance WHERE attendance.days = '${date}';`;
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}


Attendance.getAttendanceByMonth = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var month = data.month;
    var query = `SELECT * FROM attendance WHERE MONTH(attendance.days) = '${month};'`;
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}


Attendance.getStudentAttendanceByDate = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var sid = data.sid;
    var date = data.date;
    var query = `SELECT * FROM attendance, student WHERE student.id = ${sid} and attendance.days = '${date}';`;
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

Attendance.getStudentAttendanceByWeek = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var date = data.date;
    var sid = data.sid;
    var query = `SELECT * FROM attendance,student WHERE student.id = ${sid} AND attendance.days >= CURDATE() - INTERVAL DAYOFWEEK(CURDATE()) - 1 DAY AND attendance.days <= CURDATE() - INTERVAL DAYOFWEEK(CURDATE()) - 7 DAY;`;
    if (date != null) {
        query = `SELECT * FROM attendance,student WHERE student.id = ${sid} AND attendance.days >= '${date}' - INTERVAL DAYOFWEEK('${date}') - 1 DAY AND attendance.days <= '${date}' - INTERVAL DAYOFWEEK('${date}') - 7 DAY;`;
    }
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

Attendance.getStudentAttendanceByMonth = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var date = data.date;
    var sid = data.sid;
    var query = `SELECT * FROM attendance, student where student.id = ${sid} AND MONTH(attendance.days) = MONTH(${date});`;
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

Attendance.getTeacherCourseStudentAttendanceByDate = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var date = data.date;
    var tid = data.tid;
    var cid = data.cid;
    var query = `    
    SELECT COUNT(attendance.present) AS totalPresentStudent
    FROM attendance, teacher_course AS tc, student_course AS sc
    WHERE attendance.days = "${date}" AND attendance.present = 1 AND sc.id = attendance.sid 
    AND attendance.tid = tc.id AND sc.cid = tc.cid 
    AND tc.id = ${tid} AND tc.cid = ${cid};
    `;
    console.log(query);
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

Attendance.getTeacherCourseStudentAbsentByDate = async function (data, result) {
    await db.getConnection((err, connection) => {
        if (err) {
            console.log(err);
        }
        connection.release();
    });
    var date = data.date;
    var tid = data.tid;
    var cid = data.cid;
    var query = `    
    SELECT COUNT(attendance.present) AS totalAbsentStudent
    FROM attendance, teacher_course AS tc, student_course AS sc
    WHERE attendance.days = "${date}" AND attendance.present = 0 AND sc.id = attendance.sid 
    AND attendance.tid = tc.id AND sc.cid = tc.cid 
    AND tc.id = ${tid} AND tc.cid = ${cid};
    `;
    console.log(query);
    db.query(query, (err, response) => {
        if (err) console.log(err);
        else result(response);
    });
}

module.exports = Attendance;