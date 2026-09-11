
<h1>Data Catalog</h1>

<p>
  This project combines CRM and ERP data into a data warehouse.
  The Gold layer contains customer, product, and sales views
  organized in a Star Schema for reporting and analysis.
</p>

<h2>1. goldLayer.dum_cus</h2>
<p>Customer information combined from CRM and ERP sources.</p>

<table>
  <tr>
    <th>Column</th>
    <th>Data Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>ranking</td>
    <td>bigint</td>
    <td>Customer key used to link customers to sales.</td>
  </tr>
  <tr>
    <td>customer_id</td>
    <td>int</td>
    <td>Customer ID from CRM.</td>
  </tr>
  <tr>
    <td>customer_number</td>
    <td>varchar(50)</td>
    <td>Customer business identifier.</td>
  </tr>
  <tr>
    <td>first_name</td>
    <td>varchar(50)</td>
    <td>Customer's first name.</td>
  </tr>
  <tr>
    <td>last_name</td>
    <td>varchar(50)</td>
    <td>Customer's last name.</td>
  </tr>
  <tr>
    <td>gender</td>
    <td>nvarchar(50)</td>
    <td>Customer's gender.</td>
  </tr>
  <tr>
    <td>marital_status</td>
    <td>varchar(50)</td>
    <td>Customer's marital status.</td>
  </tr>
  <tr>
    <td>birth_date</td>
    <td>date</td>
    <td>Customer's date of birth.</td>
  </tr>
  <tr>
    <td>country</td>
    <td>nvarchar(50)</td>
    <td>Customer's country.</td>
  </tr>
  <tr>
    <td>create_date</td>
    <td>date</td>
    <td>Date the customer record was created in the source.</td>
  </tr>
</table>

<h2>2. goldLayer.dum_prd</h2>
<p>Product information from CRM enriched with ERP category details.</p>

<table>
  <tr>
    <th>Column</th>
    <th>Data Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>ranking</td>
    <td>bigint</td>
    <td>Product key used to link products to sales.</td>
  </tr>
  <tr>
    <td>product_id</td>
    <td>int</td>
    <td>Product ID from CRM.</td>
  </tr>
  <tr>
    <td>product_number</td>
    <td>nvarchar(50)</td>
    <td>Product business identifier.</td>
  </tr>
  <tr>
    <td>product_name</td>
    <td>nvarchar(50)</td>
    <td>Name of the product.</td>
  </tr>
  <tr>
    <td>category_id</td>
    <td>nvarchar(50)</td>
    <td>Product category identifier.</td>
  </tr>
  <tr>
    <td>category</td>
    <td>nvarchar(50)</td>
    <td>Main product category.</td>
  </tr>
  <tr>
    <td>product_line</td>
    <td>nvarchar(50)</td>
    <td>Product line or group.</td>
  </tr>
  <tr>
    <td>product_cost</td>
    <td>int</td>
    <td>Cost of the product.</td>
  </tr>
  <tr>
    <td>maintenance</td>
    <td>nvarchar(50)</td>
    <td>Maintenance indicator for the product category.</td>
  </tr>
  <tr>
    <td>subcat</td>
    <td>nvarchar(50)</td>
    <td>Product subcategory.</td>
  </tr>
  <tr>
    <td>product_start_date</td>
    <td>date</td>
    <td>Start date of the product record.</td>
  </tr>
</table>

<h2>3. goldLayer.fct_sls</h2>
<p>
  Sales line details, including customer and product keys,
  dates, quantities, and amounts. An order can contain multiple rows.
</p>

<table>
  <tr>
    <th>Column</th>
    <th>Data Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>sls_ord_num</td>
    <td>nvarchar(50)</td>
    <td>Order number; may repeat across sales lines.</td>
  </tr>
  <tr>
    <td>product_key</td>
    <td>bigint</td>
    <td>Links to goldLayer.dum_prd.ranking.</td>
  </tr>
  <tr>
    <td>customer_key</td>
    <td>bigint</td>
    <td>Links to goldLayer.dum_cus.ranking.</td>
  </tr>
  <tr>
    <td>order_date</td>
    <td>date</td>
    <td>Date the order was placed.</td>
  </tr>
  <tr>
    <td>ship_date</td>
    <td>date</td>
    <td>Date the order was shipped.</td>
  </tr>
  <tr>
    <td>due_date</td>
    <td>date</td>
    <td>Order due date.</td>
  </tr>
  <tr>
    <td>sales</td>
    <td>int</td>
    <td>Sales amount for the line: quantity × price.</td>
  </tr>
  <tr>
    <td>quantity</td>
    <td>int</td>
    <td>Number of units sold.</td>
  </tr>
  <tr>
    <td>price</td>
    <td>int</td>
    <td>Selling price per unit.</td>
  </tr>
</table>

<h2>Relationships</h2>

<table>
  <tr>
    <th>Dimension Key</th>
    <th>Sales Key</th>
    <th>Relationship</th>
  </tr>
  <tr>
    <td>goldLayer.dum_cus.ranking</td>
    <td>goldLayer.fct_sls.customer_key</td>
    <td>One-to-Many</td>
  </tr>
  <tr>
    <td>goldLayer.dum_prd.ranking</td>
    <td>goldLayer.fct_sls.product_key</td>
    <td>One-to-Many</td>
  </tr>
</table>

<p>
  These are logical relationships between views.
  Dimension keys should be unique, while sales keys can repeat.
</p>
