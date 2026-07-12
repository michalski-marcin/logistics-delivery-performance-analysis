-- RAW DATA CHECK

-- =============================================
-- DELIVERY EVENTS TABLE 
-- =============================================

-- Check if datetime conversion works

SELECT COUNT(*) AS invalid_dates
FROM dbo.delivery_events
WHERE TRY_CONVERT(datetime2, scheduled_datetime) IS NULL
   OR TRY_CONVERT(datetime2, actual_datetime) IS NULL;


-- Check on_time_flag values

SELECT on_time_flag, COUNT(*) AS records
FROM dbo.delivery_events
GROUP BY on_time_flag;


-- Check number of records

SELECT COUNT(*) AS total_records
FROM dbo.delivery_events;



-- =============================================
-- LOADS TABLE
-- =============================================

-- Check total loads

SELECT COUNT(*) AS total_loads
FROM dbo.loads;


-- Check for load_id duplicates

SELECT COUNT(load_id) AS all_loads, COUNT(DISTINCT load_id) 
FROM dbo.loads;


-- Check if decimal conversion works

SELECT COUNT(*) AS invalid
FROM dbo.loads
WHERE TRY_CONVERT(decimal(10, 2), revenue) IS NULL
   OR TRY_CONVERT(decimal(10, 2), fuel_surcharge) IS NULL;
      


-- =============================================
-- TRIPS TABLE
-- =============================================

-- Check for trip_id duplicates

SELECT COUNT(trip_id), COUNT(DISTINCT trip_id)
FROM trips;

-- Check if conversion works

SELECT COUNT(*) AS invalid
FROM dbo.trips
WHERE TRY_CONVERT(decimal(10, 2), actual_duration_hours) IS NULL
   OR TRY_CONVERT(decimal(10, 2), fuel_gallons_used) IS NULL
   OR TRY_CONVERT(decimal(10, 2), average_mpg) IS NULL
   OR TRY_CONVERT(decimal(10, 2), idle_time_hours) IS NULL;



-- =============================================
-- ROUTES TABLE
-- =============================================

-- Check primary key duplicates

SELECT COUNT(route_id), COUNT(DISTINCT route_id)
FROM routes;


-- Check conversion

SELECT COUNT(*) AS invalid
FROM dbo.routes
WHERE TRY_CONVERT(decimal(10, 2), base_rate_per_mile) IS NULL;



-- =============================================
-- FACILITIES TABLE
-- =============================================

-- Check Primary Key duplicates

SELECT COUNT(facility_id) AS all_facilities,
       COUNT(DISTINCT facility_id) AS unique_facilities
FROM dbo.facilities;


-- Check conversion

SELECT COUNT(*) AS invalid
FROM dbo.facilities
WHERE TRY_CONVERT(decimal(10,4), latitude) IS NULL
    OR TRY_CONVERT(decimal(10,4), longitude) IS NULL;



-- =============================================
-- CUSTOMERS TABLE
-- =============================================

-- Check Primary Key duplicates

SELECT COUNT(customer_id) AS all_customers,
       COUNT(DISTINCT customer_id) AS unique_customers
FROM dbo.customers;

