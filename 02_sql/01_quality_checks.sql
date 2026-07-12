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

SELECT 
    on_time_flag,
    COUNT(*) AS records
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
      



