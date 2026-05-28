select * from hr_attrition_new limit 5;

-- Q1: Which departments have the highest attrition rate?

select Department,
count(*) as total_employees,
sum(case when Attrition = "Yes" then 1 else 0 end) as Attrited,
round(sum(case when Attrition = "Yes" then 1 else 0 end) * 100/ count(*), 1) as Attrition_Percentage
from hr_attrition_new
group by Department
order by Attrition_Percentage;

-- Q2: Does overtime significantly increase attrition risk?

select OverTime,
count(*) as total_employees,
sum(case when Attrition = "Yes" then 1 else 0 end) as Number_of_Employees_Left,
round(sum(case when Attrition = "Yes" then 1 else 0 end)*100/count(*), 1) as Attrition_rate
from hr_attrition_new
group by OverTime;

-- Q3: Top 5 job roles by average monthly income (leavers vs stayers)

with role_summary as(
	select
		JobRole,
        Attrition,
        round(avg(MonthlyIncome),0) as Avg_Income,
        count(*) as headcount
	from hr_attrition_new
	group by JobRole,Attrition
)
select * from role_summary
order by JobRole,Attrition;

-- Q4: Which income band has highest attrition? (using window function)

with income_summ as(
	select
		case
			when MonthlyIncome < 3000 then 'low(<3k)'
            when MonthlyIncome < 6000 then 'mid(3k-6k)'
            when MonthlyIncome < 10000 then 'high(6k-10k)'
            else 'Very High(10k+)'
		end as income_band,
        count(*) as total,
        sum(case when Attrition = 'Yes' then 1 else 0 end) as Attrited,
        round(sum(case when Attrition = 'Yes' then 1 else 0 end)*100/count(*), 1) as Attrition_PCTG 
		from hr_attrition_new
        group by income_band
)
select income_band, total, Attrited, Attrition_Rate,
rank()over(order by Attrition_Rate desc) as Attr_Risk_Rank
from income_summ;

-- Q5: Employees at highest attrition risk (multi-factor)
-- Criteria: overtime=Yes, JobSatisfaction<=2, YearsAtCompany<=3

SELECT 
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome,
    JobSatisfaction,
    OverTime,
    YearsAtCompany,
    Attrition AS actual_outcome
FROM hr_attrition_new
WHERE OverTime = 'Yes' 
  AND JobSatisfaction <= 2 
  AND YearsAtCompany <= 3
ORDER BY MonthlyIncome ASC
LIMIT 20;


