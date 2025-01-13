# HR Analytics SQL Project
   - Job satisfaction trends
   - Environmental satisfaction impact

4. **Career Progression**
   - Years in current role analysis
   - Promotion patterns
   - Experience level distribution

## Key SQL Techniques Used
- Common Table Expressions (CTEs)
- Window Functions
- Aggregate Functions
- Data Cleaning Operations
- Case Statements
- Joins and Subqueries
- Data Transformation

## Getting Started
1. Clone this repository
2. Import the dataset into your preferred SQL database
3. Execute the SQL scripts in the following order:
   - First run `01_create_tables.sql`
   - Then `02_data_cleaning.sql`
   - Finally `03_analysis_queries.sql`

## Sample Query
```sql
-- Calculate Attrition Rate by Department
SELECT 
    Department,
    COUNT(*) as TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Attritions,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) 
    as AttritionRate
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY AttritionRate DESC;
```

## Key Findings
- Identified departments with highest attrition rates
- Analyzed correlation between overtime and job satisfaction
- Discovered patterns in career progression and employee retention
- Mapped relationship between work-life balance and performance

## Tools Used
- PostgreSQL
- DBeaver (for query execution and visualization)
- Git for version control

## Future Improvements
- Add predictive analytics queries
- Include visualization queries for BI tools
- Develop stored procedures for routine analyses
- Add more complex statistical calculations

## Personal Note
This project is part of my portfolio to demonstrate SQL data analysis skills. It showcases my ability to:
- Clean and transform raw data
- Write complex SQL queries
- Extract meaningful business insights
- Document and structure SQL projects

## Disclaimer
This is a personal project for educational and portfolio purposes. The dataset is from Kaggle and is used for demonstration only.
