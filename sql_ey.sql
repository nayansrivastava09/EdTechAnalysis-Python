
select * from Ed;

with student_score as 
(
select 
distinct 
Student_Performance_Metric,
PERCENTILE_CONT(0.25) WITHIN GROUP (order by Student_Performance_Metric) over() as Q1 , 
PERCENTILE_CONT(0.75) WITHIN GROUP ( order by Student_Performance_Metric) over() as Q3 
from 
Ed
),
cte as (
select 
Student_Performance_Metric,
Q1 ,
Q3 , 
(Q3-Q1) as 'IQR' ,
Q1-(1.5*(Q3-Q1)) as 'Lower_Bound',
Q3+(1.5*(Q3-Q1)) as 'Upper_Bound'
from student_score
)

select Student_Performance_Metric from  cte where
Student_Performance_Metric<Lower_Bound and Student_Performance_Metric>Upper_Bound

--REPLACE IT FROM AVG

UPDATE Ed
SET Student_Performance_Metric = 
(select  avg(Student_Performance_Metric) from Ed) 
where Student_Performance_Metric is null


---

with grad as
(select 
distinct
Graduation_Rate,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Graduation_Rate) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Graduation_Rate) OVER() Q3
from
Ed
),
cte2 as (
SELECT 
DISTINCT
Graduation_Rate,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
grad)

select Graduation_Rate from cte2
where Graduation_Rate>Upper_Bound and Graduation_Rate<Lower_Bound

UPDATE Ed 
SET Graduation_Rate = (select AVG(Graduation_Rate) from Ed) where Graduation_Rate is null;
---


select * from Ed;

with emp as
(select 
distinct
Employability_Rate,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Employability_Rate) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Employability_Rate) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Employability_Rate,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
emp)

select Employability_Rate from cte_3
where Employability_Rate>Upper_Bound and Employability_Rate<Lower_Bound;

UPDATE Ed
SET Employability_Rate = 
(select  avg(Employability_Rate) from Ed) 
where Employability_Rate is null  


----

with cost as
(select 
distinct
Cost_Per_Student,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Cost_Per_Student) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Cost_Per_Student) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Cost_Per_Student,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
cost)

select Cost_Per_Student from cte_3
where Cost_Per_Student>Upper_Bound and Cost_Per_Student<Lower_Bound;

UPDATE Ed
SET Cost_Per_Student = 
(select  avg(Cost_Per_Student) from Ed) 
where Cost_Per_Student is null  

------------




with stakeholder as
(select 
distinct
Stakeholder_Expectation_Score,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Stakeholder_Expectation_Score) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Stakeholder_Expectation_Score) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Stakeholder_Expectation_Score,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
stakeholder)

select Stakeholder_Expectation_Score from cte_3
where Stakeholder_Expectation_Score>Upper_Bound and Stakeholder_Expectation_Score<Lower_Bound;


UPDATE Ed
SET Stakeholder_Expectation_Score = 
(select  ROUND(avg(Stakeholder_Expectation_Score),0) from Ed) 
where Stakeholder_Expectation_Score =5.08  
---





with tech as
(select 
distinct
Tech_Adoption_Rate,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Tech_Adoption_Rate) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Tech_Adoption_Rate) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Tech_Adoption_Rate,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
tech)

select Tech_Adoption_Rate from cte_3
where Tech_Adoption_Rate>Upper_Bound and Tech_Adoption_Rate<Lower_Bound;



UPDATE Ed
SET Tech_Adoption_Rate = 
(select  avg(Tech_Adoption_Rate) from Ed) 
where Tech_Adoption_Rate is null  
--

select * from Ed;


with emp_en as
(select 
distinct
Employee_Engagement_Score,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Employee_Engagement_Score) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Employee_Engagement_Score) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Employee_Engagement_Score,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
emp_en)

select Employee_Engagement_Score from cte_3
where Employee_Engagement_Score>Upper_Bound and Employee_Engagement_Score<Lower_Bound;

UPDATE Ed
SET Employee_Engagement_Score = 
(select  avg(Employee_Engagement_Score) from Ed) 
where Employee_Engagement_Score is null  
--



with budget as
(select 
distinct
Budget_Allocation,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Budget_Allocation) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Budget_Allocation) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Budget_Allocation,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
budget)

select Budget_Allocation from cte_3
where Budget_Allocation>Upper_Bound and Budget_Allocation<Lower_Bound;

UPDATE Ed
SET Budget_Allocation = 
(select  avg(Budget_Allocation) from Ed) 
where Budget_Allocation is null  

select * from Ed;
--

with rev as
(select 
distinct
Revenue,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Revenue) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Revenue) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Revenue,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
rev)

select Revenue from cte_3
where Revenue>Upper_Bound and Revenue<Lower_Bound;


UPDATE Ed
SET Revenue = 
(select  avg(Revenue) from Ed) 
where Revenue is null 

select * from Ed;


with ai as
(select 
distinct
AI_Personalization_Effectiveness,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By AI_Personalization_Effectiveness) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By AI_Personalization_Effectiveness) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
AI_Personalization_Effectiveness,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
ai)

