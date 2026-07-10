-- =============================================
-- DELIVERY EVENTS - RAW DATA CHECK
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

