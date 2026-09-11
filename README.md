<div align="center">
  <h1>🏗️ SQL Server Data Warehouse Project</h1>

  <p>
    <strong>
      Integrating CRM and ERP data using SQL Server
      and Medallion Architecture
    </strong>
  </p>

  <p>
    <img
      src="https://img.shields.io/badge/SQL%20Server-Data%20Warehouse-red?style=flat-square"
      alt="SQL Server"
    >
    <img
      src="https://img.shields.io/badge/T--SQL-ETL-blue?style=flat-square"
      alt="T-SQL"
    >
    <img
      src="https://img.shields.io/badge/Data%20Model-Star%20Schema-gold?style=flat-square"
      alt="Star Schema"
    >
  </p>
</div>

<hr>

<h2>📌 Project Overview</h2>

<p>
  This project builds a <strong>SQL Server data warehouse</strong>
  that combines customer, product, and sales data from
  <strong>CRM and ERP source files</strong>.
</p>

<p>
  Data passes through the <strong>Bronze, Silver, and Gold layers</strong>,
  turning raw source data into a structured model for reporting
  and business analysis.
</p>

<ul>
  <li>Load data from multiple sources.</li>
  <li>Clean and standardize customer, product, and sales records.</li>
  <li>Integrate related CRM and ERP data.</li>
  <li>Build customer and product dimensions linked to sales facts.</li>
  <li>Document the architecture, relationships, and column definitions.</li>
</ul>

<hr>

<h2>🏛️ Data Architecture</h2>

<p>
  The project follows <strong>Medallion Architecture</strong>,
  with a separate responsibility for each layer.
</p>

<p align="center">
  <img
    src="C:\Users\DELL\Desktop\sql-data-warehouse-project\docs\data_architecture.png"
    alt="Data Warehouse Architecture"
    width="100%"
  >
</p>

<table>
  <tr>
    <th>Layer</th>
    <th>Purpose</th>
  </tr>
  <tr>
    <td><strong>Bronze</strong></td>
    <td>Stores raw source data before cleaning and transformation.</td>
  </tr>
  <tr>
    <td><strong>Silver</strong></td>
    <td>
      Cleans and standardizes data, handles missing values,
      and prepares source records for integration.
    </td>
  </tr>
  <tr>
    <td><strong>Gold</strong></td>
    <td>
      Combines prepared data into customer, product, and sales views
      organized as a star schema.
    </td>
  </tr>
</table>

<p>
  📄 <a href="docs/DATAWAREHOUSE.pdf">View Project Overview Diagram</a>
  <br>
  📄 <a href="docs/Architichre.pdf">View Detailed Data Architecture</a>
</p>

<hr>

<p align="center">
  <img
    src="docs/Data Integration.png"
    alt="Data Integration Diagram"
    width="100%"
  >
</p>

<p>
  CRM provides the core customer, product, and sales records.
  ERP adds customer attributes, location information, and product categories.
</p>

<table>
  <tr>
    <th>Source</th>
    <th>Dataset</th>
    <th>Role</th>
  </tr>
  <tr>
    <td>CRM</td>
    <td><code>cust_info</code></td>
    <td>Core customer information.</td>
  </tr>
  <tr>
    <td>CRM</td>
    <td><code>prd_info</code></td>
    <td>Core product information.</td>
  </tr>
  <tr>
    <td>CRM</td>
    <td><code>sales_details</code></td>
    <td>Sales records, quantities, prices, and dates.</td>
  </tr>
  <tr>
    <td>ERP</td>
    <td><code>CUST_AZ12</code></td>
    <td>Additional customer attributes.</td>
  </tr>
  <tr>
    <td>ERP</td>
    <td><code>LOC_A101</code></td>
    <td>Customer location information.</td>
  </tr>
  <tr>
    <td>ERP</td>
    <td><code>PX_CAT_G1V2</code></td>
    <td>Product categories and related attributes.</td>
  </tr>
</table>

<p>
  📄 <a href="docs/Data%20Integration.pdf">View Data Integration Diagram</a>
</p>

