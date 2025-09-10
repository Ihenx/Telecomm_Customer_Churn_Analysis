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
    EXEC silver.load_telecom_customer_churn;
===============================================================================
*/



create or alter procedure silver.load_telecom_customer_churn as
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime
begin try

	print ' =================================================================================================================='
	print '======================= Loading Silver Layer ============================================================'
	print ' ==================================================================================================================='

set @batch_start_time = GETDATE()

	print ' =================================================================================================================='
	print ' ======================= Truncate Table silver.telecom_customer_churn ============================================='
	print ' ==================================================================================================================='
set @start_time =GETDATE()
truncate table silver.telecom_customer_churn

insert into silver.telecom_customer_churn(
Customer_id ,
Gender,
Age ,
Married ,
Number_of_Department ,
City ,
Zipcode ,
Latitude ,
Longitude,
Number_of_Referrals ,
Tenure_in_Months ,
Offer ,
Phone_Service ,
Avg_Monthly_Long_Distant_charges ,
Multiple_Lines ,
Internet_Service ,
Internet_Type ,
Avg_Monthly_GB_Download ,
Online_Security ,
Online_Backup ,
Device_Detection_plan ,
Premium_Tech_Support ,
Streaming_TV ,
Streaming_Movies ,
Streaming_Music,
Unlimited_Data ,
Contract,
Paperless_Billing ,
Payment_Method ,
Monthly_Charge ,
Total_Charges ,
Total_Refunds ,
Total_Extra_Charges ,
Total_Long_Distant_Charges ,
Total_Revenue ,
Customer_Status ,
Churn_Category ,
Churn_Reason

)

select 
	Customer_id,
	Gender,
	Age,
	Married,
	Number_of_Department as Number_of_Dependents,
	City,
	Zipcode,
	Latitude,
	Longitude,
	Number_of_Referrals,
	Tenure_in_Months,
	Offer,
	Phone_Service,
	case
		when Avg_Monthly_Long_Distant_charges is null then 0
		else Avg_Monthly_Long_Distant_charges
		end as Avg_Monthly_Long_Distance_charges,
	case	
		when Multiple_Lines is null then 'No'
		else Multiple_Lines
		end as Multiple_Lines,
	Internet_Service,
	case	
		when Internet_Type is null then 'None'
		else Internet_Type
		end as internet_Type,
	case
		when avg_Monthly_GB_Download is null then 0
		else Avg_Monthly_GB_Download
		END as Avg_Monthly_GB_Download,
	case
		when Online_Security is null then 'No'
		else Online_Security
		end as Online_Security,
	case
		when Online_Backup is null then 'No'
		else Online_Backup
		end as Online_Backup,
	case 
		when Device_Detection_Plan is null then 'No'
		else Device_Detection_Plan
		end as Device_Protection_Plan,
	case
		when Premium_Tech_Support is null then 'No'
		else Premium_Tech_Support
		end as Premium_Tech_Support,
	case 
		when Streaming_TV is null then 'No'
		else Streaming_TV
		end as Streaming_TV,
	case 
		when Streaming_Movies is null then 'No'
		else Streaming_Movies 
		end as Streaming_Movies,
	case
		when Streaming_Music is null then 'No'
		else Streaming_Music
		end as Streaming_Music,
	case 
		when Unlimited_Data is null then 'No'
		else Unlimited_Data 
		end as Unlimited_Data,
		Contract,
		Paperless_Billing,
		Payment_Method,
		Monthly_Charge,
		Total_Charges,
		Total_Refunds,
		Total_Extra_Charges,
		Total_long_Distant_Charges as Total_long_Distance_Charges,
		Total_Revenue,
	case
		when Customer_Status is null then 'Others'
		else Customer_Status
		end as Customer_Status,
	case 
		when Churn_Category is null then 'None'
		else Churn_Category
		end as Churn_Category,
	case 
		when Churn_Reason is null then 'None'
		else Churn_Reason
		end as Churn_Reason

from 
	bronze.telecom_customer_churn;

set @end_time =GETDATE()

print'load Duration for silver.telecom_customer_churn' + cast(datediff(second,@start_time,@end_time) as nvarchar) + ' Seconds'

print ' ==================================================================================================================='


	print ' =================================================================================================================='
	print ' ======================= Truncate silver.Telecom_ZipCode_Population ============================================='
	print ' ==================================================================================================================='
set @start_time =GETDATE()
truncate table silver.Telecom_ZipCode_Population
insert into silver.Telecom_ZipCode_Population(
Zipcode,
Population
)

select 
	Zipcode,
	Population
from 
	bronze.Telecom_ZipCode_Population;

set @end_time = GETDATE()

print'Load Duration for silver.Telecom_ZipCode_Population' + cast(datediff(second,@start_time,@end_time) as nvarchar) + ' Seconds'

print ' ==================================================================================================================='

set @batch_end_time = GETDATE()


print'Load Duration for Silver Batch layer ' + cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) + ' Seconds'

end try

Begin catch
		print '==================================================== '
		print 'Error During Loading Bronze Layer'
		print 'Error message' + Error_message();
		print 'Error Message' + cast(Error_number() as nvarchar);
		print 'Error Message' + cast(Error_state() as nvarchar);

end catch
end;


exec silver.load_telecom_customer_churn;
