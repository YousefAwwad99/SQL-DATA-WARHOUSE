🏗️ SQL Server Data Warehouse

📌 About the Project

This project builds a modern Data Warehouse using SQL Server. It integrates data from CRM systems and flat files, then cleans and transforms it into analytics-ready data using the Medallion Architecture.

🏛️ Architecture

Data Sources ➜ Bronze Layer ➜ Silver Layer ➜ Gold Layer ➜ Reports

🥉 Bronze Layer

Stores raw data from source systems.

Uses full or incremental loading.

Keeps the original data for auditing.

🥈 Silver Layer

Cleans and standardizes the data.

Removes duplicates and handles missing values.

Applies business rules and data-quality checks.

🥇 Gold Layer

Creates fact and dimension tables.

Uses a star-schema model.

Prepares data for reporting and analysis.

⚙️ ETL Process

📥 Extract data from CRM systems and files.

🥉 Load raw data into the Bronze layer.

🧹 Clean and transform data in the Silver layer.

⭐ Build analytical models in the Gold layer.

✅ Validate data quality and correctness.

🛠️ Technologies

SQL Server

T-SQL

SQL Server Management Studio (SSMS)

Git & GitHub

Draw.io

🎯 Project Goals

Build a structured and scalable data warehouse.

Improve data quality and consistency.

Create business-ready data for reports and dashboards.

Practice ETL, data modeling, and SQL development.

👨‍💻 Author

Yousef Awwad
