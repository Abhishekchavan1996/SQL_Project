Create Database MegaProject;
Use MegaProject;

Create Table EmployeeDetail(
EmployeeID Int,
FirstName Varchar(20),
LastName Varchar(20),
Salary Money,
Joining_Date Datetime,
Department Varchar(20),
Gender varchar(10)
);

Insert Into EmployeeDetail Values(1,'Vikas','Ahlawat',600000,'02/12/2013 11:16','IT','Male')
Insert Into EmployeeDetail Values(2,'Nikita','Jain',530000,'02/14/2013 11:16','HR','Female')
Insert Into EmployeeDetail Values(3,'Ashish','Kumar',1000000,'02/14/2013 11:16','IT','Male')
Insert Into EmployeeDetail Values(4,'Nikhil','Sharma',480000,'02/15/2013 11:16','HR','Male')
Insert Into EmployeeDetail Values(5,'Anish','Kadian',500000,'02/16/2013 11:16','Paroll','Male');

Select * From EmployeeDetail;

Select FirstName From EmployeeDetail;

Select Upper(FirstName) as FirstName From EmployeeDetail;

Select Upper(LastName) as LastName From EmployeeDetail;

Select concat(FirstName,' ',LastName) as Name From EmployeeDetail;

Select EmployeeID, FirstName, LastName, Salary, Joining_Date, Department, Gender From EmployeeDetail Where FirstName = 'Vikas';

Select EmployeeID, FirstName, LastName, Salary, Joining_Date, Department, Gender From EmployeeDetail Where FirstName like 'a%';

Select EmployeeID, FirstName, LastName, Salary, Joining_Date, Department, Gender From EmployeeDetail Where LastName like 'a%';

Select EmployeeID, FirstName, LastName, Salary, Joining_Date, Department, Gender From EmployeeDetail Where FirstName like '%h';

Select * From EmployeeDetail Where FirstName like '[a-p]%';

Select * From EmployeeDetail Where FirstName Not like '[a-p]%';

Select * From EmployeeDetail Where Gender like '____le';

Select * From EmployeeDetail Where FirstName like 'A____';

Select * From EmployeeDetail Where FirstName like 'Vikas';

Select Distinct Department From EmployeeDetail;

Select Max (Salary) From EmployeeDetail;

Select Min (Salary) From EmployeeDetail;

Select DATE(Joining_Date, '%D %b %Y') From EmployeeDetail;

Select TIME(Joining_Date) From EmployeeDetail;

Select YEAR(Joining_Date) From EmployeeDetail;

Select MONTH(joining_Date) From EmployeeDetail;

Select * From EmployeeDetail Where Year(joining_Date) = 2013;

Select * From EmployeeDetail Where EmployeeID = 1;

Select * From EmployeeDetail Where FirstName IN ('Vikas' ,'Ashish', 'Nikhil');

Select * From EmployeeDetail Where FirstName Not IN ('Vikas' ,'Ashish', 'Nikhil');

Select FirstName,CASE 
When Gender = 'Male' Then 'M'
When Gender = 'Female' Then 'F'
End As Gender
From EmployeeDetail;

Select Concat('Hello ',FirstName) From EmployeeDetail;

Select * From EmployeeDetail Where Salary > 600000;

Select * From EmployeeDetail Where Salary < 700000;

Select * From EmployeeDetail Where Salary Between 500000 and 600000;

Create Table ProjectDetail(
ProjectDetailID int,
EmployeeDetailID int,
ProjectName Varchar(20)
);

Insert Into ProjectDetail Values(1,1,'Task Track')
Insert Into ProjectDetail Values(2,1,'CLP')
Insert Into ProjectDetail Values(3,1,'Survey Management')
Insert Into ProjectDetail Values(4,2,'HR Management')
Insert Into ProjectDetail Values(5,3,'Task Track')
Insert Into ProjectDetail Values(6,3,'GRS')
Insert Into ProjectDetail Values(7,3,'DDS')
Insert Into ProjectDetail Values(8,4,'HR Management')
Insert Into ProjectDetail Values(9,6,'GL Management');

Select * From ProjectDetail;

Select Department, Sum (Salary) From EmployeeDetail Group by Department;

Select Department, Sum (Salary) From EmployeeDetail Group by Department Order by Sum (salary)ASC;

Select Department, Sum (Salary) From EmployeeDetail Group by Department Order by Sum (salary)DESC;

Select Department, Count (*) AS TotalDepartment, SUM(Salary) AS TotalSalary
FROM EmployeeDetail GROUP BY Department;

Select Department, Avg (Salary) From EmployeeDetail Group by Department Order by Avg (salary)ASC;

Select Department, Max (Salary) From EmployeeDetail Group by Department Order by Max (salary)ASC;

Select Department, Min (Salary) From EmployeeDetail Group by Department Order by Min (salary)ASC;

Select Department, Min(Salary) AS MinimumSalary
From EmployeeDetail Group by Department Order by MinimumSalary ASC;

Select * From EmployeeDetail
JOIN ProjectDetail ON 
EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;

Select EmployeeDetail.FirstName, ProjectDetail.ProjectName
From EmployeeDetail
JOIN ProjectDetail ON 
EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
ORDER bY EmployeeDetail.FirstName;

Select EmployeeDetail.FirstName, ProjectDetail.ProjectName
From EmployeeDetail
LEFT JOIN ProjectDetail ON 
EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
Order by EmployeeDetail.FirstName;

Select EmployeeDetail.FirstName, COALESCE(ProjectDetail.ProjectName, '-No Project Assigned') AS ProjectName
From EmployeeDetail
LEFT JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
Order by EmployeeDetail.FirstName;

Select EmployeeDetail.FirstName, ProjectDetail.ProjectName
From EmployeeDetail
LEFT JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;

Select EmployeeDetail.FirstName AS EmployeeName, ProjectDetail.ProjectName
From EmployeeDetail
JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
Group by EmployeeDetail.FirstName, ProjectDetail.ProjectName
Having COUNT (ProjectDetail.ProjectName) > 1;

Select EmployeeID, FirstName, LastName, Salary, Joining_Date, Department, Gender, ProjectDetailID, EmployeeDetailID, ProjectName
From EmployeeDetail,ProjectDetail;