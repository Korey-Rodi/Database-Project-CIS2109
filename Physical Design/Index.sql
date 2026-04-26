-- Attendance
CREATE INDEX idx_attendance_student 
ON attendance(student_student_id);

CREATE INDEX idx_attendance_class 
ON attendance(class_class_id);

-- Enrollment
CREATE INDEX idx_enrollment_student 
ON enrollment(student_student_id);

CREATE INDEX idx_enrollment_class 
ON enrollment(class_class_id);

-- Schedule table
CREATE INDEX idx_schedule_student 
ON schedule(student_student_id);

CREATE INDEX idx_schedule_class 
ON schedule(class_class_id);