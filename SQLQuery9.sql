create database Day9
use Day9

create table tblEmp(
EmpID int not null,
EmpName varchar(15),
EmpSalary float,
EmpJoinDate date,
primary key(EmpID)
);
Insert into tblEmp values(02345,'Rasel',25000,'2018-01-01')
Insert into tblEmp values(02452,'Nishan',15000,'2018-05-15')
Insert into tblEmp values(02666,'Munira',32000,'2019-01-15')
Insert into tblEmp values(02788,'Sadia',45000,'2019-02-20')
Select * from tblEmp;

Create Table tblDept(
ID int not null,
District varchar(15),
Dept varchar(10)
)
Insert into tblDept values(02345, 'Dhaka', 'IT')
Insert into tblDept values(02666, 'Rajshahi', 'IT')
Insert into tblDept values(03562, 'Rajshahi', 'HR')
Insert into tblDept values(02587, 'Khulna', 'PO')
Select * from tblDept;

create table Industry(
Industry varchar(20),
Industry_Code int not null,
Employees int,
Anual_income varchar(10),
primary key (Industry_Code)
)
Insert into Industry values('ACI', 1234, 200, '$150')
Insert into Industry values('SK-F', 3254, 150, '$2563')
Insert into Industry values('RFL', 1489, 117, '$4857')
Insert into Industry values('GMG Airlines', 2541, 253, '$3350')
Select * from Industry

--1
Create view EmpDetail
as
Select EmpName, EmpSalary from tblEmp 
where EmpSalary between 15000 and 20000 and EmpName like '%a%'

Select * from EmpDetail

--2
Create view EmpDeptChange
as
Select EmpID, EmpName, EmpSalary, Dept from tblEmp, tblDept
Where tblEmp.EmpID=tblDept.ID

update EmpDeptChange
set Dept = 'Accounts'
where Dept = 'IT' and EmpName = 'Rasel'

Select * from EmpDeptChange

--3
Select Industry from Industry

--4
--Alter Table Industry
--Drop Primary Key

Create Clustered Index CIIndustry_Code
on Industry (Industry_Code)

Create NonClustered Index NCIIndustry_Code
on Industry (Anual_income)

Sp_HelpIndex Industry
