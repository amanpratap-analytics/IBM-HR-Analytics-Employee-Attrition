SELECT * FROM hr_employee_attrition;

SELECT
CASE
WHEN monthly_income < 3000 THEN 'Below 3k'
WHEN monthly_income BETWEEN 3000 AND 5999 THEN '3k-5.9k'
WHEN monthly_income BETWEEN 6000 AND 9999 THEN '6k-9.9k'
WHEN monthly_income BETWEEN 10000 AND 14999 THEN '10k-14.9k'
ELSE '15k+'
END AS income_group,
COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employee_attrition

GROUP BY 

CASE
WHEN monthly_income < 3000 THEN 'Below 3k'
WHEN monthly_income BETWEEN 3000 AND 5999 THEN '3k-5.9k'
WHEN monthly_income BETWEEN 6000 AND 9999 THEN '6k-9.9k'
WHEN monthly_income BETWEEN 10000 AND 14999 THEN '10k-14.9k'
ELSE '15k+'
END 


ORDER BY attrition_rate DESC;

SELECT
attrition,
COUNT(*) AS employee_count,
ROUND(AVG(monthly_income), 2) AS _monthly_income
FROM hr_employee_attrition
GROUP BY attrition;


SELECT
CASE
WHEN job_satisfaction IN (1, 2) THEN 'Low Satisfaction'
WHEN job_satisfaction IN (3, 4) THEN 'High Satisfaction'
END AS satisfaction_group,

COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS attrition_rate

FROM hr_employee_attrition

GROUP BY 
CASE
WHEN job_satisfaction IN (1, 2) THEN 'Low Satisfaction'
WHEN job_satisfaction IN (3, 4) THEN 'High Satisfaction'
END 
ORDER BY attrition_rate DESC;

SELECT
CASE
WHEN work_life_balance IN (1, 2) THEN 'Poor/Low'
WHEN work_life_balance IN (3, 4) THEN 'Good/High'
END AS work_life_balance_group,

COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*), 
2
) AS attrition_rate

FROM hr_employee_attrition
GROUP BY 
CASE
WHEN work_life_balance IN (1, 2) THEN 'Poor/Low'
WHEN work_life_balance IN (3, 4) THEN 'Good/High'
END 

ORDER BY attrition_rate DESC;

SELECT
CASE
WHEN years_at_company < 2 THEN 'Less Than 2 Years'
WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 Years'
WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10'
WHEN years_at_company BETWEEN 11 AND 20 THEN '11-20'
ELSE '20+ Years'
END AS tenure_group,

COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS attrition_rate

FROM hr_employee_attrition

GROUP BY
CASE
WHEN years_at_company < 2 THEN 'Less Than 2 Years'
WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 Years'
WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10'
WHEN years_at_company BETWEEN 11 AND 20 THEN '11-20'
ELSE '20+ Years'
END

ORDER BY attrition_rate DESC;

SELECT
job_level,
COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS attrition_rate

FROM hr_employee_attrition
GROUP BY job_level
ORDER BY attrition_rate DESC;

SELECT
CASE
WHEN years_since_last_promotion < 1 THEN 'Less Than 1 Year'
WHEN years_since_last_promotion BETWEEN 1 AND 2 THEN '1-2 Years'
WHEN years_since_last_promotion BETWEEN 2 AND 3 THEN '2-3 Years'
WHEN years_since_last_promotion BETWEEN 3 AND 4 THEN '3-4 Years'
WHEN years_since_last_promotion BETWEEN 4 AND 5 THEN '4-5 Years'
ELSE '5+ Years'
END AS years_since_last_promotion_group,

COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS attrition_rate

FROM hr_employee_attrition
GROUP BY
CASE
WHEN years_since_last_promotion < 1 THEN 'Less Than 1 Year'
WHEN years_since_last_promotion BETWEEN 1 AND 2 THEN '1-2 Years'
WHEN years_since_last_promotion BETWEEN 2 AND 3 THEN '2-3 Years'
WHEN years_since_last_promotion BETWEEN 3 AND 4 THEN '3-4 Years'
WHEN years_since_last_promotion BETWEEN 4 AND 5 THEN '4-5 Years'
ELSE '5+ Years'
END

ORDER BY attrition_rate DESC;

SELECT
CASE
WHEN years_with_curr_manager < 2 THEN 'Less Than 2 Years'
WHEN years_with_curr_manager BETWEEN 2 AND 5 THEN '2-5 Years'
WHEN years_with_curr_manager BETWEEN 6 AND 10 THEN '6-10 Years'
ELSE '10+ Years'
END AS years_with_curr_manager_group,

COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS attrition_rate

FROM hr_employee_attrition
GROUP BY
CASE
WHEN years_with_curr_manager < 2 THEN 'Less Than 2 Years'
WHEN years_with_curr_manager BETWEEN 2 AND 5 THEN '2-5 Years'
WHEN years_with_curr_manager BETWEEN 6 AND 10 THEN '6-10 Years'
ELSE '10+ Years'
END
ORDER BY attrition_rate DESC;

SELECT
    num_companies_worked,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY num_companies_worked

ORDER BY num_companies_worked;

SELECT
    CASE
        WHEN distance_from_home <= 5 THEN '0-5 km'
        WHEN distance_from_home BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN distance_from_home BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '20+ km'
    END AS distance_group,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY
    CASE
        WHEN distance_from_home <= 5 THEN '0-5 km'
        WHEN distance_from_home BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN distance_from_home BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '20+ km'
    END

ORDER BY attrition_rate DESC;

SELECT
    job_involvement,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY job_involvement

ORDER BY job_involvement;

SELECT
    environment_satisfaction,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY environment_satisfaction

ORDER BY environment_satisfaction;

SELECT
    relationship_satisfaction,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY relationship_satisfaction

ORDER BY relationship_satisfaction;

SELECT
    education_field,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY education_field

ORDER BY attrition_rate DESC;

SELECT
    marital_status,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY marital_status

ORDER BY attrition_rate DESC;	

SELECT
    overtime,

    CASE
        WHEN monthly_income < 3000 THEN 'Below 3K'
        WHEN monthly_income BETWEEN 3000 AND 5999 THEN '3K-5.9K'
        WHEN monthly_income BETWEEN 6000 AND 9999 THEN '6K-9.9K'
        WHEN monthly_income BETWEEN 10000 AND 14999 THEN '10K-14.9K'
        ELSE '15K+'
    END AS income_group,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY
    overtime,
    CASE
        WHEN monthly_income < 3000 THEN 'Below 3K'
        WHEN monthly_income BETWEEN 3000 AND 5999 THEN '3K-5.9K'
        WHEN monthly_income BETWEEN 6000 AND 9999 THEN '6K-9.9K'
        WHEN monthly_income BETWEEN 10000 AND 14999 THEN '10K-14.9K'
        ELSE '15K+'
    END

ORDER BY attrition_rate DESC;


SELECT
    overtime,

    CASE
        WHEN job_satisfaction IN (1, 2) THEN 'Low Satisfaction'
        WHEN job_satisfaction IN (3, 4) THEN 'High Satisfaction'
    END AS satisfaction_group,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY
    overtime,
    CASE
        WHEN job_satisfaction IN (1, 2) THEN 'Low Satisfaction'
        WHEN job_satisfaction IN (3, 4) THEN 'High Satisfaction'
    END

ORDER BY attrition_rate DESC;

SELECT
job_role,
overtime,

COUNT(*) AS total_employees,

SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) AS attrition_count,

ROUND(
SUM(
CASE
WHEN attrition = 'Yes' THEN 1
ELSE 0
END
) * 100.0 / COUNT(*), 
2
) AS attrition_rate

FROM hr_employee_attrition
GROUP BY job_role,
overtime
ORDER BY attrition_rate DESC;

-- ## 1st insights
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee_attrition;

-- 2nd Insights
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;

-- 3rd Insights
SELECT
    job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee_attrition
GROUP BY job_role
ORDER BY attrition_rate DESC;
-- 4th Insights
SELECT
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee_attrition
GROUP BY overtime
ORDER BY attrition_rate DESC;
-- 5th Insights
SELECT
    CASE
        WHEN years_at_company < 2 THEN 'Less than 2 Years'
        WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 Years'
        WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN years_at_company BETWEEN 11 AND 20 THEN '11-20 Years'
        ELSE '20+ Years'
    END AS tenure_group,

    COUNT(*) AS total_employees,

    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,

    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS attrition_rate

FROM hr_employee_attrition

GROUP BY
    CASE
        WHEN years_at_company < 2 THEN 'Less than 2 Years'
        WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 Years'
        WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN years_at_company BETWEEN 11 AND 20 THEN '11-20 Years'
        ELSE '20+ Years'
    END

ORDER BY attrition_rate DESC;