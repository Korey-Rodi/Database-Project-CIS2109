CREATE TABLE advisor (
    faculty_id INTEGER NOT NULL
);

ALTER TABLE advisor ADD CONSTRAINT advisor_pk PRIMARY KEY ( faculty_id );

CREATE TABLE attendance (
    attendance_id      INTEGER NOT NULL,
    attendance_Date               DATE,
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL
);

ALTER TABLE attendance ADD CONSTRAINT attendance_pk PRIMARY KEY ( attendance_id );

CREATE TABLE building (
    building_id   INTEGER NOT NULL,  
    building_name VARCHAR2(25) NOT NULL

);

ALTER TABLE building ADD CONSTRAINT building_pk PRIMARY KEY ( building_id );

CREATE TABLE class (
    class_id           INTEGER NOT NULL,
    class_name         VARCHAR2(25) NOT NULL,
    capacity           INTEGER,
    start_time         TIMESTAMP,
    end_time           TIMESTAMP,
    day_of_week        VARCHAR2(7),
    classroom_room_id  INTEGER NOT NULL,
    course_course_id   INTEGER NOT NULL,
    teacher_faculty_id INTEGER NOT NULL
);

ALTER TABLE class ADD CONSTRAINT class_pk PRIMARY KEY ( class_id );

CREATE TABLE classroom (
    room_id              INTEGER NOT NULL,
    room_number          INTEGER,
    capacity             INTEGER,
    building_building_id INTEGER NOT NULL
);

ALTER TABLE classroom ADD CONSTRAINT classroom_pk PRIMARY KEY ( room_id );

CREATE TABLE course (
    course_id   INTEGER NOT NULL,
    course_name VARCHAR2(25) NOT NULL

);

ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY ( course_id );

CREATE TABLE enrollment (
    enrollment_id      INTEGER NOT NULL,
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL,
    grade              VARCHAR2(2)

);

ALTER TABLE enrollment ADD CONSTRAINT enrollment_pk PRIMARY KEY ( enrollment_id );

CREATE TABLE faculty (
    faculty_id INTEGER NOT NULL,
    first_name VARCHAR2(20),
    last_name  VARCHAR2(20),
    email      VARCHAR2(40),
    phone      VARCHAR2(15),
    role       VARCHAR2(7) NOT NULL
);

ALTER TABLE faculty
    ADD CONSTRAINT ch_inh_faculty CHECK ( role IN ( 'Advisor', 'Teacher' ) );

ALTER TABLE faculty ADD CONSTRAINT faculty_pk PRIMARY KEY ( faculty_id );

CREATE TABLE schedule (
    schedule_id        INTEGER NOT NULL,
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL
);

ALTER TABLE schedule
ADD CONSTRAINT schedule_unique UNIQUE (student_student_id, class_class_id);

ALTER TABLE schedule ADD CONSTRAINT schedule_pk PRIMARY KEY ( schedule_id );

CREATE TABLE student (
    student_id           INTEGER NOT NULL,
    first_name           VARCHAR2(20),
    last_name            VARCHAR2(20),
    date_of_birth        DATE,
    grade_level          INTEGER,
    email                VARCHAR2(40),
    phone                VARCHAR2(15),
    advisor_faculty_id   INTEGER
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( student_id );

CREATE TABLE teacher (
    faculty_id INTEGER NOT NULL
);

ALTER TABLE teacher ADD CONSTRAINT teacher_pk PRIMARY KEY ( faculty_id );

ALTER TABLE advisor
    ADD CONSTRAINT advisor_faculty_fk FOREIGN KEY ( faculty_id )
        REFERENCES faculty ( faculty_id );

ALTER TABLE attendance
    ADD CONSTRAINT attendance_class_fk FOREIGN KEY ( class_class_id )
        REFERENCES class ( class_id );

ALTER TABLE attendance
    ADD CONSTRAINT attendance_student_fk FOREIGN KEY ( student_student_id )
        REFERENCES student ( student_id );

ALTER TABLE class
    ADD CONSTRAINT class_classroom_fk FOREIGN KEY ( classroom_room_id )
        REFERENCES classroom ( room_id );

ALTER TABLE class
    ADD CONSTRAINT class_course_fk FOREIGN KEY ( course_course_id )
        REFERENCES course ( course_id );

ALTER TABLE class
    ADD CONSTRAINT class_teacher_fk FOREIGN KEY ( teacher_faculty_id )
        REFERENCES teacher ( faculty_id );

ALTER TABLE classroom
    ADD CONSTRAINT classroom_building_fk FOREIGN KEY ( building_building_id )
        REFERENCES building ( building_id );

ALTER TABLE enrollment
    ADD CONSTRAINT enrollment_class_fk FOREIGN KEY ( class_class_id )
        REFERENCES class ( class_id );

ALTER TABLE enrollment
    ADD CONSTRAINT enrollment_student_fk FOREIGN KEY ( student_student_id )
        REFERENCES student ( student_id );

ALTER TABLE schedule
    ADD CONSTRAINT schedule_class_fk FOREIGN KEY ( class_class_id )
        REFERENCES class ( class_id );

ALTER TABLE schedule
    ADD CONSTRAINT schedule_student_fk FOREIGN KEY ( student_student_id )
        REFERENCES student ( student_id );

ALTER TABLE student
    ADD CONSTRAINT student_advisor_fk FOREIGN KEY ( advisor_faculty_id )
        REFERENCES advisor ( faculty_id );

ALTER TABLE teacher
    ADD CONSTRAINT teacher_faculty_fk FOREIGN KEY ( faculty_id )
        REFERENCES faculty ( faculty_id );

CREATE OR REPLACE TRIGGER arc_fkarc_2_teacher BEFORE
    INSERT OR UPDATE OF faculty_id ON teacher
    FOR EACH ROW
DECLARE
    d VARCHAR2(7);
BEGIN
    SELECT
        a.role
    INTO d
    FROM
        faculty a
    WHERE
        a.faculty_id = :new.faculty_id;

    IF ( d IS NULL
         OR d <> 'Teacher' ) THEN
        raise_application_error(-20223, 'FK Teacher_Faculty_FK in Table Teacher violates Arc constraint on Table Faculty - discriminator column Role doesn''t have value ''Teacher'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_2_advisor BEFORE
    INSERT OR UPDATE OF faculty_id ON advisor
    FOR EACH ROW
DECLARE
    d VARCHAR2(7);
BEGIN
    SELECT
        a.role
    INTO d
    FROM
        faculty a
    WHERE
        a.faculty_id = :new.faculty_id;

    IF ( d IS NULL
         OR d <> 'Advisor' ) THEN
        raise_application_error(-20223, 'FK Advisor_Faculty_FK in Table Advisor violates Arc constraint on Table Faculty - discriminator column Role doesn''t have value ''Advisor'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/