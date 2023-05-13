const express = require('express');

const studentController = require('../controller/student_controller');

const router = express.Router();

router.get('/all', studentController.getAllStudent);
router.get('/:id', studentController.getStudentById);
router.post('/add', studentController.addStudent);
router.delete('/delete/:id', studentController.deleteStudent);
router.put('/update/:id', studentController.updateStudent);


module.exports = router;