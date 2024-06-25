-- Mentorness Internship Task 2: Hotel Reservation Data Analysis
-- Name: Shreyash Kumar
-- Batch: MIP-DA-10
-- Email: shreyashkumar207@gmail.com
-- Phone: +91 8093952349

-- Question 1: What is the total number of reservations in the dataset?
SELECT COUNT(*) AS total_reservations
FROM mentorness.hotel_data;

-- Ans: 700

-- Question 2: Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS meal_plan_count
FROM mentorness.hotel_data
GROUP BY type_of_meal_plan
ORDER BY meal_plan_count DESC
LIMIT 1;

-- Ans: Meal Plan 1 = 527

-- Question 3: What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS avg_price_including_children
FROM mentorness.hotel_data
WHERE no_of_children > 0;

-- Ans: 144.568

-- Question 4: How many reservations were made for the year 20XX?
SELECT COUNT(*) AS reservations_in_year
FROM mentorness.hotel_data
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%y')) = 2017;


-- Couldn't get this query to work,
-- Ans: 0

-- Question 5: What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(*) AS room_type_count
FROM mentorness.hotel_data
GROUP BY room_type_reserved
ORDER BY room_type_count DESC
LIMIT 1;

-- Ans: Room Type 1 was the most commonly booked room with 534 bookings.

-- Question 6: How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS weekend_reservations
FROM mentorness.hotel_data
WHERE no_of_weekend_nights > 0;

-- Ans: 383 Reservations

-- Question 7: What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS max_lead_time, MIN(lead_time) AS min_lead_time
FROM mentorness.hotel_data;

-- Ans: Higest=443, Lowest=0

-- Question 8: What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT(*) AS segment_count
FROM mentorness.hotel_data
GROUP BY market_segment_type
ORDER BY segment_count DESC
LIMIT 1;

-- Ans: Online segment is the most common with 518 records.

-- Question 9: How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS confirmed_reservations
FROM mentorness.hotel_data
WHERE booking_status = 'Not_Canceled';

-- Ans: 493 Confirmed Reservations.

-- Question 10: What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM mentorness.hotel_data;

-- Ans: Total Adults = 1316, Total Children = 69

-- Question 11: What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM mentorness.hotel_data
WHERE no_of_children > 0;

-- Ans: 1

-- Question 12: How many reservations were made in each month of the year?
SELECT MONTH(STR_TO_DATE(arrival_date, '%d-%m-%y')) AS month,
       COUNT(*) AS reservations_count
FROM mentorness.hotel_data
GROUP BY month
ORDER BY month;

-- Ans: 
-- Months : Reservatiion Count
-- 1		11
-- 2		28
-- 3		52
-- 4		67
-- 5		55
-- 6		84
-- 7		44
-- 8		70
-- 9		80
-- 10		103
-- 11		54
-- 12		52


-- Question 13: What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM mentorness.hotel_data
GROUP BY room_type_reserved;

-- Ans:
-- Room Types   : Average Total Nights Spent
-- Room_Type 1	: 2.8783
-- Room_Type 4	: 3.8000
-- Room_Type 2	: 3.0000
-- Room_Type 6	: 3.6111
-- Room_Type 5	: 2.5000
-- Room_Type 7	: 2.6667

-- Question 14: For reservations involving children, what is the most common room type, and what is the average price for that room type?
WITH children_reservations AS (
    SELECT room_type_reserved, AVG(avg_price_per_room) AS avg_price, COUNT(*) AS room_type_count
    FROM mentorness.hotel_data
    WHERE no_of_children > 0
    GROUP BY room_type_reserved
)
SELECT room_type_reserved, avg_price
FROM children_reservations
ORDER BY room_type_count DESC
LIMIT 1;

-- Ans: Most common room type = Room Type 1 and, Average Price = 123.122

-- Question 15: Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price
FROM mentorness.hotel_data
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;

-- Ans: Online Market generates highest price per room and that being 112.455




