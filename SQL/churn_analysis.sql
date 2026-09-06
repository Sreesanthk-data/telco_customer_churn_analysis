CREATE DATABASE telco_churn_analysis;
USE telco_churn_analysis;

CREATE TABLE telco_customer_churn (
    customerID VARCHAR(20),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(10)
);

-- ==========================================
-- TELCO CUSTOMER CHURN ANALYSIS
-- SQL BUSINESS ANALYSIS
-- ==========================================


-- Total Number Of Customers --
SELECT COUNT(*) AStotal_customers 
FROM telco_customer_churn;


-- Check the data --
SELECT *
FROM telco_customer_churn
LIMIT 10;


-- Check Churn Distribution --
SELECT
     Churn,
     COUNT(*) AS Customers
FROM telco_customer_churn
GROUP BY churn;


-- Check Missing Values --
SELECT
     COUNT(*) AS total_rows,
     SUM(CustomerID IS NULL OR CustomerID = '') AS missing_customerID,
     SUM(tenure IS NULL) AS missing_tenure,
     SUM(MonthlyCharges IS NULL) AS missing_monthlycharges,
     SUM(TotalCharges IS NULL) AS missing_totalcharges,
     SUM(churn IS NULL OR Churn = '') AS missing_churn
FROM telco_customer_churn;


-- Overall Churn Rate --
SELECT
     COUNT(*) AS total_customers,
     SUM(CASE 
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
         END) AS churned_customers,
      ROUND(
           100.0 * 
	 SUM(CASE 
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
         END ) /COUNT(*),
         2
         )AS churn_rate
      FROM telco_customer_churn;
      
      
 -- Contract vs Churn --
 SELECT
      Contract,
      COUNT(*) AS total_customers,
      COUNT(CASE
                WHEN Churn = 'Yes' THEN 1
            END) AS churned_customers,
      ROUND(
           COUNT(CASE WHEN Churn = 'Yes' THEN 1
                END)* 100.0/ COUNT(*),
                2
            ) AS churn_rate
 FROM  telco_customer_churn
 GROUP BY Contract
 ORDER BY Churn_rate DESC;
 
 
 -- Tenure vs Churn --
 SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    COUNT(CASE 
              WHEN Churn = 'Yes' THEN 1 
		 END) AS churned_customers,

    ROUND(
        COUNT(CASE
                 WHEN Churn = 'Yes' THEN 1 
			 END) * 100.0 / COUNT(*),
           2
        ) AS churn_rate

FROM telco_customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;


-- Internet Service vs Churn --
SELECT
     InternetService,
     COUNT(*) AS total_customers,
     COUNT(CASE
              WHEN Churn = 'Yes' THEN 1
		   END) AS churned_customers,
      ROUND(
		   COUNT(CASE 
                    WHEN Churn = 'Yes' THEN 1 
                 END ) * 100.0 / COUNT(*),
                 2
             ) AS churn_rate
FROM telco_customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC; 


-- Payment Method Vs Churn --
SELECT
     PaymentMethod,
     COUNT(*) AS total_customers,
     COUNT(CASE
              WHEN Churn = 'Yes' THEN 1
              END) AS churned_customers,
     ROUND(
          COUNT(CASE
                   WHEN Churn = 'Yes' THEN 1
                END) * 100.0 / Count(*),
                2
           ) AS churn_rate
FROM telco_customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;  


-- Monthly Charges vs Churn --
SELECT
    CASE
        WHEN MonthlyCharges <= 30 THEN 'Low'
        WHEN MonthlyCharges <= 70 THEN 'Medium'
        ELSE 'High'
    END AS monthly_charge_group,

    COUNT(*) AS total_customers,

    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churned_customers,

    ROUND(
        COUNT(CASE 
                WHEN Churn = 'Yes' THEN 1 
              END) * 100.0 / COUNT(*),
              2
         ) AS churn_rate

FROM telco_customer_churn
GROUP BY monthly_charge_group
ORDER BY churn_rate DESC;




 

      


      
       

            
           
           
     










