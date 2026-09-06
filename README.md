# Telco Customer Churn Analysis

## Project Overview

This project analyzes customer churn for a telecommunications company.

The main objective is to identify customer segments with higher observed churn rates and provide data-driven recommendations that can support customer retention.

## Tools Used

- Excel
- MySQL
- Power BI

## Project Workflow

Raw Data
↓
Excel Data Cleaning & Initial Analysis
↓
SQL Analysis & Validation
↓
Power BI Dashboard
↓
Business Insights & Recommendations

## Excel Data Cleaning & Initial Analysis

Excel was used for data cleaning, data quality checks, and initial exploratory analysis.

### Data Quality Checks

- Verified 7,043 customer records
- Checked for duplicate Customer IDs
- Checked for missing values
- Identified 11 blank-looking `TotalCharges` values
- Replaced the 11 blank `TotalCharges` values with 0 because the corresponding customers had zero tenure
- Validated Churn values and confirmed only Yes/No values were present

### Initial Analysis

Initial analysis in Excel was performed to understand churn patterns across:

- Contract type
- Customer tenure
- Monthly charges
- Internet service
- Payment method
- Paperless billing

The key findings from Excel were later validated using SQL.

## SQL Analysis

SQL was used to validate the data and analyze customer churn across different customer segments.

Key analyses included:

- Overall churn rate
- Churn by contract type
- Churn by tenure group
- Churn by internet service
- Churn by payment method

## Power BI Dashboard

An interactive Power BI dashboard was created to present the main churn metrics and patterns.

### Key KPIs

- Total Customers: 7,043
- Churned Customers: 1,869
- Active Customers: 5,174
- Overall Churn Rate: 26.54%

## Key Findings

- The overall observed churn rate is 26.54%.
- Customers with 0–12 months of tenure have the highest observed churn rate at 47.44%.
- Month-to-month customers have an observed churn rate of 42.71%.
- Electronic-check customers have an observed churn rate of 45.29%.
- Fiber-optic customers have an observed churn rate of 41.89%.

## Business Recommendations

### 1. Focus on New Customers

Customers in their first 12 months show substantially higher observed churn. The company could focus on better onboarding and proactive support during the early customer lifecycle.

### 2. Investigate Month-to-Month Customers

Month-to-month customers show a much higher observed churn rate than customers with longer-term contracts. The company could investigate suitable retention offers and opportunities for longer-term contracts.

### 3. Investigate High-Churn Segments

Fiber-optic and electronic-check customers show higher observed churn. Further analysis should be conducted to understand the reasons behind these patterns before implementing targeted actions.

## Project Files

- `Excel` - Excel workbook containing data cleaning, validation, and initial analysis
- `Raw_Data` - Original dataset
- `Cleaned_Data` - Cleaned dataset used for analysis
- `SQL` - SQL queries used for validation and business analysis
- `PowerBI` - Power BI dashboard

## Conclusion

The analysis shows that customer churn is particularly high among newer customers and month-to-month customers. Several other segments, including fiber-optic and electronic-check customers, also show higher observed churn.

The dashboard provides an interactive way to explore these patterns and can help identify areas where further customer retention analysis may be useful.