
/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

IF OBJECT_ID('goldLayer.dum_cus') IS NOT NULL
	DROP VIEW goldLayer.dum_cus;
	GO
CREATE VIEW goldLayer.dum_cus AS
SELECT 
ROW_NUMBER() OVER(ORDER BY cin.cst_id) AS ranking,
cin.cst_id AS customer_id,
cin.cst_key AS customer_number,
cin.cst_firstname AS first_name,
cin.cst_lastname AS last_name,
	CASE WHEN cst_gndr = 'n/a' AND gen IS NOT NULL THEN gen
		 ELSE cst_gndr END gender,
cin.cst_marital_status AS marital_status,
eca.bdate AS birth_date,
ela.cntry AS country,
cin.cst_create_date AS create_date
FROM silverLayer.crm_cust_info AS cin
LEFT JOIN silverLayer.erp_cust_az12 AS eca
	ON cin.cst_key = eca.cid
LEFT JOIN silverLayer.erp_loc_a101 AS ela
	ON cin.cst_key = ela.cid 




	IF OBJECT_ID('goldLayer.dum_prd' , 'V') IS NOT NULL
		DROP VIEW goldLayer.dum_prd;
		GO
	CREATE VIEW goldLayer.dum_prd AS
	SELECT
	ROW_NUMBER() OVER(ORDER BY prd_id , prd_key) AS ranking,
	cpi.prd_id AS product_id,
	cpi.prd_key AS product_number,
	cpi.prd_nm AS product_name,
	cpi.prd_key1 AS category_id,
	pcg.cat AS category,
	cpi.prd_line AS product_line,
	cpi.prd_cost AS product_cost,
	pcg.maintenance AS maintenance,
	pcg.subcat,
	cpi.prd_start_dt AS product_start_date
	FROM silverLayer.crm_prd_info AS cpi
	LEFT JOIN silverLayer.erp_px_cat_g1v2 AS pcg
	ON pcg.id = cpi.prd_key


	IF OBJECT_ID ('goldLayer.fct_sls' , 'V') IS NOT NULL
		DROP VIEW goldLayer.fct_sls;
		GO
	CREATE VIEW goldLayer.fct_sls AS 
	SELECT 
	sd.sls_ord_num,
	p.ranking AS product_key,
	c.ranking AS customer_key,
	sd.sls_order_dt AS order_date,
	sd.sls_ship_dt AS ship_date,
	sd.sls_due_dt AS due_date,
	sd.sls_sales AS sales,
	sd.sls_quantity AS quantity,
	sd.sls_price AS price
	FROM silverLayer.crm_sales_details sd
	LEFT JOIN goldLayer.dum_cus AS c
	ON c.customer_id = sd.sls_cust_id
	LEFT JOIN goldLayer.dum_prd AS p
	ON p.category_id = sd.sls_prd_key

	

