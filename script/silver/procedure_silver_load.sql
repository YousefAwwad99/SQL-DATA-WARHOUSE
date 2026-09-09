/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silverLayer_load_silver AS 
DECLARE @start_t DATE , @end_t DATE , @allStart DATE , @allEnd DATE;
BEGIN
	
	PRINT '============ CRM SECTION =========='
	PRINT 'Loading table product';
	BEGIN TRY
		SET @allStart = GETDATE();
		TRUNCATE TABLE silverLayer.crm_prd_info;
		SET @start_t = GETDATE();

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
		SET @end_t = GETDATE();
		PRINT 'Time Consumed : ' + CAST(DATEDIFF(second , @end_t,@start_t) AS NVARCHAR);
		PRINT '==============================';
	




		PRINT 'loading table customers'
		TRUNCATE TABLE silverLayer.crm_cust_info;
		SET @start_t = GETDATE()
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
		SET @end_t = GETDATE();
		PRINT 'Time Consumed : ' + CAST(DATEDIFF(second , @end_t,@start_t) AS NVARCHAR);
		PRINT'===================================';


	

		PRINT 'Loading table sales';
		TRUNCATE TABLE silverLayer.crm_sales_details ;
		SET @start_t = GETDATE();

		INSERT INTO silverLayer.crm_sales_details 
		(sls_ord_num , sls_prd_key , sls_cust_id , sls_order_dt , sls_ship_dt , sls_due_dt ,sls_sales , sls_quantity , sls_price)
		SELECT 
		sales_details,
		sls_prd_key,
		sls_cust_id,
		CASE WHEN sls_order_dt = 0 OR LEN(sls_order_dt) <> 8 THEN NULL
			 ELSE  CAST(CAST(sls_order_dt AS VARCHAR(50)) AS DATE)
			 END sls_order_dt,

		CASE WHEN LEN(sls_ship_dt) != 8 THEN NULL
			ELSE CAST(CAST(sls_ship_dt AS VARCHAR(50)) AS DATE) END sls_ship_dt,

		CASE WHEN LEN(sls_due_dt) != 8 THEN NULL
		ELSE CAST(CAST(sls_due_dt AS VARCHAR(50)) AS DATE) END sls_due_dt,

		CASE WHEN sls_price <= 0 OR sls_price IS NULL THEN sls_sales / sls_quantity
				ELSE sls_price END sls_price,

			sls_quantity,

		CASE WHEN sls_sales <=0 OR sls_sales IS NULL OR sls_price != ABS(sls_price) * sls_quantity
		THEN  ABS(sls_price) * sls_quantity 
		ELSE sls_sales END sls_sales

		FROM bronzeLayer.crm_sales_details

		SET @end_t = GETDATE();
		PRINT 'Time Consumed : ' + CAST(DATEDIFF(second , @end_t,@start_t) AS NVARCHAR);
		PRINT '=====================================';

		PRINT '=========== ERP SECTION ==========='
		PRINT 'Loading table erp_cust_az12'
		TRUNCATE TABLE silverLayer.erp_cust_az12

		SET @start_t = GETDATE();
		INSERT INTO silverLayer.erp_cust_az12
		(CID , BDATE , GEN)
		SELECT 
		SUBSTRING(CID , 4 , LEN(CID)) AS CID,
		CASE WHEN BDATE > GETDATE() THEN NULL
			 ELSE BDATE END BDATE,

			 CASE WHEN UPPER(TRIM(GEN)) IN ('F' , 'FEMALE') THEN 'Female'
			 WHEN UPPER(TRIM(GEN)) IN ('M' , 'MALE') THEN 'Male'
			 ELSE 'n/a'
			 END GEN
		FROM bronzeLayer.erp_CUST_AZ12

		SET @end_t = GETDATE();
		PRINT 'Time Consumed : ' + CAST(DATEDIFF(second , @end_t,@start_t) AS NVARCHAR);
		PRINT '=======================================';

		PRINT 'Loading table erp_loc_a101';
		TRUNCATE TABLE silverLayer.erp_loc_a101

		SET @start_t = GETDATE();
		INSERT INTO silverLayer.erp_loc_a101
		(cid , cntry)
		SELECT 
		REPLACE(CID , '-' , '') AS CID,
		CASE WHEN UPPER(TRIM(CNTRY)) = 'US' OR UPPER(TRIM(CNTRY)) = 'USA' THEN 'United States'
			 WHEN UPPER(TRIM(CNTRY)) = 'DE' THEN 'Germany'
			 WHEN UPPER(TRIM(CNTRY)) = 'DE' THEN 'Germany'
			 WHEN TRIM(CNTRY) IS NULL OR TRIM(CNTRY) = '' THEN 'n/a'
			 ELSE CNTRY
			 END CNTRY
		FROM bronzeLayer.erp_LOC_A101

		SET @end_t = GETDATE();
		PRINT 'Time Consumed : ' + CAST(DATEDIFF(second , @end_t,@start_t) AS NVARCHAR);
		PRINT '======================================='

		PRINT 'Loading table erp_px_cat_g1v2';
		TRUNCATE TABLE silverLayer.erp_px_cat_g1v2

		SET @start_t = GETDATE();
		INSERT INTO silverLayer.erp_px_cat_g1v2
		(id , cat , subcat , maintenance)
		SELECT 
		REPLACE (ID , '_' , '-') AS ID,
		CAT,
		SUBCAT,
		MAINTENANCE
		FROM bronzeLayer.erp_PX_CAT_G1V2

		SET @end_t = GETDATE();
		PRINT 'Time Consumed : ' + CAST(DATEDIFF(second , @end_t,@start_t) AS NVARCHAR);
		SET @allEnd = GETDATE();
		PRINT 'Time Consumed for Whole Silver Load : ' + CAST(DATEDIFF(second , @allEnd,@allStart) AS NVARCHAR);
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE();
		PRINT ERROR_NUMBER();
	END CATCH
END

