
/*
===============================================================================
Script Purpose:
    Cleans, transforms, and loads data from the Bronze Layer into the
    Silver Layer.

    The script:
    - Removes duplicate records and keeps the latest record.
    - Excludes records with missing primary keys.
    - Removes unwanted spaces from text fields.
    - Standardizes categorical values.
    - Handles missing or invalid values.
    - Truncates Silver tables before inserting the cleaned data.

Warning:
    This script performs a full load and deletes the existing data from
    the Silver Layer tables before reloading them.
===============================================================================
*/

-- ============= Customers Taable =================
	TRUNCATE TABLE silverLayer.crm_cust_info;

	INSERT INTO silverLayer.crm_cust_info
	 (cst_id , cst_key , cst_firstname , cst_lastname , cst_marital_status , cst_gndr , cst_create_date)

	SELECT cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date
	FROM(
		SELECT 
		cst_id,
		cst_key,
		TRIM(cst_firstname) AS cst_firstname,
		TRIM(cst_lastname) AS cst_lastname,
		CASE WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married' 
			 WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
			 ELSE 'n/a' END cst_marital_status,

			 CASE WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male' 
			 WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
			 ELSE 'n/a' END cst_gndr,

			 cst_create_date,
		ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS [RANK]
		FROM bronzeLayer.crm_cust_info
	)T
	WHERE [RANK] = 1 AND cst_id IS NOT NULL



-- ======================= Products Table ======================



TRUNCATE TABLE silverLayer.crm_prd_info;

INSERT INTO silverLayer.crm_prd_info
(prd_id , prd_key , prd_key1 , prd_nm , prd_cost ,prd_line, prd_start_dt , prd_end_dt)


SELECT 
prd_id,
SUBSTRING(prd_key , 1 , 5) AS  prd_key,
SUBSTRING(prd_key , 7 , LEN(prd_key)) AS prd_key1,
prd_nm,
CASE WHEN prd_cost IS NULL THEN 0 ELSE prd_cost END prd_cost,
CASE WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
	 WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
	 WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
	 WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
	 ELSE 'n/a' END prd_line,
	 prd_start_dt,
	 DATEADD(DAY, -1 ,LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_dt

FROM bronzeLayer.crm_prd_info

SELECT *
FROM silverLayer.crm_prd_info

	
