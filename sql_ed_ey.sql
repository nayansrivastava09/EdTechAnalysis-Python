SELECT * FROM Ey

EXEC sp_rename 'Ed', 'Ey';


ALTER TABLE Ey ADD Cost_Per_Students VARCHAR(20);

select 
CASE 
WHEN Cost_Per_Student>=3000 and Cost_Per_Student<=6000 then 'Low'
WHEN Cost_Per_Student>6000  AND Cost_Per_Student<=10000  then 'Medium'
else
'High'
end
From Ey

UPDATE Ey	SET  Cost_Per_Students= CASE 
WHEN Cost_Per_Student>=3000 and Cost_Per_Student<=6000 then 'Low'
WHEN Cost_Per_Student>6000  AND Cost_Per_Student<=10000  then 'Medium'
else
'High'
end

SELECT  * FROM Ey;


ALTER TABLE Ey ADD Tech_Implemented VARCHAR(20);


UPDATE Ey SET Tech_Implemented = CASE WHEN 
Tech_Adoption_Rate<=0.5 then 'Less than avg'
ELSE
'More than Avg'
end;



ALTER TABLE Ey ADD Budhet_Allocated VARCHAR(50);

UPDATE Ey SET Budhet_Allocated = CASE WHEN 
Budhet_Allocated<=2500000 then 'Around 25 lacs'
ELSE
'Around 51 lacs'
end;



ALTER TABLE Ey ADD Revenue_Generated VARCHAR(40);

UPDATE Ey SET Revenue_Generated = CASE WHEN 
Revenue<=3000000 then 'Around 30 lacs'
when Revenue<=6000000 then 'Around 60 lacs'

ELSE
'Around 90 lacs'
end;




ALTER TABLE Ey ADD Student_Satisfaction VARCHAR(40);
UPDATE Ey SET Student_Satisfaction = CASE
When Student_Satisfaction_Score<=3 then 'Low'
When Student_Satisfaction_Score<=6 then 'Medium'
ELSE 
'High'
end;


ALTER TABLE Ey  ADD Internship_Completed VARCHAR(40)

select * from Ey

UPDATE ey
SET Internship_Completed = CASE WHEN 
Internship_Completion_Rate<=40 then '20-40%'
WHEN Internship_Completion_Rate<=60 then '41-60%'
when Internship_Completion_Rate<=80 then '61-80%'
else
'More than 80%'
end;



ALTER TABLE Ey ADD Employee_Satisfaction VARCHAR(40);


UPDATE Ey SET Employee_Satisfaction = CASE
When Workforce_Satisfaction_Index<=3 then 'Low'
When Workforce_Satisfaction_Index<=6 then 'Medium'
ELSE 
'High'
end;

ALTER TABLE Ey ADD Faculty_Retained VARCHAR(40)

UPDATE Ey set Faculty_Retained = case 
when Faculty_Retention_Rate<=60 then '51-60%'
when Faculty_Retention_Rate<=70 then '61-70%'
when Faculty_Retention_Rate<=80 then '71-80%'
when Faculty_Retention_Rate<=90 then '81-90%'
else '91-100%'
end ;

select * from Ey


select count(*)AS 'Total_Cnt'  , Cost_Per_Students   from Ey
group BY  Cost_Per_Students

select avg(Graduation_Rate) as 'avg' from Ey;


select count(*) , Student_Satisfaction
from Ey 
where Blockchain_Usage =1
group by Student_Satisfaction
--
select count(*) , Student_Satisfaction
from Ey 
where Blockchain_Usage =0
group by Student_Satisfaction



select avg(Graduation_Rate) as 'avg'
from Ey 
where Tech_Implemented='Less than avg'


select avg(Graduation_Rate) as 'avg'
from Ey where
Tech_Implemented = 'More than Avg'