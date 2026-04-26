CREATE USER clerk IDENTIFIED BY "02GsaG0FtmTCKbiiRJhT";
GRANT CREATE SESSION TO clerk;

GRANT SELECT ON project.student TO clerk;
GRANT SELECT ON project.faculty TO clerk;
GRANT SELECT ON project.class TO clerk;
GRANT SELECT ON project.enrollment TO clerk;
GRANT SELECT ON project.attendance TO clerk;
GRANT SELECT ON project.schedule TO clerk;
GRANT SELECT ON project.course TO clerk;
GRANT SELECT ON project.classroom TO clerk;
GRANT SELECT ON project.building TO clerk;
GRANT SELECT ON project.advisor TO clerk;
GRANT SELECT ON project.teacher TO clerk;

create user manager identified by n67na3hoo85jGJhqDkYV;
grant create session to manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON project.student TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON fproject.aculty TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.class TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.enrollment TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.attendance TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.schedule TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.course TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.classroom TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.building TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.advisor TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.teacher TO manager;

create user developer identified by "7qjBiL23mD3qx0WGMhyF";
grant create session to developer;

GRANT SELECT, INSERT, UPDATE, DELETE ON project.student TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.faculty TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.class TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.enrollment TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.attendance TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.schedule TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.course TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.classroom TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.building TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.advisor TO developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON project.teacher TO developer;

GRANT CREATE TABLE TO developer;
GRANT CREATE VIEW TO developer;
GRANT CREATE PROCEDURE TO developer;