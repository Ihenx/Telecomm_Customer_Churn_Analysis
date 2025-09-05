use master
go

if exists (select 1 from sys.databases where name = 'telecom_customer_churn')
begin
	alter database telecom_customer_churn
	set single_user with rollback immediate
	drop database telecom_customer_churn
end;
go

create database telecom_customer_churn

go

create schema bronze;
go

create schema silver;
go

create schema gold;
go
