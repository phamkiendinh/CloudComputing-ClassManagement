var Student = require('../models/student_model');

function getAllStudent(req, res) {
    Student.getAllStudent(function (data) {
        res.send({result : data});
    });
}

function getStudentById(req,res) {
    Student.getStudentById(req.params.id, function (data) {
        res.send({result: data});
    });
}

function addStudent(req,res) {
    var data = req.body;
    Student.addStudent(data, function (result) {
        res.send({result: result});
    });
}

function deleteStudent(req,res) {
    var id = req.params.id;
    Student.deleteStudent(id, function (response) {
        res.send({result: response});
    });
}

function updateStudent(req,res) {
    var id = req.params.id;
    Student.updateStudent(id, req.body, function(response) {
        res.send({result: response});
    });
}


module.exports = {
    getStudentById : getStudentById,
    addStudent : addStudent, 
    deleteStudent : deleteStudent,    
    getAllStudent : getAllStudent,
    updateStudent : updateStudent,
}
