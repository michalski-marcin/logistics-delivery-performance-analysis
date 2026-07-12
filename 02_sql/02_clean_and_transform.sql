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


-- =============================================
-- TRIPS
-- =============================================

CREATE TABLE dbo.trips_clean
(
trip_id nvarchar(50) PRIMARY KEY,
load_id nvarchar(50),
driver_id nvarchar(50),
truck_id nvarchar(50),
trailer_id nvarchar(50),
dispatch_date date,
actual_distance_miles int,
actual_duration_hours decimal(10,2),
fuel_gallons_used decimal(10,2),
average_mpg decimal(10,2),
idle_time_hours decimal(10,2),
trip_status nvarchar(50),
);


INSERT INTO dbo.trips_clean
(
trip_id,
load_id,
driver_id,
truck_id,
trailer_id,
dispatch_date,
actual_distance_miles,
actual_duration_hours,
fuel_gallons_used,
average_mpg,
idle_time_hours,
trip_status
)

SELECT
    trip_id,
    load_id,
    driver_id,
    truck_id,
    trailer_id,
    dispatch_date,
    actual_distance_miles,
    TRY_CONVERT(decimal(10 ,2), actual_duration_hours),
    TRY_CONVERT(decimal(10 ,2), fuel_gallons_used),
    TRY_CONVERT(decimal(10 ,2), average_mpg),
    TRY_CONVERT(decimal(10 ,2), idle_time_hours),
    trip_status
FROM dbo.trips;


-- Compare RAW with Clean table

SELECT COUNT(*) AS raw
FROM dbo.trips

SELECT COUNT(*) AS clean
FROM dbo.trips_clean;


-- Check Data Types

SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'trips_clean'


-- =============================================
-- ROUTES TABLE
-- =============================================

CREATE TABLE dbo.routes_clean
(
    route_id nvarchar(50) PRIMARY KEY,
    origin_city nvarchar(50),
    origin_state nvarchar(10),
    destination_city nvarchar(50),
    destination_state nvarchar(10),
    typical_distance_miles int,
    base_rate_per_mile decimal(10,2),
    fuel_surcharge_rate decimal(10,2),
    typical_transit_days int
);

INSERT INTO dbo.routes_clean
(
    route_id,
    origin_city,
    origin_state,
    destination_city,
    destination_state,
    typical_distance_miles,
    base_rate_per_mile,
    fuel_surcharge_rate,
    typical_transit_days
)

SELECT
    route_id,
    origin_city,
    origin_state,
    destination_city,
    destination_state,
    typical_distance_miles,
    TRY_CONVERT(decimal(10, 2), base_rate_per_mile),
    DATEPART(MINUTE, fuel_surcharge_rate) / 100.0,
    typical_transit_days
FROM dbo.routes;


-- Compare RAW with Clean

SELECT COUNT(*) AS raw
FROM dbo.routes

SELECT COUNT(*) AS clean
FROM dbo.routes_clean;


-- Check Data Types

SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'routes_clean';
