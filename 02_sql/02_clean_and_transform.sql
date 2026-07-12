-- RAW TO CLEAN TRANSFORMATION
-- =============================================
-- DELIVERY EVENTS 
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
-- LOADS
-- =============================================

CREATE TABLE dbo.loads_clean
(
    load_id nvarchar(50) PRIMARY KEY,
    customer_id nvarchar(50),
    route_id nvarchar(50),
    load_date date,
    load_type nvarchar(50),
    weight_lbs int,
    pieces int,
    revenue decimal(10,2),
    fuel_surcharge decimal(10,2),
    accessorial_charges int,
    load_status nvarchar(50),
    booking_type nvarchar(50)
);

INSERT INTO dbo.loads_clean
(
    load_id,
    customer_id,
    route_id,
    load_date,
    load_type,
    weight_lbs,
    pieces,
    revenue,
    fuel_surcharge,
    accessorial_charges,
    load_status,
    booking_type
)

SELECT
    load_id,
    customer_id,
    route_id,
    load_date,
    load_type,
    weight_lbs,
    pieces,
    TRY_CONVERT(decimal(10,2), revenue),
    TRY_CONVERT(decimal(10,2), fuel_surcharge),
    accessorial_charges,
    load_status,
    booking_type
FROM dbo.loads;


-- Compare RAW records with Clean table

SELECT COUNT(*) AS raw
FROM dbo.loads

SELECT COUNT(*) AS clean
FROM dbo.loads_clean;


-- Check Data Types

SELECT  column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'loads_clean';



