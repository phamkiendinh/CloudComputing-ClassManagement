var Attendance = require('../models/attendance_model');


function addAttendance(req, res) {
    var data = req.body;
    Attendance.addAttendance(data, function (result) {
        res.send({result : result});
    });
}

function getAttendanceByDate(req, res) {
    var data = req.body;
    Attendance.getAttendanceByDate(data, function (result) {
        res.send({result : result});
    });
}

function getAttendanceByMonth(req,res) {
    var data = req.body;
    Attendance.getAttendanceByMonth(data, function (response) {
        res.send({result: response});
    });
}

function getStudentAttendanceByDate(req,res) {
    var data = req.body;
    Attendance.getStudentAttendanceByDate(data, function (response) {
        res.send({result: response});
    });
}

function getStudentAttendanceByWeek(req,res) {
    var data = req.body;
    Attendance.getStudentAttendanceByWeek(data, function (response) {
        res.send({result: response});
    });
}

function getStudentAttendanceByMonth(req,res) {
    var data = req.body;
    Attendance.getStudentAttendanceByMonth(data, function(response) {
        res.send({result: response});
    });
}

function getStudentAttendanceById(req,res) {
    var sid = req.params.id;
    Attendance.getStudentAttendanceById(sid, function(response) {
        res.send({result: response});
    });
}

function getTeacherCourseStudentAttendanceByDate(req,res) {
    Attendance.getTeacherCourseStudentAttendanceByDate(req.body, function(response) {
        res.send({result: response});
    });
}

function getTeacherCourseStudentAbsentByDate(req,res) {
    Attendance.getTeacherCourseStudentAbsentByDate(req.body, function(response) {
        res.send({result: response});
    });
}

module.exports = {
    addAttendance : addAttendance, 
    getAttendanceByDate : getAttendanceByDate,
    getAttendanceByMonth : getAttendanceByMonth, 
    getStudentAttendanceByDate : getStudentAttendanceByDate,    
    getStudentAttendanceByWeek : getStudentAttendanceByWeek,
    getStudentAttendanceByMonth : getStudentAttendanceByMonth,
    getStudentAttendanceById : getStudentAttendanceById,
    getTeacherCourseStudentAttendanceByDate : getTeacherCourseStudentAttendanceByDate,
    getTeacherCourseStudentAbsentByDate : getTeacherCourseStudentAbsentByDate
}
