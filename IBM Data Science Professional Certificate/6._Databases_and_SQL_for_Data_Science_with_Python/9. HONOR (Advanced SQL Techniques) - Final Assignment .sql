--Databases and SQL for Data Science with Python: Week 6 Bonus Module: Advanced SQL for Data Engineer (Honors): Final Project: Advanced SQL Techniques

-- Final Assignment is accessable under: https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/FinalProject_BonusModule.md.html?origin=www.coursera.org

-- _________________________________________________________________

-- Exercise 1: Using Join 

-- Question 1.1 
-- Write and execute a SQL query to list the school names, community names 
-- and average attendance for communities with a hardship index of 98.

SELECT CPS.NAME_OF_SCHOOL, CD.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE
FROM CHICAGO_PUBLIC_SCHOOLS CPS
	INNER JOIN CENSUS_DATA CD ON CD.COMMUNITY_AREA_NUMBER = CPS.COMMUNITY_AREA_NUMBER 
WHERE CD.HARDSHIP_INDEX = 98;

-- Question 1.2 
-- Write and execute a SQL query to list all crimes that took place at a school. 
-- Include case number, crime type and community name.
SELECT CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME, CCD.LOCATION_DESCRIPTION
FROM CHICAGO_CRIME_DATA CCD
	FULL OUTER JOIN CENSUS_DATA CD ON CD.COMMUNITY_AREA_NUMBER = CCD.COMMUNITY_AREA_NUMBER 
WHERE CCD.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

-- _________________________________________________________________

-- Exercise 2: Creating a View 
-- Question 2.1 
-- Write and execute a SQL statement to create a view showing the columns 
-- listed in the following table, with new column names as shown in the second column.

DROP VIEW PRIVATE_VIEW;

CREATE VIEW PRIVATE_VIEW
	(
		School_Name,
		Safety_Rating, 
		Family_Rating,
		Environment_Rating,
		Instruction_Rating,
		Leaders_Rating,
		Teachers_Rating
	)
	AS SELECT 
		NAME_OF_SCHOOL,
		Safety_Icon,
		Family_Involvement_Icon,
		Environment_Icon,
		Instruction_Icon,
		Leaders_Icon,
		Teachers_Icon
FROM CHICAGO_PUBLIC_SCHOOLS;
	
-- Question 2.2 
-- Write and execute a SQL statement that returns all of the columns from the view.
SELECT * FROM PRIVATE_VIEW;

-- Question 2.3 
-- Write and execute a SQL statement that returns just the school name 
-- and leaders rating from the view.
SELECT School_Name, Leaders_Rating FROM PRIVATE_VIEW;

-- _________________________________________________________________

-- Exercise 3: Creating a Stored Procedure 

-- Question 3.1 
-- Write the structure of a query to create or replace a stored procedure 
-- called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and
-- a in_Leader_Score parameter as an integer. Don't forget to use the #SET TERMINATOR 
-- statement to use the @ for the CREATE statement terminator.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE_EXAMPLE       -- Name of this stored procedure routine

LANGUAGE SQL                        -- Language used in this routine 
READS SQL DATA                      -- This routine will only read data from the table

DYNAMIC RESULT SETS 1               -- Maximum possible number of result-sets to be returned to the caller query

BEGIN 

    DECLARE cur CURSOR               -- CURSOR C1 will handle the result-set by retrieving records row by row from the table
    WITH RETURN FOR                 -- This routine will return retrieved records as a result-set to the caller query
    
    SELECT SCHOOL_ID, LEADERS_SCORE FROM CHICAGO_PUBLIC_SCHOOLS;          -- Query to retrieve all the records from the table
    
    OPEN cur;                        -- Keeping the CURSOR C1 open so that result-set can be returned to the caller query

END
@                                   -- Routine termination character

CALL UPDATE_LEADERS_SCORE_EXAMPLE
@

-- Question 3.2 
-- Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the 
-- CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID to the value in the in_Leader_Score parameter.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE(IN in_School_ID INTEGER, IN in_Leaders_Score INTEGER)       -- Name of this stored procedure routine
LANGUAGE SQL                        	-- Language used in this routine
MODIFIES SQL DATA                      -- This routine can modify data from the table

BEGIN 

	UPDATE CHICAGO_PUBLIC_SCHOOLS
	SET LEADERS_SCORE = in_Leaders_Score
	WHERE SCHOOL_ID = in_School_ID;

-- Question 3.3
-- Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the 
-- CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID using the following information.

	IF in_Leaders_Score > 0 AND in_Leaders_Score < 20 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET LEADERS_ICON = 'VERY_WEAK'
		WHERE SCHOOL_ID = in_School_ID;

	ELSEIF in_Leaders_Score < 40 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET LEADERS_ICON = 'WEAK'
		WHERE SCHOOL_ID = in_School_ID;

	ELSEIF in_Leaders_Score < 60 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET LEADERS_ICON = 'AVERAGE'
		WHERE SCHOOL_ID = in_School_ID;

	ELSEIF in_Leaders_Score < 80 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET LEADERS_ICON = 'STRONG'
		WHERE SCHOOL_ID = in_School_ID;

	ELSEIF in_Leaders_Score < 100 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET LEADERS_ICON = 'VERY_STRONG'
		WHERE SCHOOL_ID = in_School_ID;

-- _________________________________________________________________

-- Exercise 4: Using Transactions 

-- Question 4.1 
-- Update your stored procedure definition. Add a generic ELSE clause to the IF statement 
-- that rolls back the current work if the score did not fit any of the preceding categories.

	ELSE ROLLBACK WORK;
	END IF;

-- Question 4.2 
-- Update your stored procedure definition again. 
-- Add a statement to commit the current unit of work at the end of the procedure.

	COMMIT WORK;
END
@    

-- Question 3.4
-- Run your code to create the stored procedure.
-- Write a query to call the stored procedure, passing a valid school ID and a leader score of 50, to check that the procedure works as expected.

--#SET TERMINATOR ;

-- IMPORTANT: The column "LEADERS_ICON" has to be changed to be able to insert a value, see for this: 3.4
ALTER TABLE CHICAGO_PUBLIC_SCHOOLS ALTER COLUMN LEADERS_ICON SET DATA TYPE VARCHAR(11);

CALL UPDATE_LEADERS_SCORE(610038, 50);
