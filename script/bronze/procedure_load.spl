/*
===============================================================================
Procedure Purpose:
    Loads raw CRM and ERP data from CSV files into the Bronze Layer.

    The procedure:
    - Truncates each Bronze table before loading new data.
    - Uses BULK INSERT to import CSV files.
    - Calculates the loading time for each table.
    - Calculates the total batch loading time.
    - Uses TRY...CATCH to display any errors during execution.

Warning:
    This procedure performs a full load and deletes all existing data from
    the Bronze tables before importing the new data.
===============================================================================
*/

EXEC  bronzeLayer_load_bronze;

GO
CREATE OR ALTER PROCEDURE bronzeLayer_load_bronze AS
BEGIN
BEGIN TRY
	DECLARE @startdate DATETIME, @endDate DATETIME , @batchStartTime DATETIME , @batchEndTime DATETIME
	SET @batchStartTime = GETDATE();
	PRINT '========== STARTING LOADING ================'
		TRUNCATE TABLE bronzeLayer.crm_prd_info;
		PRINT 'TRANCATING FROM TABLE = prd_info';
		SET @startdate = GETDATE();

		BULK INSERT bronzeLayer.crm_prd_info
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv '
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @endDate = GETDATE();

		PRINT 'TIME CONSUMED = ' + CAST(DATEDIFF(second , @startDate , @endDate) AS NVARCHAR);
		PRINT '======================================================='
		TRUNCATE TABLE bronzeLayer.crm_cust_info;
		PRINT 'TRANCATING FROM TABLE = cust_info';
		SET @startDate = GETDATE();


		BULK INSERT bronzeLayer.crm_cust_info
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @endDate = GETDATE();
		PRINT 'TIME CONSUMED = ' + CAST(DATEDIFF(second , @startDate , @endDate) AS NVARCHAR);
		PRINT '======================================================='
		TRUNCATE TABLE bronzeLayer.crm_sales_details;

		PRINT 'TRANCATING FROM TABLE = sales_details';
		SET @startdate = GETDATE();
		BULK INSERT bronzeLayer.crm_sales_details
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		SET @endDate = GETDATE();

		PRINT 'TIME CONSUMED = ' + CAST(DATEDIFF(second , @startDate , @endDate) AS NVARCHAR);
		PRINT '======================================================='
		TRUNCATE TABLE bronzeLayer.erp_CUST_AZ12;
		PRINT 'TRANCATING FROM TABLE = CUST_AZ12';

		SET @startDate = GETDATE();

		BULK INSERT bronzeLayer.erp_CUST_AZ12
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @endDate = GETDATE();

		PRINT 'TIME CONSUMED = ' + CAST(DATEDIFF(second , @startDate , @endDate) AS NVARCHAR);
		PRINT '======================================================='
		TRUNCATE TABLE bronzeLayer.erp_LOC_A101;
		PRINT 'TRANCATING FROM TABLE = LOC_A101';

		SET @startDate = GETDATE();

		BULK INSERT bronzeLayer.erp_LOC_A101
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @endDate = GETDATE();

		PRINT 'TIME CONSUMED = ' + CAST(DATEDIFF(second , @startDate , @endDate) AS NVARCHAR);
		PRINT '======================================================='
		TRUNCATE TABLE bronzeLayer.erp_PX_CAT_G1V2;

		PRINT 'TRANCATING FROM TABLE = CAT_G1V2';

		SET @startDate = GETDATE();
		BULK INSERT bronzeLayer.erp_PX_CAT_G1V2
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endDate = GETDATE();

		PRINT 'TIME CONSUMED = ' + CAST(DATEDIFF(second , @startDate , @endDate) AS NVARCHAR);
		PRINT '=======================================================';
		SET @batchEndTime = GETDATE();
		PRINT 'TIME CONSUMED FOR WHOLE LOAD = ' +  CAST(DATEDIFF(second , @batchStartTime , @batchEndTime) AS NVARCHAR);
	END TRY
	BEGIN CATCH
	PRINT ERROR_MESSAGE();
	PRINT ERROR_NUMBER()
	END CATCH
END






