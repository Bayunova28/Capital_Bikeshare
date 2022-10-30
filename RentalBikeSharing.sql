-- Load rental bike sharing dataset
SELECT *
FROM Government..RentalBikeSharing;

-- Looking duplicate values
SELECT ID
FROM Government..RentalBikeSharing
GROUP BY ID
HAVING COUNT(ID) > 1;

-- Looking duplicate values on ID 17379
SELECT *
FROM Government..RentalBikeSharing
WHERE ID = 17379;

-- Remove one duplicate value
WITH rental_duplicates
     AS (SELECT ID, 
                ROW_NUMBER() OVER(PARTITION BY ID
                ORDER BY ID) AS rownumber
         FROM Government..RentalBikeSharing)
     DELETE FROM rental_duplicates
     WHERE rownumber > 1;

-- Looking average casual user bike by monthly and weather
SELECT CASE Month
           WHEN 1
           THEN 'Jan'
           WHEN 2
           THEN 'Feb'
           WHEN 3
           THEN 'Mar'
           WHEN 4
           THEN 'Apr'
           WHEN 5
           THEN 'May'
           WHEN 6
           THEN 'Jun'
           WHEN 7
           THEN 'Jul'
           WHEN 8
           THEN 'Aug'
           WHEN 9
           THEN 'Sep'
           WHEN 10
           THEN 'Oct'
           WHEN 11
           THEN 'Nov'
           WHEN 12
           THEN 'Dec'
       END AS Month,
       CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Casual), 2) AS avg_casual_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Month, 
         Weather_Sit
ORDER BY avg_casual_user;

-- Looking average casual user by daily and weather
SELECT CASE Weekday
           WHEN 0
           THEN 'Monday'
           WHEN 1
           THEN 'Tuesday'
           WHEN 2
           THEN 'Wednesday'
           WHEN 3
           THEN 'Thursday'
           WHEN 4
           THEN 'Friday'
           WHEN 5
           THEN 'Satudrday'
           WHEN 6
           THEN 'Sunday'
       END AS Weekday,
       CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Casual), 2) AS avg_casual_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Weekday, 
         Weather_Sit
ORDER BY avg_casual_user;

-- Looking average casual user by season and weather
SELECT CASE Season
           WHEN 1
           THEN 'Winter'
           WHEN 2
           THEN 'Spring'
           WHEN 3
           THEN 'Summer'
           WHEN 4
           THEN 'Fall'
       END AS Season,
       CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Casual), 2) AS avg_casual_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Season, 
         Weather_Sit
ORDER BY avg_casual_user DESC;

-- Looking average casual user by weather
SELECT CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Casual), 2) AS avg_casual_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Weather_Sit
ORDER BY avg_casual_user DESC;

-- Looking average registered user by monthly and weather
SELECT CASE Month
           WHEN 1
           THEN 'Jan'
           WHEN 2
           THEN 'Feb'
           WHEN 3
           THEN 'Mar'
           WHEN 4
           THEN 'Apr'
           WHEN 5
           THEN 'May'
           WHEN 6
           THEN 'Jun'
           WHEN 7
           THEN 'Jul'
           WHEN 8
           THEN 'Aug'
           WHEN 9
           THEN 'Sep'
           WHEN 10
           THEN 'Oct'
           WHEN 11
           THEN 'Nov'
           WHEN 12
           THEN 'Dec'
       END AS Month,
       CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Registered), 2) AS avg_registered_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Month, 
         Weather_Sit
ORDER BY avg_registered_user DESC;

-- Looking average registered user by daily and weather
SELECT CASE Weekday
           WHEN 0
           THEN 'Monday'
           WHEN 1
           THEN 'Tuesday'
           WHEN 2
           THEN 'Wednesday'
           WHEN 3
           THEN 'Thursday'
           WHEN 4
           THEN 'Friday'
           WHEN 5
           THEN 'Saturday'
           WHEN 6
           THEN 'Sunday'
       END AS Weekday,
       CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Registered), 2) AS avg_registered_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Weekday, 
         Weather_Sit
ORDER BY avg_registered_user DESC;

-- Looking average registered user by season and weather
SELECT CASE Season
           WHEN 1
           THEN 'Winter'
           WHEN 2
           THEN 'Spring'
           WHEN 3
           THEN 'Summer'
           WHEN 4
           THEN 'Fall'
       END AS Season,
       CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Registered), 2) AS avg_registered_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Season, 
         Weather_Sit
ORDER BY avg_registered_user DESC;

-- Looking average registered user by weather
SELECT CASE Weather_Sit
           WHEN 1
           THEN 'Clear'
           WHEN 2
           THEN 'Cloudy'
           WHEN 3
           THEN 'Light Rain'
       END AS Weather_Sit, 
       ROUND(AVG(Registered), 2) AS avg_registered_user
FROM Government..RentalBikeSharing
WHERE Weather_Sit <> 4
GROUP BY Weather_Sit
ORDER BY avg_registered_user DESC;