<hr>

<h2>⭐ Gold Layer — Data Model</h2>

<p>
  The Gold layer uses a <strong>Star Schema</strong>.
  The sales fact view connects to customer and product dimension views
  through their keys.
</p>

<table>
  <tr>
    <th>View</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>goldLayer.dum_cus</code></td>
    <td>Customer Dimension</td>
    <td>
      Combines CRM customer information with ERP customer
      and location attributes.
    </td>
  </tr>
  <tr>
    <td><code>goldLayer.dum_prd</code></td>
    <td>Product Dimension</td>
    <td>
      Combines CRM product information with ERP category details.
    </td>
  </tr>
  <tr>
    <td><code>goldLayer.fct_sls</code></td>
    <td>Sales Fact</td>
    <td>
      Contains sales line details, dates, quantities, prices,
      and customer and product keys.
    </td>
  </tr>
</table>

<h3>Relationships</h3>

<table>
  <tr>
    <th>Dimension Key</th>
    <th>Sales Key</th>
    <th>Relationship</th>
  </tr>
  <tr>
    <td><code>dum_cus.ranking</code></td>
    <td><code>fct_sls.customer_key</code></td>
    <td>One-to-Many</td>
  </tr>
  <tr>
    <td><code>dum_prd.ranking</code></td>
    <td><code>fct_sls.product_key</code></td>
    <td>One-to-Many</td>
  </tr>
</table>

<p>
  One customer or product can appear in multiple sales lines.
  These are logical relationships between the Gold views.
</p>

<p>
  📄 <a href="docs/Data%20model.pdf">View Data Model Diagram</a>
  <br>
  📖 <a href="docs/data_catalog.md">View Data Catalog and Column Definitions</a>
</p>

<hr>

<h2>⚙️ Data Processing Workflow</h2>

<ol>
  <li>
    <strong>Load:</strong>
    Import CRM and ERP source files into Bronze.
  </li>
  <li>
    <strong>Clean:</strong>
    Handle duplicates, missing values, and inconsistent formats in Silver.
  </li>
  <li>
    <strong>Transform:</strong>
    Standardize values and apply business rules.
  </li>
  <li>
    <strong>Integrate:</strong>
    Combine related source records into Gold dimensions.
  </li>
  <li>
    <strong>Model:</strong>
    Link sales records to customer and product dimension keys.
  </li>
  <li>
    <strong>Validate:</strong>
    Check dimension key uniqueness, sales calculations,
    and missing relationship matches.
  </li>
</ol>

<hr>

<h2>🛠️ Technologies Used</h2>

<table>
  <tr>
    <th>Tool</th>
    <th>Purpose</th>
  </tr>
  <tr>
    <td>SQL Server</td>
    <td>Data storage and warehouse implementation.</td>
  </tr>
  <tr>
    <td>T-SQL</td>
    <td>Data loading, cleaning, transformation, and validation.</td>
  </tr>
  <tr>
    <td>SQL Server Management Studio</td>
    <td>Database development and query execution.</td>
  </tr>
  <tr>
    <td>Draw.io</td>
    <td>Architecture, integration, and data-model diagrams.</td>
  </tr>
  <tr>
    <td>Git &amp; GitHub</td>
    <td>Source control and project documentation.</td>
  </tr>
</table>

<hr>

<h2>📊 Analytics Use Cases</h2>

<p>The Gold layer provides a foundation for analyzing:</p>

<ul>
  <li>Total sales and units sold.</li>
  <li>Sales trends over time.</li>
  <li>Customer purchasing activity and sales by country.</li>
  <li>Product, category, and product-line performance.</li>
</ul>

<p>
  The model can be connected to <strong>Power BI</strong>
  or other reporting tools for further analysis.
</p>

<hr>

<h2>🌟 About Me</h2>

<p>
  Hi! I'm <strong>Yousef Awwad</strong>, a developer interested in
  web development, SQL, and data.
  This project is part of my learning journey in data warehousing:
  loading raw data, improving its quality, and organizing it
  into a model that others can understand and use.
</p>
