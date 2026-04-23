CREATE USER clerk IDENTIFIED BY clerk123;
CREATE USER manager IDENTIFIED BY manager123;
CREATE USER developer IDENTIFIED BY dev123;

GRANT CREATE SESSION TO clerk;
GRANT CREATE SESSION TO manager;
GRANT CREATE SESSION TO developer;

GRANT SELECT ON Project.advisor TO clerk;
GRANT SELECT ON Project.attendance TO clerk;
GRANT SELECT ON Project.building TO clerk;
GRANT SELECT ON Project.class TO clerk;
GRANT SELECT ON Project.classroom TO clerk;
GRANT SELECT ON Project.course TO clerk;
GRANT SELECT ON Project.enrollment TO clerk;
GRANT SELECT ON Project.faculty TO clerk;
GRANT SELECT ON Project.schedule TO clerk;
GRANT SELECT ON Project.student TO clerk;
GRANT SELECT ON Project.teacher TO clerk;

GRANT SELECT, INSERT, UPDATE, DELETE ON Project.advisor TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.attendance TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.building TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.class TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.classroom TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.course TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.enrollment TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.faculty TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.schedule TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.student TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.teacher TO manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON Project.advisor TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.attendance TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.building TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.class TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.classroom TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.course TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.enrollment TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.faculty TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.schedule TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.student TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project.teacher TO developer;

GRANT CREATE TABLE TO developer;
GRANT CREATE VIEW TO developer;
GRANT CREATE PROCEDURE TO developer;