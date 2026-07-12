# 📦 Logistics Delivery Performance Analysis

<br/>

## Overview

This project analyzes logistics delivery data using SQL Server and Power BI.

The goal is to identify delivery delays, evaluate carrier performance, analyze transport routes, and find opportunities to improve delivery performance and reduce transportation costs.

The project follows a complete data analysis workflow:

- Data Discovery
- Data Quality Checks
- Data Cleaning & Transformation
- SQL Analysis
- Power BI Dashboard
- Business Recommendations

<br/>

## Business Problem

A logistics company wants to improve delivery performance and reduce transportation costs.

The company needs answers to questions such as:

- Which carriers generate the most delays?
- Which routes have the lowest on-time delivery rate?
- Which customers receive the most delayed deliveries?
- Are delays caused by late pickups or during transportation?
- Which routes generate the highest transportation costs?

<br/>

## Business Objectives

The main objectives of this project are:

- Measure on-time delivery performance.
- Compare carrier performance.
- Identify problematic routes.
- Analyze transportation costs.
- Find the main causes of delivery delays.
- Create recommendations to improve logistics operations.

<br/>

## Dataset

The project uses a logistics dataset containing information about customers, facilities, routes, shipments, trips and delivery events.

Main tables used:

- Customers
- Facilities
- Routes
- Loads
- Trips
- Delivery Events

<br/>

## Tech Stack

- SQL Server
- SQL
- Power BI
- Git
- GitHub

<br/>

## Project Workflow

```text
Raw Data
    │
    ▼
Data Discovery
    │
    ▼
Data Quality Checks
    │
    ▼
Data Cleaning & Transformation
    │
    ▼
SQL Analysis
    │
    ▼
Power BI Dashboard
    │
    ▼
Business Recommendations
```

<br/>

## Data Discovery

Before data preparation, the dataset was reviewed to understand table structure, relationships and possible data issues.

Initial findings:

- The dataset contains six main tables related to logistics operations.
- Delivery Events table contains shipment pickup and delivery timestamps.
- Some datetime fields were stored as text and required conversion.
- Tables will be cleaned and prepared before analysis.

<br/>

## Data Preparation

The raw data is kept unchanged.

Clean tables are created in SQL Server with:

- Correct data types.
- Required transformations.
- Data validation checks.

Example:

**Delivery Events**
- Converted scheduled and actual timestamps from text to datetime2.
- Created a clean table for delivery performance analysis.

<br/>

## SQL Analysis

Planned analysis:

- Delivery performance.
- Carrier performance.
- Route analysis.
- Customer service level.
- Transportation cost analysis.

<br/>

## Power BI Dashboard

Dashboard will include:

- On-time delivery KPIs.
- Carrier performance.
- Route performance.
- Delay analysis.
- Cost analysis.

*(Dashboard in progress)*

<br/>

## Business Insights

Insights will be added after completing the analysis.



## Recommendations

Recommendations will be based on SQL analysis and Power BI findings.

<br/>

## Repository Structure

```text
Logistics-SQL-Analysis/
│
├── README.md
│
├── 00_raw_data/
│   └── README.md
│
├── 01_data_discovery/
│   └── data_discovery.md
│
├── 02_sql/
│   ├── README.md
│   ├── 01_quality_checks.sql
│   ├── 02_clean_and_transform.sql
│   └── 03_01_operational_kpis.sql
│
├── 03_powerbi/
│
└── 04_screenshots/
```

