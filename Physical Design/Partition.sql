--Create a new table to allow for partitioning
CREATE TABLE attendance_Partition_Copy (
    attendance_id      INTEGER NOT NULL,
    attendance_date    DATE,
    student_student_id INTEGER NOT NULL,
    class_class_id     INTEGER NOT NULL
)
PARTITION BY RANGE (attendance_date) (
    PARTITION att_p1 VALUES LESS THAN (TO_DATE('2024-01-01','YYYY-MM-DD')),
    PARTITION att_p2 VALUES LESS THAN (TO_DATE('2025-01-01','YYYY-MM-DD')),
    PARTITION att_p3 VALUES LESS THAN (TO_DATE('2026-01-01','YYYY-MM-DD')),
    PARTITION att_p4 VALUES LESS THAN (TO_DATE('2027-01-01','YYYY-MM-DD'))
);
