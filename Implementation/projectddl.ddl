-- 1. BUILDING
CREATE TABLE building (
    building_id   INTEGER PRIMARY KEY,
    building_name VARCHAR2(100) NOT NULL
);

-- 2. FACULTY
CREATE TABLE faculty (
    faculty_id     INTEGER PRIMARY KEY,
    first_name     VARCHAR2(50) NOT NULL,
    last_name      VARCHAR2(50) NOT NULL,
    email          VARCHAR2(100),
    phone          VARCHAR2(15),
    role           VARCHAR2(50)
);

-- 3. STUDENT
CREATE TABLE student (
    student_id         INTEGER PRIMARY KEY,
    first_name         VARCHAR2(50) NOT NULL,
    last_name          VARCHAR2(50) NOT NULL,
    date_of_birth      DATE,
    grade_level        INTEGER,
    email              VARCHAR2(100),
    phone              VARCHAR2(15),
    faculty_faculty_id INTEGER NOT NULL,
    CONSTRAINT student_faculty_fk FOREIGN KEY (faculty_faculty_id)
        REFERENCES faculty(faculty_id)
);

-- 4. CLASSROOM
CREATE TABLE classroom (
    room_id              INTEGER PRIMARY KEY,
    room_number          VARCHAR2(20),
    capacity             INTEGER,
    building_building_id INTEGER NOT NULL,
    CONSTRAINT classroom_building_fk FOREIGN KEY (building_building_id)
        REFERENCES building(building_id)
);

-- 5. CLASS
CREATE TABLE class (
    class_id            INTEGER PRIMARY KEY,
    class_name          VARCHAR2(100) NOT NULL,
    capacity            INTEGER,
    start_time          TIMESTAMP,
    end_time            TIMESTAMP,
    day_of_week         VARCHAR2(20),
    classroom_room_id   INTEGER NOT NULL,
    faculty_faculty_id  INTEGER NOT NULL,
    CONSTRAINT class_classroom_fk FOREIGN KEY (classroom_room_id)
        REFERENCES classroom(room_id),
    CONSTRAINT class_faculty_fk FOREIGN KEY (faculty_faculty_id)
        REFERENCES faculty(faculty_id)
);

-- 6. ENROLLMENT
CREATE TABLE enrollment (
    enrollment_id      INTEGER PRIMARY KEY,
    semester           VARCHAR2(20),
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL,
    CONSTRAINT enrollment_student_fk FOREIGN KEY (student_student_id)
        REFERENCES student(student_id),
    CONSTRAINT enrollment_class_fk FOREIGN KEY (class_class_id)
        REFERENCES class(class_id)
);

-- 7. ATTENDANCE
CREATE TABLE attendance (
    attendance_id      INTEGER PRIMARY KEY,
    attendance_date    DATE,
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL,
    CONSTRAINT attendance_student_fk FOREIGN KEY (student_student_id)
        REFERENCES student(student_id),
    CONSTRAINT attendance_class_fk FOREIGN KEY (class_class_id)
        REFERENCES class(class_id)
);

-- 8. GRADE
CREATE TABLE grade (
    grade_id           INTEGER PRIMARY KEY,
    semester           VARCHAR2(20),
    gpa                NUMBER(3,2),
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL,
    CONSTRAINT grade_student_fk FOREIGN KEY (student_student_id)
        REFERENCES student(student_id),
    CONSTRAINT grade_class_fk FOREIGN KEY (class_class_id)
        REFERENCES class(class_id)
);