select AI_Personalization_Effectiveness from cte_3
where AI_Personalization_Effectiveness>Upper_Bound and AI_Personalization_Effectiveness<Lower_Bound;



UPDATE Ed
SET AI_Personalization_Effectiveness = 
(select  avg(AI_Personalization_Effectiveness) from Ed) 
where AI_Personalization_Effectiveness is null ;


SELECT * FROM Ed;


with faculty as
(select 
distinct
Faculty_Retention_Rate,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Faculty_Retention_Rate) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Faculty_Retention_Rate) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Faculty_Retention_Rate,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
faculty)

select Faculty_Retention_Rate from cte_3
where Faculty_Retention_Rate>Upper_Bound and Faculty_Retention_Rate<Lower_Bound;



UPDATE Ed
SET Faculty_Retention_Rate = 
(select  avg(Faculty_Retention_Rate) from Ed) 
where Faculty_Retention_Rate is null ;


select * From Ed;




with work as
(select 
distinct
Workforce_Satisfaction_Index,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Workforce_Satisfaction_Index) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Workforce_Satisfaction_Index) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Workforce_Satisfaction_Index,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
work)


select Workforce_Satisfaction_Index from cte_3
where Workforce_Satisfaction_Index>Upper_Bound and Workforce_Satisfaction_Index<Lower_Bound;--

UPDATE Ed
SET Workforce_Satisfaction_Index = 
(select  round(avg(Workforce_Satisfaction_Index),0) from Ed) 
where Workforce_Satisfaction_Index is null ;

select * From Ed;


with iship as
(select 
distinct
Internship_Completion_Rate,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Internship_Completion_Rate) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Internship_Completion_Rate) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Internship_Completion_Rate,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
iship)

select Internship_Completion_Rate from cte_3
where Internship_Completion_Rate>Upper_Bound and Internship_Completion_Rate<Lower_Bound;



UPDATE Ed
SET Internship_Completion_Rate = 
(select  round(avg(Internship_Completion_Rate),0) from Ed) 
where Internship_Completion_Rate is null ;


select * from Ed;



---

with job as
(select 
distinct
Job_Placement_Rate,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Job_Placement_Rate) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Job_Placement_Rate) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Job_Placement_Rate,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from 
job)

select Job_Placement_Rate from cte_3
where Job_Placement_Rate>Upper_Bound and Job_Placement_Rate<Lower_Bound;



UPDATE Ed
SET Job_Placement_Rate = 
(select  avg(Job_Placement_Rate) from Ed) 
where Job_Placement_Rate is null ;


select * From Ed;



with students_s as
(select 
distinct
Student_Satisfaction_Score,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Student_Satisfaction_Score) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Student_Satisfaction_Score) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Student_Satisfaction_Score,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from students_s)

select Student_Satisfaction_Score from cte_3
where Student_Satisfaction_Score>Upper_Bound and Student_Satisfaction_Score<Lower_Bound;



UPDATE Ed
SET Student_Satisfaction_Score = 
(select  round(avg(Student_Satisfaction_Score),0) from Ed) 
where Student_Satisfaction_Score is null ;


select * From Ed;




with comp as
(select 
distinct
Compliance_Score,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Compliance_Score) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Compliance_Score) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Compliance_Score,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from comp)

select Compliance_Score from cte_3
where Compliance_Score>Upper_Bound and Compliance_Score<Lower_Bound;



UPDATE Ed
SET Compliance_Score = 
(select  avg(Compliance_Score) from Ed) 
where Compliance_Score is null ;


select * From Ed;
with crisis  as
(select 
distinct
Crisis_Management_Index,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Crisis_Management_Index) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Crisis_Management_Index) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Crisis_Management_Index,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from crisis)

select Crisis_Management_Index from cte_3
where Crisis_Management_Index>Upper_Bound and Crisis_Management_Index<Lower_Bound;


UPDATE Ed
SET Crisis_Management_Index = 
(select  avg(Crisis_Management_Index) from Ed) 
where Crisis_Management_Index is null ;


select * From Ed;



select * From Ed;
with cases  as
(select 
distinct
Legal_Case_Count,
PERCENTILE_CONT(0.25) WITHIN GROUP (Order By Legal_Case_Count) OVER() Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (Order By Legal_Case_Count) OVER() Q3
from
Ed
),
cte_3 as (
SELECT 
DISTINCT
Legal_Case_Count,
Q1 , Q3 , (Q3-Q1) AS IQR , Q1-(1.5*(Q3-Q1)) Lower_Bound , Q3+(1.5*(Q3-Q1)) Upper_Bound
from cases)

select Legal_Case_Count from cte_3
where Legal_Case_Count>Upper_Bound and Legal_Case_Count<Lower_Bound;


UPDATE Ed
SET Legal_Case_Count = 
(select  round(avg(Legal_Case_Count),0) from Ed) 
where Legal_Case_Count is null ;


select count(*) , Blockchain_Usage from Ed
group by Blockchain_Usage


UPDATE Ed
set Blockchain_Usage = 1 
WHERE Blockchain_Usage is null;