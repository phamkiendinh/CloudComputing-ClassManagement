USE production;
DROP TABLE IF EXISTS attendance; 
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teacher;  
DROP TABLE IF EXISTS course; 
DROP TABLE IF EXISTS teacher_course;
DROP TABLE IF EXISTS student_course;
CREATE TABLE course (
	id	INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE student (
	id	int NOT NULL AUTO_INCREMENT,
    lname VARCHAR(255) NOT NULL,
    fname VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE teacher (
	id	int PRIMARY KEY AUTO_INCREMENT,
    lname VARCHAR(255) NOT NULL,
    fname VARCHAR(255) NOT NULL
);

CREATE TABLE teacher_course (
	id int PRIMARY KEY AUTO_INCREMENT,
    tid int NOT NULL,
    cid int NOT NULL,
    CONSTRAINT FK_TEACHER_COURSE_TEACHER_ID FOREIGN KEY (tid) REFERENCES teacher (id) ON DELETE CASCADE,
	CONSTRAINT FK_TEACHER_COURSE_COURSE_ID FOREIGN KEY (cid) REFERENCES course(id) ON DELETE CASCADE
);

CREATE TABLE student_course (
	id int PRIMARY KEY AUTO_INCREMENT,
    sid int NOT NULL,
    cid int NOT NULL,
    CONSTRAINT FK_STUDENT_COURSE_STUDENT_ID FOREIGN KEY (sid) REFERENCES student(id) ON DELETE CASCADE,
	CONSTRAINT FK_STUDENT_COURSE_COURSE_ID FOREIGN KEY (cid) REFERENCES course(id) ON DELETE CASCADE
);

CREATE TABLE attendance (
	days DATE NOT NULL,
    sid INT,
    tid INT,
    present BOOLEAN NOT NULL,
    CONSTRAINT FK_STUDENT_ATTENDANCE_ID FOREIGN KEY (sid) REFERENCES student (id) ON DELETE CASCADE,
	CONSTRAINT FK_TEACHER_ATTENDANCE_ID FOREIGN KEY (tid) REFERENCES teacher (id) ON DELETE CASCADE
);

-- Course Insertion 
INSERT INTO course (cname) VALUES ('Biology');
INSERT INTO course (cname) VALUES ('Physics');
INSERT INTO course (cname) VALUES ('Psychology');
INSERT INTO course (cname) VALUES ('Information Technology');
INSERT INTO course (cname) VALUES ('Assasin');
INSERT INTO course (cname) VALUES ('Cooking');
INSERT INTO course (cname) VALUES ('Baking');
INSERT INTO course (cname) VALUES ('Gaming');

-- Student Insertion 
INSERT INTO student (lname,fname) VALUES ('Anna', 'Faliteria');
INSERT INTO student (lname,fname) VALUES ('Farha', 'Angelica');
INSERT INTO student (lname,fname) VALUES ('Josh', 'Yasou');
INSERT INTO student (lname,fname) VALUES  ('John','Paul');
INSERT INTO student (lname,fname) VALUES  ('Akali','Buck');
INSERT INTO student (lname,fname) VALUES  ('Veronica','James');
INSERT INTO student (lname,fname) VALUES  ('James','Bond');
INSERT INTO student (lname,fname) VALUES  ('John','Paulo');

-- Teacher Insertion 
INSERT INTO teacher (lname,fname) VALUES ('Harvard', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('New York', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('Best', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('Funny', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('Cute', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('Runner', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('Rainer', 'Teacher');
INSERT INTO teacher (lname,fname) VALUES ('Eren', 'Teacher');

-- Teacher Course Insertion 
INSERT INTO teacher_course (tid,cid) VALUES (1,1);
INSERT INTO teacher_course (tid,cid) VALUES (1,3);
INSERT INTO teacher_course (tid,cid) VALUES (2,4);
INSERT INTO teacher_course (tid,cid) VALUES (2,6);
INSERT INTO teacher_course (tid,cid) VALUES (3,7);
INSERT INTO teacher_course (tid,cid) VALUES (3,8);
INSERT INTO teacher_course (tid,cid) VALUES (4,2);
INSERT INTO teacher_course (tid,cid) VALUES (4,3);
INSERT INTO teacher_course (tid,cid) VALUES (5,5);
INSERT INTO teacher_course (tid,cid) VALUES (5,6);
INSERT INTO teacher_course (tid,cid) VALUES (6,1);
INSERT INTO teacher_course (tid,cid) VALUES (6,3);
INSERT INTO teacher_course (tid,cid) VALUES (7,7);
INSERT INTO teacher_course (tid,cid) VALUES (8,2);
INSERT INTO teacher_course (tid,cid) VALUES (11,6);
INSERT INTO teacher_course (tid,cid) VALUES (10,3);
INSERT INTO teacher_course (tid,cid) VALUES (13,1);
INSERT INTO teacher_course (tid,cid) VALUES (15,3);
INSERT INTO teacher_course (tid,cid) VALUES (18,6);
INSERT INTO teacher_course (tid,cid) VALUES (3,4);
INSERT INTO teacher_course (tid,cid) VALUES (4,1);
INSERT INTO teacher_course (tid,cid) VALUES (5,7);

-- Student Course Insertion 
INSERT INTO student_course (sid,cid) VALUES (1,1);
INSERT INTO student_course (sid,cid) VALUES (1,3);
INSERT INTO student_course (sid,cid) VALUES (2,4);
INSERT INTO student_course (sid,cid) VALUES (2,6);
INSERT INTO student_course (sid,cid) VALUES (3,7);
INSERT INTO student_course (sid,cid) VALUES (3,8);
INSERT INTO student_course (sid,cid) VALUES (4,2);
INSERT INTO student_course (sid,cid) VALUES (4,3);
INSERT INTO student_course (sid,cid) VALUES (5,5);
INSERT INTO student_course (sid,cid) VALUES (5,6);
INSERT INTO student_course (sid,cid) VALUES (6,1);
INSERT INTO student_course (sid,cid) VALUES (6,3);
INSERT INTO student_course (sid,cid) VALUES (7,7);
INSERT INTO student_course (sid,cid) VALUES (8,2);

-- Attendance Insertion 
INSERT INTO attendance VALUES ('2023-04-01',1,1,TRUE);
INSERT INTO attendance VALUES ('2023-04-02',2,2,TRUE);
INSERT INTO attendance VALUES ('2023-04-03',3,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-04',2,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-5',2,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-6',3,1,TRUE);
INSERT INTO attendance VALUES ('2023-03-7',2,2,FALSE);
INSERT INTO attendance VALUES ('2023-03-8',3,1,FALSE);
INSERT INTO attendance VALUES ('2023-02-28',5,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-01',1,3,TRUE);
INSERT INTO attendance VALUES ('2023-04-02',5,2,TRUE);
INSERT INTO attendance VALUES ('2023-04-06',6,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-06',7,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-13',2,8,FALSE);
INSERT INTO attendance VALUES ('2023-04-24',1,4,TRUE);
INSERT INTO attendance VALUES ('2023-03-21',5,5,FALSE);
INSERT INTO attendance VALUES ('2023-03-29',6,6,FALSE);
INSERT INTO attendance VALUES ('2023-02-24',3,7,FALSE);
INSERT INTO attendance VALUES ('2023-05-01',7,8,TRUE);
INSERT INTO attendance VALUES ('2023-06-02',2,2,TRUE);
INSERT INTO attendance VALUES ('2023-05-06',3,6,FALSE);
INSERT INTO attendance VALUES ('2023-04-06',5,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-23',2,7,FALSE);
INSERT INTO attendance VALUES ('2023-04-24',3,6,TRUE);
INSERT INTO attendance VALUES ('2023-03-21',2,5,FALSE);
INSERT INTO attendance VALUES ('2023-03-30',3,1,FALSE);
INSERT INTO attendance VALUES ('2023-02-28',5,3,FALSE);
INSERT INTO attendance VALUES ('2023-04-10',1,1,TRUE);
INSERT INTO attendance VALUES ('2023-04-12',5,6,TRUE);
INSERT INTO attendance VALUES ('2023-04-16',6,1,FALSE);
INSERT INTO attendance VALUES ('2023-04-16',7,2,FALSE);
INSERT INTO attendance VALUES ('2023-04-13',2,4,FALSE);
INSERT INTO attendance VALUES ('2023-04-24',1,3,TRUE);
INSERT INTO attendance VALUES ('2023-03-21',5,2,FALSE);
INSERT INTO attendance VALUES ('2023-03-29',6,3,FALSE);
INSERT INTO attendance VALUES ('2023-02-24',3,8,FALSE);
