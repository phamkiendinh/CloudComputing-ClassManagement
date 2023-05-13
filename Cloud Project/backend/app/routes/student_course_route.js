const express = require('express');

const studentCourseController = require('../controller/student_course_controller');

const router = express.Router();

router.get('/all', studentCourseController.getAllStudentCourse);
router.get('/:id', studentCourseController.getStudentCourseById);
router.get('/course/:id', studentCourseController.getStudentByCourseId);
router.get('/student/:id', studentCourseController.getCourseByStudentId);
router.post('/add', studentCourseController.addStudentCourse);
router.delete('/delete/:id', studentCourseController.deleteStudentCourse);
router.put('/update', studentCourseController.updateStudentCourse);


module.exports = router;