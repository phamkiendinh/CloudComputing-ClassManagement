var Teacher = require('../models/teacher_model');

function getAllTeacher(req, res) {
    Teacher.getAllTeacher(function (data) {
        res.send({result : data});
    });
}

function getTeacherById(req,res) {
    Teacher.getTeacherById(req.params.id, function (data) {
        res.send({result: data});
    });
}

function addTeacher(req,res) {
    var data = req.body;
    Teacher.addTeacher(data, function (result) {
        res.send({result: result});
    });
}

function deleteTeacher(req,res) {
    var id = req.params.id;
    Teacher.deleteTeacher(id, function (response) {
        res.send({result: response});
    });
}

function updateTeacher(req,res) {
    var id = req.params.id;
    Teacher.updateTeacher(id, req.body, function(response) {
        res.send({result: response});
    });
}


module.exports = {
    getTeacherById : getTeacherById,
    addTeacher : addTeacher, 
    deleteTeacher : deleteTeacher,    
    getAllTeacher : getAllTeacher,
    updateTeacher : updateTeacher,
}
