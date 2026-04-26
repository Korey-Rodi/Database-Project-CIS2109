-- Manager Privileges


-- Pass
Select * from project.student;

INSERT INTO project.building VALUES(2,'test');

-- FAIL
Create table test (
    testcol integer not null
);
    