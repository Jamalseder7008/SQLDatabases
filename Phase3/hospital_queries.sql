--1. Find all nurses (their names) with a salary greater than $85,000.
SELECT N_NAME 
FROM NURSE
WHERE N_SALARY > 85000;

--2. Find all the “surgery” (for the specialty) physicians and sort the query output by names (any direction).
SELECT *
FROM PHYSICIAN
WHERE d_specialty = 'Surgery'
ORDER BY D_NAME;

--3. Find all physicians with medicine in their specialty name (hint: remember the LIKE operator and case sensitivity).
SELECT *
FROM PHYSICIAN
WHERE lower(D_SPECIALTY) LIKE lower('%medicine');

--4. Find all nurses who do not have a supervisor.
SELECT *
FROM NURSE
WHERE SUPERVISOR_ID IS NULL;

--5. Find the names of all nurses with a salary between $70,000 and $80,000 (inclusive).
SELECT N_NAME
FROM NURSE 
WHERE N_SALARY BETWEEN 70000 AND 80000;

--6. Find the names of the physicians who have a specialty containing “ology”.
SELECT D_NAME
FROM PHYSICIAN 
WHERE D_SPECIALTY LIKE ('%ology');

--7. Find the minimum and maximum salaries amongst all nurses. Use only one query.
SELECT MIN(N_SALARY), MAX(N_SALARY)
FROM NURSE;

--8. Find the average salary for all nurses.
SELECT AVG(N_SALARY)
FROM NURSE;

--9. Find the name of the nurse that has the highest salary. 
--Do not hardcode any salaries or other values – you must use SQL without assuming you know the current database snapshot.
SELECT N_NAME
FROM NURSE 
WHERE N_SALARY = (
                SELECT MAX(N_SALARY)
                FROM NURSE
);
    
--10. Find the nurses with a salary less than the average overall salary for all nurses + 20% (i.e., less than 1.2 * average salary). 
--Do not hardcode any salaries or other values – you must use SQL without assuming you know the current database snapshot.
SELECT *
FROM NURSE 
WHERE N_SALARY < 1.20*(
                SELECT AVG(N_SALARY)
                FROM NURSE
);