-- Building data
INSERT INTO building VALUES(1, 'Temple Prep Hall');

-- Course Data Entered via bulk insert

-- Faculty Data Entered via bulk insert

-- Advisor Data
Insert into advisor Values(5);
Insert into advisor Values(6);
Insert into advisor Values(10);

-- Teacher Data
Insert into Teacher Values(1);
Insert into Teacher Values(2);
Insert into Teacher Values(3);
Insert into Teacher Values(4);
Insert into Teacher Values(7);
Insert into Teacher Values(8);
Insert into Teacher Values(9);

-- Classroom Data entered via bulk insert

-- Class data entered via bulk insert

-- Student data entered via bulk insert

-- Enrollment data
Insert into enrollment values(1,1,101,'A-');
Insert into enrollment values(2,2,105,'C-');
Insert into enrollment values(3,3,108,'F');
Insert into enrollment values(4,4,110,'A');
Insert into enrollment values(5,5,107,'C+');
Insert into enrollment values(6,1,110,'A+');
Insert into enrollment values(7,2,104,'B-');

-- Schedule Data
Insert into schedule values(1,1,101);
Insert into schedule values(2,2,105);
Insert into schedule values(3,3,108);
Insert into schedule values(4,4,110);
Insert into schedule values(5,5,107);
Insert into schedule values(6,1,110);
Insert into schedule values(7,2,104);

-- Attendance data entered via bulk insert

-- Select * statements

select *
from advisor;

select * 
from attendance;

select * 
from building;

select *
from class;

select * 
from classroom;

select *
from course;

select *
from enrollment;

select *
from schedule;

select *
from faculty;

select *
from student;

select *
from teacher;


-- Joins and other kinds of select statements
-- Show the teachers
select *
from faculty inner join teacher on faculty.faculty_id = teacher.faculty_id;

-- Show the advisors
select *
from faculty inner join Advisor on faculty.faculty_id = advisor.faculty_id;

-- Show students and their classes
SELECT student_id,first_name, Last_name,schedule.class_class_id
FROM student INNER JOIN schedule ON student.student_id = schedule.Student_student_id;

-- Show student and thier classes and grades
Select First_name, Last_name,Class_class_id, Grade
from student inner join enrollment on student.student_id = enrollment.Student_student_id;

-- Show rooms in a buildings
select room_number as Room, Building_Name as Building
from classroom inner join building on classroom.building_building_id = building.building_id;

-- Show total number of courses offered
select count(course_id) as Total_Courses
from course;

-- Show attendance per class
Select First_Name, Last_Name,attendance_date,class_name
from student inner join attendance on student.student_id = attendance.student_student_id
inner join class on attendance.class_class_id = class.class_id;