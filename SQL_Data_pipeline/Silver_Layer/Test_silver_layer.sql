select 
 SUM(case 
		when customer_id is null then 1 else 0 end ) as number_ofnull_cust_id,
	 SUM(case 
		when gender is null then 1 else 0 end ) as number_ofnull_gender,
		SUM(case 
		when age is null then 1 else 0 end ) as number_ofnull_age,
		SUM(case 
		when city is null then 1 else 0 end ) as number_ofnull_city,
				SUM(case 
		when married is null then 1 else 0 end ) as number_ofnull_married,
						SUM(case 
		when Offer is null then 1 else 0 end ) as number_ofnull_offer,
				SUM(case 
		when Number_of_Department is null then 1 else 0 end ) as number_ofnull_num_of_dep,
				SUM(case 
		when number_of_referrals is null then 1 else 0 end ) as number_ofnull_num_ref,
				SUM(case 
		when online_backup is null then 1 else 0 end ) as number_ofnull_online_backup,
				SUM(case 
		when online_security is null then 1 else 0 end ) as number_ofnull_online_sec,
				SUM(case 
		when offer is null then 1 else 0 end ) as number_ofnull_off,
				SUM(case 
		when phone_service is null then 1 else 0 end ) as number_ofnull_phone_service,
				SUM(case 
		when tenure_in_months is null then 1 else 0 end ) as number_ofnull_tenure,
					SUM(case 
		when internet_service is null then 1 else 0 end ) as number_ofnull_internet_service,
					SUM(case 
		when internet_type is null then 1 else 0 end ) as number_ofnull_internet_type,
					SUM(case 
		when tenure_in_months is null then 1 else 0 end ) as number_ofnull_tenure,
					SUM(case 
		when avg_monthly_GB_download is null then 1 else 0 end ) as number_ofnull_avg_gb,
					SUM(case 
		when Avg_Monthly_Long_Distant_charges is null then 1 else 0 end ) as number_ofnull_avg_long_distance,
					SUM(case 
		when Multiple_Lines is null then 1 else 0 end ) as number_ofnull_multiple_line,
					SUM(case 
		when streaming_movies is null then 1 else 0 end ) as number_ofnull_streaming_movie,
					SUM(case 
		when streaming_music is null then 1 else 0 end ) as number_ofnull_streaming_music,
					SUM(case 
		when streaming_tv is null then 1 else 0 end ) as number_ofnull_streaming_tv,
					SUM(case 
		when Device_Detection_plan is null then 1 else 0 end ) as number_ofnull_device_protection,
					SUM(case 
		when premium_tech_support is null then 1 else 0 end ) as number_ofnull_prem_support,
					SUM(case 
		when unlimited_data is null then 1 else 0 end ) as number_ofnull_unlimited_date,
					SUM(case 
		when contract is null then 1 else 0 end ) as number_ofnull_contract,
					SUM(case 
		when payment_method is null then 1 else 0 end ) as number_ofnull_payment_method,
					SUM(case 
		when paperless_billing is null then 1 else 0 end ) as number_ofnull_paperless_billing,
					SUM(case 
		when monthly_charge is null then 1 else 0 end ) as number_ofnull_mont_charge,
					SUM(case 
		when total_charges  is null then 1 else 0 end ) as number_ofnull_total_charge,
					SUM(case 
		when Total_Extra_Charges is null then 1 else 0 end ) as number_ofnull_tot_extra_charge,
					SUM(case 
		when Total_Long_Distant_Charges is null then 1 else 0 end ) as number_ofnull_tot_long_distance_charge,
					SUM(case 
		when total_refunds is null then 1 else 0 end ) as number_ofnull_refund,
					SUM(case 
		when total_revenue is null then 1 else 0 end ) as number_ofnull_revenue,
					SUM(case 
		when churn_category is null then 1 else 0 end ) as number_ofnull_churn_cat,
					SUM(case 
		when churn_reason is null then 1 else 0 end ) as number_ofnull_churn_reason,
					SUM(case 
		when customer_status is null then 1 else 0 end ) as number_ofnull_status

from silver.telecom_customer_churn;