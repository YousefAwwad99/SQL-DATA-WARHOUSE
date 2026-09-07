<div align="center">
  <h1>🏗️ SQL Server Data Warehouse Project</h1>
  <p><strong>Building a modern data warehouse using SQL Server and Medallion Architecture</strong></p>

  <p>
    <img src="https://img.shields.io/badge/SQL%20Server-Data%20Warehouse-red?style=flat-square" alt="SQL Server">
    <img src="https://img.shields.io/badge/T--SQL-ETL-blue?style=flat-square" alt="T-SQL">
    <img src="https://img.shields.io/badge/Status-In%20Progress-yellow?style=flat-square" alt="Status">
  </p>
</div>

<hr>

<h2>📌 Project Overview</h2>

<p>
  This project demonstrates the development of a modern <strong>Data Warehouse using SQL Server</strong>.
  It collects data from CRM systems and flat files, then processes it through the
  <strong>Bronze, Silver, and Gold layers</strong> to produce clean and business-ready data.
</p>

<h3>Objective</h3>

<ul>
  <li>Combine data from multiple source systems.</li>
  <li>Clean and standardize raw data.</li>
  <li>Build fact and dimension tables using a star schema.</li>
  <li>Prepare reliable data for reporting and analytics.</li>
</ul>

<hr>

<h2>🏛️ Data Architecture</h2>

<p>The project follows the <strong>Medallion Architecture</strong>:</p>

<p align="center">
  <strong>CRM &amp; Files</strong> ➜ 🥉 <strong>Bronze</strong> ➜ 🥈 <strong>Silver</strong> ➜ 🥇 <strong>Gold</strong> ➜ 📊 <strong>Reports</strong>
</p>

<table>
  <thead>
    <tr>
      <th>Layer</th>
      <th>Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>🥉 <strong>Bronze</strong></td>
      <td>Stores raw data exactly as received from the sources.</td>
    </tr>
    <tr>
      <td>🥈 <strong>Silver</strong></td>
      <td>Cleans, standardizes, integrates, and validates the data.</td>
    </tr>
    <tr>
      <td>🥇 <strong>Gold</strong></td>
      <td>Creates fact and dimension tables for business analytics.</td>
    </tr>
  </tbody>
</table>

<hr>

<h2>⚙️ Project Workflow</h2>

<ol>
  <li><strong>Data Extraction:</strong> Extract data from CRM systems and files.</li>
  <li><strong>Data Loading:</strong> Load raw data into the Bronze layer.</li>
  <li><strong>Data Cleansing:</strong> Fix duplicates, missing values, and formatting issues.</li>
  <li><strong>Data Transformation:</strong> Apply business rules and integrate the data.</li>
  <li><strong>Data Modeling:</strong> Build a star schema in the Gold layer.</li>
  <li><strong>Data Validation:</strong> Verify data quality and correctness.</li>
</ol>

<hr>

<h2>🛠️ Technologies Used</h2>

<ul>
  <li><strong>SQL Server</strong> — Database and data warehouse</li>
  <li><strong>T-SQL</strong> — ETL and transformation logic</li>
  <li><strong>SSMS</strong> — Database development and management</li>
  <li><strong>Git &amp; GitHub</strong> — Version control and documentation</li>
  <li><strong>Draw.io</strong> — Architecture and data-model diagrams</li>
</ul>

<hr>

<h2>📊 Analytics &amp; Reporting</h2>

<p>The Gold layer prepares the data to analyze:</p>

<ul>
  <li>Customer behavior</li>
  <li>Product performance</li>
  <li>Sales trends</li>
  <li>Key business metrics</li>
</ul>

<p>
  The final model can be connected to <strong>Power BI</strong> or other reporting tools
  to support data-driven decision-making.
</p>

<hr>

<h2>🌟 About Me</h2>

<p>
  Hi! I'm <strong>Yousef Awwad</strong>, a developer interested in data engineering,
  SQL, and building practical software projects. This project is part of my journey
  to strengthen my skills in data warehousing and analytics.
</p>
