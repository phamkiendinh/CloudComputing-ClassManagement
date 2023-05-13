const express = require('express');

const attendanceController = require('../controller/attendance_controller');

const router = express.Router();

router.post('/add', attendanceController.addAttendance);
router.get('/student/:id', attendanceController.getStudentAttendanceById);
router.post('/student/:id/date', attendanceController.getStudentAttendanceByDate);
router.post('/student/:id/week', attendanceController.getStudentAttendanceByWeek);
router.post('/student/:id/month', attendanceController.getStudentAttendanceByMonth);
router.post('/all/date', attendanceController.getAttendanceByDate);
router.post('/all/month', attendanceController.getAttendanceByMonth);
router.post('/teacher_course/absent', attendanceController.getTeacherCourseStudentAbsentByDate);
router.post('/teacher_course/present', attendanceController.getTeacherCourseStudentAttendanceByDate);


module.exports = router;