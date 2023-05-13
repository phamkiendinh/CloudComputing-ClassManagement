const express = require('express');

const teacherCourseController = require('../controller/teacher_course_controller');

const router = express.Router();


router.get('/most/teacher', teacherCourseController.getTeacherWithMostClass);
router.get('/all', teacherCourseController.getAllTeacherCourse);
router.get('/:id', teacherCourseController.getTeacherCourseById);
router.get('/course/:id', teacherCourseController.getTeacherByCourseId);
router.get('/teacher/:id', teacherCourseController.getCourseByTeacherId);
router.post('/add', teacherCourseController.addTeacherCourse);
router.delete('/delete/:id', teacherCourseController.deleteTeacherCourse);
router.put('/update', teacherCourseController.updateTeacherCourse);
router.get('/teacher/:tid/course/:cid/count', teacherCourseController.getTotalStudent);

module.exports = router;