/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_customer_churn;
===============================================================================
*/





create or alter procedure bronze.load_customer_churn as
begin
	declare @start_time datetime, @end_time datetime, @batch_startime datetime, @batch_endtime datetime;
begin try
	set @batch_startime = GETDATE()


	print ' =================================================================================================================='
	print '======================= Loading  bronze.customer_churn ============================================================'
	print ' ==================================================================================================================='
	set @start_time = GETDATE()

	print ' <<< truncate table:bronze.crm_cust_info'
truncate table  bronze.telecom_customer_churn

bulk insert bronze.telecom_customer_churn
from 'C:\Users\godsp\Downloads\TELECOM DATASET-20250821T112301Z-1-001\TELECOM DATASET\telecom_customer_churn.csv'
with(
	firstrow =2,
	fieldterminator =',',
	tablock
)
set @end_time = GETDATE()

print' load bronze.customer_churn duration' + cast(datediff(second,@start_time,@end_time) as nvarchar) + ' Seconds'
set @batch_endtime = GETDATE()

print '<<<<<------------------------------------------------------>>>>>>'



	print ' =================================================================================================================='
	print '======================= Loading  bronze.telecom_ZipCode_Population ============================================================'
	print ' ==================================================================================================================='
	set @start_time = GETDATE()

print ' <<< truncate table:bronze.crm_cust_info'

truncate table bronze.telecom_ZipCode_Population

bulk insert telecom_ZipCode_Population
from 'C:\Users\godsp\Downloads\telecom_zipcode_population.csv'
with (
		firstrow =2,
		fieldterminator=',',
		tablock
	)

set @end_time = GETDATE()

print' load bronze.customer_churn duration' + cast(datediff(second,@start_time,@end_time) as nvarchar) + ' Seconds'

print '<<<<<------------------------------------------------------>>>>>>'
end try

Begin catch
	print '==================================================== '
	print 'Error During Loading Bronze Layer'

	print 'Error Message: ' + error_message();
	print 'Error Message: ' + cast(error_number() as nvarchar);
	print 'Error Message: ' + cast(error_state() as nvarchar);
	print '==================================================== '
end catch

end;

exec bronze.load_customer_churn


