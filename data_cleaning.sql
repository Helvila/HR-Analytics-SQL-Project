SELECT * FROM hr_attrition.`hr-employee-attrition`;


-- 1. Data Cleaning Queries

-- Check for duplicate records based on EmployeeNumber
WITH DuplicatesCTE AS (
    SELECT EmployeeNumber, 
           COUNT(*) as RecordCount
    FROM `hr-employee-attrition`
    GROUP BY EmployeeNumber
    HAVING COUNT(*) > 1
)
SELECT * FROM DuplicatesCTE;
-- there is no duplicates

-- Remove duplicate records
WITH RowNumCTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY EmployeeNumber ORDER BY EmployeeNumber) as row_num
    FROM `hr-employee-attrition`
)
DELETE FROM `hr-employee-attrition`
WHERE EmployeeNumber IN (
    SELECT EmployeeNumber 
    FROM RowNumCTE 
    WHERE row_num > 1
);

-- Check for NULL values in important columns
SELECT 
    COUNT(*) - COUNT(Attrition) as Attrition_Nulls,
    COUNT(*) - COUNT(Department) as Department_Nulls,
    COUNT(*) - COUNT(MonthlyIncome) as MonthlyIncome_Nulls,
    COUNT(*) - COUNT(JobRole) as JobRole_Nulls
FROM `hr-employee-attrition`;

-- Remove redundant columns (EmployeeCount and StandardHours as they're constant)
ALTER TABLE `hr-employee-attrition`
DROP COLUMN StandardHours;


