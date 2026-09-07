<div align="center">

🏗️ SQL Server Data Warehouse Project

Building a modern data warehouse with SQL Server and Medallion Architecture





</div>

📌 Project Overview

This project demonstrates the development of a modern Data Warehouse using SQL Server. Data is collected from CRM systems and flat files, then processed through the Bronze, Silver, and Gold layers to produce clean and business-ready data.

Objective

Combine data from multiple sources.

Clean and standardize raw data.

Build an analytical model using fact and dimension tables.

Prepare reliable data for reporting and business analysis.

🏛️ Data Architecture

The project follows the Medallion Architecture:

flowchart LR
    A["CRM & Files"] --> B["🥉 Bronze"]
    B --> C["🥈 Silver"]
    C --> D["🥇 Gold"]
    D --> E["📊 Reports"]

Layer

Purpose

🥉 Bronze

Stores raw data exactly as received from the sources.

🥈 Silver

Cleans, standardizes, and validates the data.

🥇 Gold

Creates fact and dimension tables for analytics.

⚙️ Project Workflow

Data Extraction — Extract data from CRM systems and files.

Data Loading — Load the raw data into the Bronze layer.

Data Cleansing — Fix missing values, duplicates, and formatting issues.

Data Transformation — Apply business rules and integrate the data.

Data Modeling — Build a star schema in the Gold layer.

Data Validation — Check data quality and correctness.

🛠️ Technologies Used

SQL Server — Database and data warehouse

T-SQL — ETL and transformation logic

SSMS — Database development and management

Git & GitHub — Version control and documentation

Draw.io — Architecture and data-model diagrams

📊 Analytics & Reporting

The Gold layer prepares the data for analyzing:

Customer behavior

Product performance

Sales trends

Key business metrics

The final model can be connected to Power BI or other reporting tools to support data-driven decision-making.

🌟 About Me

Hi! I'm Yousef Awwad, a developer interested in data engineering, SQL, and building practical software projects. This project is part of my journey to strengthen my skills in data warehousing and analytics.

