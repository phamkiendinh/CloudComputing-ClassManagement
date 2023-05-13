var StudentCourse = require('../models/student_course_model');

function getStudentCourseById(req, res) {
    StudentCourse.getStudentCourseById(req.params.id, function (data) {
        res.send({result : data});
    });
}

function getAllStudentCourse(req, res) {
    StudentCourse.getAllStudentCourse(function (data) {
        res.send({result : data});
    });
}

function getStudentByCourseId(req,res) {
    StudentCourse.getStudentByCourseId(req.params.id, function (data) {
        res.send({result: data});
    });
}

function getCourseByStudentId(req,res) {
    StudentCourse.getCourseByStudentId(req.params.id, function (data) {
        res.send({result: data});
    });
}

function addStudentCourse(req,res) {
    var data = req.body;
    StudentCourse.addStudentCourse(data, function (result) {
        res.send({result: result});
    });
}

function deleteStudentCourse(req,res) {
    var id = req.params.id;
    StudentCourse.deleteStudentCourse(id, function (response) {
        res.send({result: response});
    });
}

function updateStudentCourse(req,res) {
    StudentCourse.updateStudentCourse(req.body, function(response) {
        res.send({result: response});
    });
}


module.exports = {
    getAllStudentCourse : getAllStudentCourse,
    getStudentByCourseId : getStudentByCourseId, 
    getCourseByStudentId : getCourseByStudentId,    
    addStudentCourse : addStudentCourse,
    updateStudentCourse : updateStudentCourse,
    deleteStudentCourse : deleteStudentCourse,
    getStudentCourseById :getStudentCourseById,
}
