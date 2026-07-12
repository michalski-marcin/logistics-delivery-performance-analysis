# Data Discovery - Logistics Dataset

### Overview

The dataset contains operational logistics data related to shipments, transportation, routes, facilities, customers, and delivery events.

The purpose of this step was to understand the raw data structure, identify data quality issues, and define transformations required before creating clean analytical tables.

<br/>

### Dataset Structure

| Table | Description |
|---|---|
| loads | Shipment details including revenue, weight, status and booking type |
| trips | Transportation data including distance, fuel usage and trip performance |
| routes | Route information including distance and pricing |
| facilities | Logistics locations and operational details |
| delivery_events | Pickup and delivery event tracking |
| customers | Customer information and account details |

<br/>

## Data Quality Findings

### loads

Issues:
- `revenue` and `fuel_surcharge` were stored as `nvarchar` instead of numeric values.

Transformation:
- `revenue` → `decimal(10,2)`
- `fuel_surcharge` → `decimal(10,2)`

<br/>

### trips

Issues:
- Operational metrics were imported as text.

Transformation:
- `actual_duration_hours` → `decimal(10,2)`
- `fuel_gallons_used` → `decimal(10,2)`
- `average_mpg` → `decimal(10,2)`
- `idle_time_hours` → `decimal(10,2)`

<br/>

### routes

Issues:
- `fuel_surcharge_rate` was incorrectly imported as `time`.

Example:
- Raw value: `00:19:00`
- Expected value: `0.19`

Transformation:
- Converted TIME values into decimal surcharge rates.
- `base_rate_per_mile` → `decimal(10,2)`

<br/>

### facilities

Issues:
- Geographic coordinates were stored as text.

Transformation:
- `latitude` → `decimal(10,4)`
- `longitude` → `decimal(10,4)`

<br/>

### delivery_events

Issues:
- Datetime columns required validation.

Transformation:
- `scheduled_datetime` → `datetime2`
- `actual_datetime` → `datetime2`

<br/>

### customers

Issues:
- No significant data quality issues identified.

The table structure was suitable for analytical purposes.

<br/>

## Cleaning Approach

The following steps were performed:

1. Reviewed raw table structures and sample records.
2. Identified incorrect data types and import issues.
3. Created clean tables with appropriate data types.
4. Applied required transformations.
5. Added primary keys.
6. Validated record counts and conversion results.

<br/>

## Result

The cleaned dataset is ready for:

- SQL analysis,
- KPI calculations,
- Power BI dashboard development.
