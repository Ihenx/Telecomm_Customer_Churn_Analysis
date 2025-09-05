if object_id('gold.telecom_customer_churn','V') is not null
 drop view gold.telecom_customer_churn
 go

create or alter view gold.telecom_customer_churn as
select 
	Customer_id,
	Gender,
	Age,
	Married,
	Number_of_Department as Number_of_Dependent,
	City,
	c.Zipcode,
	Latitude,
	Longitude,
	Number_of_Referrals,
	Tenure_in_Months,
	Offer,
	Phone_Service,
	Avg_Monthly_Long_Distant_charges as Avg_Monthly_Long_Distance_charges,
	Multiple_Lines,
	Internet_Service,
	Internet_Type,
	Avg_Monthly_GB_Download,
	Online_Security,
	Online_Backup,
	Device_Detection_Plan as Device_Protection_Plan,
	Premium_Tech_Support,
	Streaming_TV,
	Streaming_Movies,
	Streaming_Music,
	Unlimited_Data,
	Contract,
	Paperless_Billing,
	Payment_Method,
	Monthly_Charge,
	Total_charges,
	Total_Refunds,
	Total_Extra_Charges,
	Total_Long_Distant_Charges as Total_Long_Distance_Charges,
	Total_Revenue,
	Customer_Status,
	Churn_Category,
	Churn_Reason,
	Population

from 
	silver.telecom_customer_churn c
left join
	silver.Telecom_ZipCode_Population p
on c.zipcode = p.zipcode;

go


if object_id('gold.customer_churned','V') is not null
 drop view gold.customer_churned;
 go

create or alter view gold.customer_churned as
select 
	Customer_id,
	Gender,
	Age,
	Married,
	Number_of_Department as Number_of_Dependent,
	City,
	c.Zipcode,
	Latitude,
	Longitude,
	Number_of_Referrals,
	Tenure_in_Months,
	Offer,
	Phone_Service,
	Avg_Monthly_Long_Distant_charges as Avg_Monthly_Long_Distance_charges,
	Multiple_Lines,
	Internet_Service,
	Internet_Type,
	Avg_Monthly_GB_Download,
	Online_Security,
	Online_Backup,
	Device_Detection_Plan as Device_Protection_Plan,
	Premium_Tech_Support,
	Streaming_TV,
	Streaming_Movies,
	Streaming_Music,
	Unlimited_Data,
	Contract,
	Paperless_Billing,
	Payment_Method,
	Monthly_Charge,
	Total_charges,
	Total_Refunds,
	Total_Extra_Charges,
	Total_Long_Distant_Charges as Total_Long_Distance_Charges,
	Total_Revenue,
	Customer_Status,
	Churn_Category,
	Churn_Reason,
	Population

from 
	silver.telecom_customer_churn c
left join
	silver.Telecom_ZipCode_Population p
on c.zipcode = p.zipcode

where customer_status != 'Joined';

go

if object_id('gold.customer_Joined','V') is not null
 drop view gold.customer_Joined;
 go

create or alter view gold.customer_Joined as
select 
	Customer_id,
	Gender,
	Age,
	Married,
	Number_of_Department as Number_of_Dependent,
	City,
	c.Zipcode,
	Latitude,
	Longitude,
	Number_of_Referrals,
	Tenure_in_Months,
	Offer,
	Phone_Service,
	Avg_Monthly_Long_Distant_charges as Avg_Monthly_Long_Distance_charges,
	Multiple_Lines,
	Internet_Service,
	Internet_Type,
	Avg_Monthly_GB_Download,
	Online_Security,
	Online_Backup,
	Device_Detection_Plan as Device_Protection_Plan,
	Premium_Tech_Support,
	Streaming_TV,
	Streaming_Movies,
	Streaming_Music,
	Unlimited_Data,
	Contract,
	Paperless_Billing,
	Payment_Method,
	Monthly_Charge,
	Total_charges,
	Total_Refunds,
	Total_Extra_Charges,
	Total_Long_Distant_Charges as Total_Long_Distance_Charges,
	Total_Revenue,
	Customer_Status,
	Churn_Category,
	Churn_Reason,
	Population

from 
	silver.telecom_customer_churn c
left join
	silver.Telecom_ZipCode_Population p
on c.zipcode = p.zipcode

where customer_status = 'Joined';

go

