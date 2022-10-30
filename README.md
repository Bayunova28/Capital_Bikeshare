# Capital Bikeshare
<img src="https://github.com/Bayunova28/Capital_Bikeshare/blob/master/cover.jpg" height="450" width="1100">

## Background
<p align="justify">Capital Bikeshare, like other bikeshare systems, consists of a fleet of specially designed, sturdy and durable bikes that are locked into a network of 
docking stations throughout the region. The bikes can be unlocked from any station and returned to any station in the system, making them ideal for one-way trips. 
People use bikeshare to commute to work or school, run errands, get to appointments or social engagements and more. Capital Bikeshare is available for use 24 hours a day,
7 days a week, 365 days a year. Riders have access to a bike at any station across the system. Bike sharing systems are new generation of traditional bike rentals where 
whole process from membership, rental and return back has become automatic. Through these systems, user is able to easily rent a bike from a particular position and 
return back at another position. Currently, there are about over 500 bike-sharing programs around the world which is composed of over 500 thousands bicycles and exists great interest in these systems due to their important role in traffic, environmental and health issues.</p>

## Dashboard By Casual User
<img src="https://github.com/Bayunova28/Capital_Bikeshare/blob/master/by Casual.jpg" height="600" width="1100">

## Dashboard By Registered User
<img src="https://github.com/Bayunova28/Capital_Bikeshare/blob/master/By Registered.jpg" height="600" width="1100">

## Data Analysis Expressions (DAX) Calculation
### Additional Table & Columns
* Calendar Rental Date
```
Calendar Rental Date = 
SUMMARIZECOLUMNS(RentalBikeSharing[Rental_Date])
```
* Month Name
```
Month_Name = 
FORMAT(DATE(1, 'Calendar Rental Date'[Month_Number], 1), "mmm")
```
* Month Number
```
Month_Number = 
MONTH('Calendar Rental Date'[Rental_Date])
```
* Year Month
```
Year_Month = 
'Calendar Rental Date'[Year_Number] * 100 & 'Calendar Rental Date'[Month_Number]
```
* Year Number
```
Year_Number = 
YEAR('Calendar Rental Date'[Rental_Date])
```
* Year Month Text
```
Year_Month_Text = 
'Calendar Rental Date'[Month_Name] & " " & FORMAT('Calendar Rental Date'[Rental_Date], "yy")
```
* Rental Holiday
```
Rental Holiday = 
SWITCH(
    TRUE(),
    RentalBikeSharing[Holiday] = 0, "No Holiday",
    "Holiday"
)
```
* Rental Season
```
Rental Season = 
SWITCH(
    TRUE(),
    RentalBikeSharing[Season] = 1, "Winter",
    RentalBikeSharing[Season] = 2, "Spring",
    RentalBikeSharing[Season] = 3, "Summer",
    "Fall"
)
```
* Rental Weather
```
Rental Weather = 
SWITCH(
    TRUE(),
    RentalBikeSharing[Weather_Sit] = 1, "Clear",
    RentalBikeSharing[Weather_Sit] = 2, "Cloudy",
    "Light Rain"
)
```
* Rental Weekday
```
Rental Weekday = 
SWITCH(
    TRUE(),
    RentalBikeSharing[Weekday] = 0, "Monday",
    RentalBikeSharing[Weekday] = 1, "Tuesday",
    RentalBikeSharing[Weekday] = 2, "Wednesday",
    RentalBikeSharing[Weekday] = 3, "Thursday",
    RentalBikeSharing[Weekday] = 4, "Friday",
    RentalBikeSharing[Weekday] = 5, "Saturday",
    "Sunday"
)
```
### Calculations
* Average Casual User
```
Avg Casual User = 
CALCULATE(AVERAGE(RentalBikeSharing[Casual]))
```
* Average Registered User
```
Avg Registered User = 
CALCULATE(AVERAGE(RentalBikeSharing[Registered]))
```
* Holiday Casual
```
Holiday Casual = 
var Result = CALCULATE([Total Casual User],RentalBikeSharing[Rental Holiday] = "Holiday")
return IF(ISBLANK(Result),0,Result)
```
* Holiday Registered
```
Holiday Registered = 
var Result = CALCULATE([Total Registered User],RentalBikeSharing[Rental Holiday] = "Holiday")
return IF(ISBLANK(Result),0,Result)
```
* Holiday Rental 
```
Holiday Registered = 
var Result = CALCULATE([Total Registered User],RentalBikeSharing[Rental Holiday] = "Holiday")
return IF(ISBLANK(Result),0,Result)
```
* No Holiday Registered
```
No Holday Registered = 
var Result = CALCULATE([Total Registered User],RentalBikeSharing[Rental Holiday] = "No Holiday")
return IF(ISBLANK(Result),0,Result)
```
* No Holiday Casual
```
No Holiday Casual = 
var Result = CALCULATE([Total Casual User],RentalBikeSharing[Rental Holiday] = "No Holiday")
return IF(ISBLANK(Result),0,Result)
```
* No Rental Rental 
```
No Holiday Rental = 
var Result = CALCULATE([Total Rental Bikes],RentalBikeSharing[Rental Holiday] = "No Holiday")
return IF(ISBLANK(Result),0,Result)
```
* Total Casual User
```
Total Casual User = 
CALCULATE(SUM(RentalBikeSharing[Casual]))
```
* Total Registered User
```
Total Registered User = 
CALCULATE(SUM(RentalBikeSharing[Registered]))
```
* Total Rental Bikes
```
Total Rental Bikes = 
CALCULATE(SUM(RentalBikeSharing[Count]))
```
## Acknowledgement
Original Source : [Capital Bikeshare System](http://capitalbikeshare.com/system-data)
