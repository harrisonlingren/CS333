use harrisonLingren

-- SELECT QUERIES

-- #1: Get all dates that are a Tuesday
select * from  Dates, Quarters where Day_of_week = 2

-- #2: FIND THE LOCATIONS AND AIRPORT_ID'S OF AIRPORTS IN GEORGIA USING A LEFT OUTER JOIN
SELECT Airport_id, Airports.City_name
	FROM Airports
	LEFT OUTER JOIN Cities
	ON Airports.City_name = Cities.City_name
	WHERE State_abr = 'GA'

-- #3: FIND THE LOCATIONS AND AIRPORT_ID'S OF AIRPORTS IN INDIANA USING A RIGHT OUTER JOIN
SELECT Airport_id, Airports.City_name
	FROM Airports
	RIGHT OUTER JOIN Cities
	ON Airports.City_name = Cities.City_name
	WHERE State_abr = 'IN'

-- #4: FIND THE LOCATIONS AND AIRPORT_IDS OF AIRPORTS IN NEVADA USING A LEFT OUTER JOIN
SELECT Airport_id, Airports.City_name
	FROM Airports
	LEFT OUTER JOIN Cities
	ON Airports.City_name = Cities.City_name
	WHERE State_abr = 'NV'

-- #5: FIND THE LOCATIONS AND AIRPORT_IDS OF AIRPORTS IN UTAH USING A RIGHT OUTER JOIN
SELECT Airport_id, Airports.City_name
	FROM Airports
	RIGHT OUTER JOIN Cities
	ON Airports.City_name = Cities.City_name
	WHERE State_abr = 'UT'

-- #6: FIND THE FLIGHT DESTINATIONS OF FLIGHTS LEAVING EACH STATE
SELECT DISTINCT State_abr FROM Cities, Airports, Flight_info
	WHERE Cities.City_name = Airports.City_name 
	AND Airports.Airport_id = Flight_info.Dest_airport_id 
	AND Flight_info.Dest_airport_id = Airports.Airport_id 
	AND Airports.City_name = Cities.City_name
ORDER BY State_abr

-- #7: FIND THE ORIGIN AIRPORT ID WITH THE CORRESPONDING DESTINATION AIRPORT ID
SELECT * FROM (SELECT Origin_airport_id, Dest_airport_id FROM Flight_info) AS A

--#8: FIND THE DESTINATION AIRPORT ID WITH THE AVERAGE DELAY FOR THE "F9" CARRIER WHEN THE AVERAGE DELAY IS ABOVE
SELECT Dest_airport_id, AVG(CAST(Arr_delay_new AS FLOAT)) AS OVERALL_AVG FROM Flight_info WHERE Unique_carrier = 'F9'
GROUP BY Dest_airport_id, Arr_delay_new
HAVING AVG(CAST(Arr_delay_new AS FLOAT)) > 100
ORDER BY OVERALL_AVG DESC

-- #9:FIND DAY OF MONTH AND CITY NAME FROM A TABLE WHICH GIVES YOU THE DAY OF MONTH, CITY NAME, AND THE DESTINATION STATE ABBREVIATION
SELECT DISTINCT B.DAY_OF_MONTH, B.City_name, B.State_abr FROM (
	SELECT DAY_OF_MONTH, A.City_name, A.State_abr FROM (
		SELECT DAY_OF_MONTH, Cities.City_name, Cities.State_abr, Dest_airport_id, Airports.Airport_id
		FROM Airports, Cities, Flight_info
		WHERE Airports.Airport_id = Dest_airport_id 
		) AS A
	) AS B
ORDER BY B.Day_of_month

-- #10: FIND DAY OF MONTH AND CITY NAME FROM A TABLE WHICH GIVES YOU THE DAY OF MONTH, CITY NAME, AND THE ORIGIN STATE ABBREVIATION
SELECT DISTINCT B.DAY_OF_MONTH, B.City_name, B.State_abr FROM (
	SELECT DAY_OF_MONTH, A.City_name, A.State_abr FROM (
		SELECT DAY_OF_MONTH, Cities.City_name, Cities.State_abr, Origin_airport_id, Airports.Airport_id
		FROM Airports, Cities, Flight_info
		WHERE Airports.Airport_id = Origin_airport_id 
		) AS A
	) AS B
ORDER BY B.Day_of_month



-- UPDATE QUERIES

-- Change city name from 'Aspen, CO' to 'Ashburn, CO'
update Cities
set City_name = 'Ashburn, CO', State_abr = 'CO'
from Airports, Cities
where Airports.City_name = Cities.City_name and Airports.Airport_id = '30372'



-- DELETE QUERIES

--DELETE ALL ROWS FROM FLIGHT DELAY INFO WHERE THE UNIQUE CARRIER IS 'F9'
DELETE FROM Flight_info WHERE UNIQUE_CARRIER = 'F9'