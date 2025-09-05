if OBJECT_ID('silver.telecom_customer_churn') is not null
	drop table telecom_customer_churn
go

create table silver.telecom_customer_churn(
Customer_id nvarchar(50) primary key not null,
Gender varchar(50),
Age int,
Married varchar(50),
Number_of_Department int,
City varchar(50),
Zipcode int,
Latitude float,
Longitude float,
Number_of_Referrals int,
Tenure_in_Months int,
Offer varchar(50),
Phone_Service Varchar(50),
Avg_Monthly_Long_Distant_charges float,
Multiple_Lines varchar(50),
Internet_Service varchar(50),
Internet_Type varchar(50),
Avg_Monthly_GB_Download float,
Online_Security varchar(50),
Online_Backup varchar(50),
Device_Detection_plan varchar(50),
Premium_Tech_Support varchar(50),
Streaming_TV varchar(50),
Streaming_Movies varchar(50),
Streaming_Music varchar(50),
Unlimited_Data varchar(50),
Contract varchar(50),
Paperless_Billing varchar(50),
Payment_Method varchar(50),
Monthly_Charge float,
Total_Charges float,
Total_Refunds float,
Total_Extra_Charges float,
Total_Long_Distant_Charges float,
Total_Revenue float,
Customer_Status varchar(50),
Churn_Category varchar(50),
Churn_Reason varchar(50)

);

if OBJECT_ID('silver.Telecom_ZipCode_Population', 'U') is not null
	drop table silver.Telecom_ZipCode_Population;
go

create table silver.Telecom_ZipCode_Population(
Zipcode int,
Population int
);

