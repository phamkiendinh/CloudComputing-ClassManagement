var Course = require('../models/course_model');

function getAllCourse(req, res) {
    Course.getAllCourse(function (data) {
        res.send({result : data});
    });
}

function getCourseById(req,res) {
    Course.getCourseById(req.params.id, function (data) {
        res.send({result: data});
    });
}

function addCourse(req,res) {
    var data = req.body;
    Course.addCourse(data, function (result) {
        res.send({result: result});
    });
}

function deleteCourse(req,res) {
    var id = req.params.id;
    Course.deleteCourse(id, function (response) {
        res.send({result: response});
    });
}

function updateCourse(req,res) {
    var id = req.params.id;
    Course.updateCourse(id, req.body, function(response) {
        res.send({result: response});
    });
}

function getTotalStudent(req,res) {
    var id = req.params.id;
    Course.getTotalStudent(id, function (response) {
        res.send({result: response});
    });
}

function getCourseByName(req,res) {
    Course.getCourseByName(req.body, function (data) {
        res.send({result: data});
    });
}

module.exports = {
    getCourseById : getCourseById,
    addCourse : addCourse, 
    deleteCourse : deleteCourse,    
    getAllCourse : getAllCourse,
    updateCourse : updateCourse,
    getTotalStudent : getTotalStudent,
    getCourseByName : getCourseByName,
}
