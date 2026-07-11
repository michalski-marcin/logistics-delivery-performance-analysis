-- =============================================
-- DELIVERY EVENTS - RAW TO CLEAN TRANSFORMATION
-- =============================================

CREATE TABLE dbo.delivery_events_clean
(
	event_id nvarchar(50) PRIMARY KEY,
	load_id	nvarchar(50),
	trip_id	nvarchar(50),
	event_type	nvarchar(50),
	facility_id	nvarchar(50),
	scheduled_datetime	datetime2,
	actual_datetime	datetime2,
	detention_minutes	int,
	on_time_flag	bit,
	location_city	nvarchar(50),
	location_state	nvarchar(50)
)

INSERT INTO dbo.delivery_events_clean
(
    event_id,
	load_id,
	trip_id,
	event_type,
	facility_id,
	scheduled_datetime,
	actual_datetime,
	detention_minutes,
	on_time_flag,
	location_city,
	location_state	
)
SELECT
    event_id,
	load_id,
	trip_id,
	event_type,
	facility_id,
	TRY_CONVERT(datetime2, scheduled_datetime),
	TRY_CONVERT(datetime2, actual_datetime), 
	detention_minutes, 
	on_time_flag,
	location_city,
	location_state
FROM dbo.delivery_events;

-- =============================================
-- LOADS TABLE
-- =============================================
