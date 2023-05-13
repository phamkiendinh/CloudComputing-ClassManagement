const express = require('express');

const teacherController = require('../controller/teacher_controller');

const router = express.Router();

router.get('/all', teacherController.getAllTeacher);
router.get('/:id', teacherController.getTeacherById);
router.post('/add', teacherController.addTeacher);
router.delete('/delete/:id', teacherController.deleteTeacher);
router.put('/update/:id', teacherController.updateTeacher);


module.exports = router;