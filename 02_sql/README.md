# SQL

This folder contains SQL scripts used throughout the data analysis process.

The SQL workflow covers:

- data validation,
- data cleaning and transformation,
- analytical queries for business insights.

<br/>

## Data Quality Checks

The purpose of data quality checks is to validate the raw dataset before analysis.

The checks include:

- record count validation,
- duplicate identifier checks,
- missing value detection,
- data type validation,
- conversion testing using `TRY_CONVERT()`,
- validation of transformation logic.

These checks help identify data issues before creating analytical tables.

<br/>

## Clean & Transform

The cleaning process prepares raw tables for analysis by:

- correcting incorrect data types,
- converting text values into numeric fields,
- converting timestamps into proper datetime formats,
- creating clean analytical tables,
- adding primary keys for unique record identification.

Created clean tables:

- `loads_clean`
- `trips_clean`
- `routes_clean`
- `facilities_clean`
- `delivery_events_clean`
- `customers_clean`

<br/>

## Analysis Queries

The analysis section contains SQL queries designed to answer business questions and generate insights.

Planned analysis areas:

- operational KPIs,
- customer performance,
- route analysis,
- delivery performance,
- dashboard queries for Power BI.

