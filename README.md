SQL Server Data Warehouse Project

Overview

This project demonstrates the design and implementation of a modern data warehouse using SQL Server and the Medallion Architecture. Data is collected from CRM systems and flat files, then processed through the Bronze, Silver, and Gold layers to produce clean, consistent, and analytics-ready datasets.

The project covers the complete data-engineering workflow, including data extraction, loading, cleansing, transformation, validation, dimensional modeling, and documentation.

Project Objectives

Integrate data from multiple source systems into a centralized data warehouse.

Preserve raw source data for traceability and auditing.

Clean and standardize inconsistent data.

Apply business rules and data-quality checks.

Build fact and dimension tables using a star schema.

Prepare reliable datasets for reporting, dashboards, and business analysis.

Data Architecture

The solution follows the Medallion Architecture and is divided into three layers:

flowchart LR
    A["CRM System"] --> C["Bronze Layer"]
    B["Flat Files"] --> C
    C --> D["Silver Layer"]
    D --> E["Gold Layer"]
    E --> F["Reports & Analytics"]

Bronze Layer — Raw Data

The Bronze layer stores data exactly as received from the source systems.

Extracts data from CRM systems and flat files.

Loads data using full or incremental loading strategies.

Preserves the original structure and values.

Adds technical metadata such as the load timestamp and source name.

Provides a reliable historical record for auditing and reprocessing.

Silver Layer — Cleaned Data

The Silver layer improves data quality and consistency.

Explores and profiles the source data.

Removes duplicate records.

Handles missing and invalid values.

Corrects data types and formatting issues.

Standardizes names, codes, dates, and other attributes.

Applies business rules and data-quality validations.

Integrates related data from different sources.

Gold Layer — Business-Ready Data

The Gold layer provides structured data optimized for reporting and analytics.

Builds fact and dimension tables.

Uses dimensional modeling and a star schema.

Creates business-friendly measures and attributes.

Supports KPIs, dashboards, and analytical queries.

Improves query performance for reporting tools.

ETL Process

Extract: Read data from CRM systems and flat files.

Load to Bronze: Store the source data without business transformations.

Transform to Silver: Clean, standardize, validate, and integrate the data.

Transform to Gold: Create fact and dimension tables for analytics.

Validate: Compare record counts, verify relationships, and check business rules.

Data Model

The Gold layer follows a star-schema design that may include:

Fact tables: Store measurable business events such as sales, orders, or transactions.

Dimension tables: Store descriptive information such as customers, products, locations, and dates.

Surrogate keys: Provide stable warehouse identifiers independent of source-system keys.

Historical tracking: Preserve selected changes in dimension records when required.

Technologies Used

SQL Server

T-SQL

SQL Server Management Studio (SSMS)

Git and GitHub

Draw.io for architecture and data-flow diagrams

Power BI or another reporting tool for future analytics

Repository Structure

data-warehouse-project/
├── datasets/        # Source data files
├── docs/            # Architecture, data model, and documentation
├── scripts/
│   ├── bronze/      # Bronze-layer loading scripts
│   ├── silver/      # Data-cleansing and transformation scripts
│   └── gold/        # Fact and dimension creation scripts
├── tests/           # Data-quality and validation queries
└── README.md        # Project documentation

How to Run the Project

Install SQL Server and SQL Server Management Studio.

Clone this repository:

git clone <your-repository-url>

Open the SQL scripts in SSMS.

Run the database initialization scripts first.

Execute the Bronze-layer scripts to load the source data.

Execute the Silver-layer scripts to clean and standardize the data.

Execute the Gold-layer scripts to build the analytical model.

Run the validation queries to confirm data quality and correctness.

Update the file paths and database connection settings before running the loading scripts.

Data Quality Checks

The project includes checks for:

Duplicate primary and business keys

Missing or invalid values

Incorrect data types and formats

Invalid date ranges

Referential-integrity problems

Record-count differences between layers

Violations of business rules

Key Skills Demonstrated

Data-warehouse architecture

ETL pipeline development

Data cleansing and transformation

Data-quality validation

Dimensional modeling

Star-schema design

SQL performance and maintainability

Git-based version control and documentation

Author

Yousef Awwad

This project was created as a practical implementation of data-warehouse concepts using SQL Server
