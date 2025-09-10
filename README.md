# Telecomm Customer Churn Analysis
Customer Churn Medallion Data Pipeline (SQL Server)
## Business Problem

Customer churn is one of the biggest challenges faced by subscription-based and service-oriented businesses. Retaining existing customers is often more cost-effective than acquiring new ones.

The key business questions are:

* Which customers are most likely to churn?

* What characteristics differentiate churned customers from loyal ones?

* Can we predict churn risk for newly joined customers?

This project addresses these questions by building a Medallion Architecture data pipeline in SQL Server, preparing the data for both business intelligence analysis (Power BI) and machine learning churn prediction models.


## Medallion Architecture
### 🔹 Bronze Layer

* Raw datasets are ingested into SQL Server.

* Acts as the landing zone for all customer data.

### 🔸 Silver Layer

Data cleaning and transformation:

* Handled missing values.

* Removed duplicates.

* Standardized column formats.

Produces structured data ready for downstream use.

### 🟡 Gold Layer

Three curated views were created for different analytical purposes:

**gold.telecom_customer_churn**

Complete dataset with all statuses: Churned, Stayed, Joined.

* Used for Power BI analysis.

**gold.customer_churned**

Customers with status: Churned, Stayed.

* Used for Data Exploration, Statistical Analysis and machine learning training.

  

**gold.customer_joined**

Customers with status: Joined.

* Used to test the churn prediction model and identify customers at risk.


  ## Data Exploration
  In this section I performed an exploratory analysis of the customer dataset to better understand its structure and key patterns.

  ### Libraries Used
    ```
      # import libraies
    import pandas as   pd
    import numpy as np
    import matplotlib.pyplot as plt
    import seaborn as sns
    import pyodbc
  ```
* pandas → For data manipulation and cleaning

* numpy → For numerical operations

* matplotlib / seaborn → For data visualization

* pyodbc → To connect Python with SQL Server
 ### Data Overview
 * Dataset Size: ~6,589 rows × 41 columns

* Missing Values: None (all null values were already handled in the Silver layer of the data pipeline)

* Duplicates: None detected

* Data Types: A mix of categorical and numerical variables describing customer demographics, subscription details, and usage behavior

  ### Data insight
  <img width="580" height="462" alt="image" src="https://github.com/user-attachments/assets/d581f368-eb72-4621-8038-5e27a7a1a69b" />
  
*  Data is highly imbalanced, ratio = 72 percent
* So we analyse the data with other features while taking the target values separately to get some insights.

  [To access the full Data Exploration Report](https://github.com/Ihenx/Telecomm_Customer_Churn_Analysis/blob/main/Data_Exploration_and_prediction/Customer%20Data%20Exploration.ipynb)

  ## Machine Learning
  In this section, the goal is to predict customers at risk of churning by building and evaluating machine learning models.

### Steps Involved

* Data Preparation

* Split the dataset into training and testing sets.

* Performed feature scaling and encoding of categorical variables.

### Model Development & Selection

Tested multiple algorithms, including:

* XGBoost

* Gradient Boosting

* Decision Trees

* Random Forest

Used cross-validation to evaluate performance and identify the most suitable model.

### Hyperparameter Tuning

* Fine-tuned the best-performing model using parameter optimization techniques to improve predictive accuracy.

* Prediction

* Applied the optimized model to the gold.customer_joined dataset to predict which newly joined customers are at the highest risk of churn.

  [You can access the full Machine learning Report here]()

  

 
