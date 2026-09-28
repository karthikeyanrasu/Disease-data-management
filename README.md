# Disease Management System — Healthcare Data Platform

## Project Overview

The Disease Management System is a healthcare data platform designed to organize healthcare information and support both operational and analytical use cases.

The project uses PostgreSQL and SQL to structure healthcare data, implement an analytical data warehouse, develop ETL workflows, and perform analytical queries on healthcare data.

## Objectives

- Build a structured relational database for healthcare data.
- Organize healthcare information for operational data management.
- Transform operational data into a format suitable for analytical reporting.
- Develop ETL workflows between the operational database and analytical warehouse.
- Perform SQL-based healthcare data analysis.
- Evaluate relational and NoSQL approaches for healthcare data management.
- Explore cloud-based data processing concepts for batch and real-time workloads.

## Data Model

The healthcare database includes information related to:

- Diseases
- Disease Types
- Patients
- Locations
- Races
- Hospitals
- Healthcare Providers
- Treatments
- Diagnostic Tests
- Insurance

The relational database was designed to maintain structured relationships between these healthcare entities and support consistent data management.

## Data Warehouse

A separate analytical warehouse was developed using a dimensional modeling approach.

The warehouse organizes healthcare data into fact and dimension structures to support analytical queries and reporting.

The dimensional model includes areas such as:

- Diagnosis
- Treatment
- Patient
- Disease
- Diagnostic Test
- Healthcare Provider
- Date

## ETL Process

The project includes SQL-based ETL workflows for moving data from the operational healthcare system into the analytical warehouse.

The ETL process involves:

1. Extracting data from the operational database.
2. Transforming data into an analytical structure.
3. Loading transformed data into the warehouse.
4. Using the warehouse for analytical queries and reporting.

```text
Operational Database
        │
        ▼
     Extract
        │
        ▼
    Transform
        │
        ▼
      Load
        │
        ▼
Analytical Data Warehouse
        │
        ▼
   SQL Analysis
        │
        ▼
 Reports & Insights
