PART 1:
YOU: GRANT SELECT ON emp TO hsun1;
YOUR FRIEND: SELECT * FROM hsun.emp;

PART 2:
YOU: GRANT UPDATE(dname), SELECT ON dept TO hsun1;
YOUR FRIEND: UPDATE hsun.dept SET dname = 'NewName' WHERE dnumber = 1; COMMIT;
YOU: SELECT * FROM dept;

PART 3:
YOU: REVOKE UPDATE ON dept FROM hsun1;
     REVOKE SELECT ON emp FROM hsun1;

YOUR FRIEND: SELECT * FROM hsun.emp;
             ERROR at line 1: ORA-00942: table or view does not exist

             UPDATE hsun.dept SET dname = 'NewName' WHERE dnumber = 1;
             ERROR at line 1: ORA-01031: insufficient privileges

PART 4:
YOU: CREATE ROLE users;
     GRANT SELECT ON emp TO users;
     GRANT SELECT ON dept TO users;
     GRANT users TO hsun1;

YOUR FRIEND: SELECT * FROM hsun.emp;
             SELECT * FROM hsun.dept;
             
     
PART 5:
YOU: CREATE VIEW employees AS
	 SELECT fname, lname, dname
	 FROM emp, dept
         WHERE dno = dnumber;
	
	 GRANT SELECT ON employees TO hsun1;

YOUR FRIEND: SELECT * FROM hsun.employees;

PART 6:
YOU: CREATE VIEW emp_salary AS
	 SELECT fname, lname, salary
	 FROM emp
	 WHERE salary <= 50000;
	
	 GRANT SELECT ON emp_salary TO hsun1;

YOUR FRIEND: SELECT * FROM hsun.emp_salary;
