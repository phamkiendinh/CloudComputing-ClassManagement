var TeacherCourse = require('../models/teacher_course_model');

function getTeacherCourseById(req, res) {
    var id = req.params.id;
    TeacherCourse.getTeacherCourseById(id, function (data) {
        res.send({result : data});
    });
}


function getAllTeacherCourse(req, res) {
    TeacherCourse.getAllTeacherCourse(function (data) {
        res.send({result : data});
    });
}

function getTeacherByCourseId(req,res) {
    TeacherCourse.getTeacherByCourseId(req.params.id, function (data) {
        res.send({result: data});
    });
}

function getCourseByTeacherId(req,res) {
    TeacherCourse.getCourseByTeacherId(req.params.id, function (data) {
        res.send({result: data});
    });
}

function addTeacherCourse(req,res) {
    var data = req.body;
    TeacherCourse.addTeacherCourse(data, function (result) {
        res.send({result: result});
    });
}

function deleteTeacherCourse(req,res) {
    var id = req.params.id;
    TeacherCourse.deleteTeacherCourse(id, function (response) {
        res.send({result: response});
    });
}

function updateTeacherCourse(req,res) {
    TeacherCourse.updateTeacherCourse(req.body, function(response) {
        res.send({result: response});
    });
}

function getTotalStudent(req,res) {
    var teacherID = req.params.tid;
    var courseID = req.params.cid;
    TeacherCourse.getTotalStudent(teacherID, courseID, function(response) {
        res.send({result: response});
    });
}

function getTeacherWithMostClass(req,res) {
    TeacherCourse.getTeacherWithMostClass(function(response) {
        res.send({result: response});
    });
}

module.exports = {
    getAllTeacherCourse : getAllTeacherCourse,
    getTeacherByCourseId : getTeacherByCourseId, 
    addTeacherCourse : addTeacherCourse,    
    deleteTeacherCourse : deleteTeacherCourse,
    updateTeacherCourse : updateTeacherCourse,
    getCourseByTeacherId : getCourseByTeacherId,
    getTeacherCourseById : getTeacherCourseById,
    getTotalStudent : getTotalStudent,
    getTeacherWithMostClass: getTeacherWithMostClass,
}
