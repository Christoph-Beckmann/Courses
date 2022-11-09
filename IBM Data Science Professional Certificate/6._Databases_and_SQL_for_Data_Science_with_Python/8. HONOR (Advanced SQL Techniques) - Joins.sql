-- Assignment accessable: https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/Hands-on-lab-Joins.md.html?origin=www.coursera.org

-- Problem 1
-- List the case number, type of crime and community area for all crimes in community area number 18.

SELECT CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA CCD
INNER JOIN CENSUS_DATA CD
ON CD.COMMUNITY_AREA_NUMBER = 18;

-- Problem 2 
-- List all crimes that took place at a school. Include case number, crime type and community name.

SELECT CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME, CCD.LOCATION_DESCRIPTION
FROM CHICAGO_CRIME_DATA CCD
	LEFT JOIN CENSUS_DATA CD ON CCD.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE CCD.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

-- Problem 3
-- For the communities of Oakland, Armour Square, Edgewater and CHICAGO list the associated community_area_numbers and the case_numbers.
 
SELECT CCD.CASE_NUMBER, CCD.COMMUNITY_AREA_NUMBER, CD.COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA CCD
	FULL OUTER JOIN CENSUS_DATA CD ON CD.COMMUNITY_AREA_NUMBER = CCD.COMMUNITY_AREA_NUMBER
WHERE CD.COMMUNITY_AREA_NAME IN ('Oakland', 'Armour Square', 'Edgewater', 'Chicago');
