-- 2. Data Analysis Queries

-- Calculate Attrition Rate by Department
SELECT 
    Department,
    COUNT(*) as TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Attritions,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as AttritionRate
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Analyze Salary Distribution by Job Role and Gender
SELECT 
    JobRole,
    Gender,
    COUNT(*) as EmployeeCount,
    ROUND(AVG(MonthlyIncome), 2) as AvgMonthlyIncome,
    MIN(MonthlyIncome) as MinMonthlyIncome,
    MAX(MonthlyIncome) as MaxMonthlyIncome
FROM `hr-employee-attrition`
GROUP BY JobRole, Gender
ORDER BY JobRole, Gender;

-- Work-Life Balance Impact on Attrition
SELECT 
    WorkLifeBalance,
    COUNT(*) as TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Attritions,
    ROUND(AVG(JobSatisfaction), 2) as AvgJobSatisfaction,
    ROUND(AVG(EnvironmentSatisfaction), 2) as AvgEnvironmentSatisfaction
FROM `hr-employee-attrition`
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Career Growth Analysis
SELECT 
    JobLevel,
    ROUND(AVG(YearsAtCompany), 2) as AvgYearsAtCompany,
    ROUND(AVG(YearsSinceLastPromotion), 2) as AvgYearsSincePromotion,
    ROUND(AVG(MonthlyIncome), 2) as AvgMonthlyIncome,
    COUNT(*) as EmployeeCount
FROM `hr-employee-attrition`
GROUP BY JobLevel
ORDER BY JobLevel;

-- Travel Impact on Job Satisfaction
SELECT 
    BusinessTravel,
    COUNT(*) as EmployeeCount,
    ROUND(AVG(JobSatisfaction), 2) as AvgJobSatisfaction,
    ROUND(AVG(WorkLifeBalance), 2) as AvgWorkLifeBalance,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Attritions
FROM `hr-employee-attrition`
GROUP BY BusinessTravel;

-- Overtime Analysis
SELECT 
    OverTime,
    COUNT(*) as EmployeeCount,
    ROUND(AVG(MonthlyIncome), 2) as AvgMonthlyIncome,
    ROUND(AVG(WorkLifeBalance), 2) as AvgWorkLifeBalance,
    ROUND(AVG(JobSatisfaction), 2) as AvgJobSatisfaction,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Attritions
FROM `hr-employee-attrition`
GROUP BY OverTime;

-- Employee Experience Level Analysis
WITH ExperienceBuckets AS (
    SELECT *,
        CASE 
            WHEN TotalWorkingYears < 5 THEN 'Junior'
            WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN 'Mid-Level'
            WHEN TotalWorkingYears > 10 THEN 'Senior'
        END as ExperienceLevel
    FROM `hr-employee-attrition`
)
SELECT 
    ExperienceLevel,
    COUNT(*) as EmployeeCount,
    ROUND(AVG(MonthlyIncome), 2) as AvgMonthlyIncome,
    ROUND(AVG(JobSatisfaction), 2) as AvgJobSatisfaction,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Attritions
FROM ExperienceBuckets
GROUP BY ExperienceLevel
ORDER BY 
    CASE ExperienceLevel 
        WHEN 'Junior' THEN 1 
        WHEN 'Mid-Level' THEN 2 
        WHEN 'Senior' THEN 3 
    END;