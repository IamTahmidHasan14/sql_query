Create database Day10;
use Day10;
Create Table tblEmp(
EmpID int,
EmpName varchar(20),
EmpSalary float,
EmpJoinDate date
)
insert into tblEmp values(02345, 'Rasel', 25000, '2018-01-01')
insert into tblEmp values(02452, 'Nishan', 15000, '2018-05-15')
insert into tblEmp values(02666, 'Munira', 32000, '2019-01-15')
insert into tblEmp values(02788, 'Sadia', 45000, '2019-02-20')
select * from tblEmp;

Create Table student(
SID int,
SNAME varchar(20),
CGPA float,
Dept varchar(10)
)
insert into student values(13331005, 'Sara', 3.95, 'CSE')
insert into student values(13331010, 'Jackson', 3.44, 'EEE')
insert into student values(13232022, 'Wahid', 3.60, 'CSE')
insert into student values(13331017, 'Michel', 3.58, 'CIVIL')
Select * from student;

--1
Create Proc EmpBySalary
As
Begin
	Select EmpSalary from tblEmp
End
Exec EmpBySalary

--2
Create Proc CGPAOfStudentsByDept
@Dept varchar(10),
@S_Highest float output
As
Begin
	Select @S_Highest=(Select Max(CGPA) from student where CGPA < (Select Max(CGPA) from student where Dept=@dept))
End

Declare @Second float
Exec CGPAOfStudentsByDept 'CSE', @Second output
Print @Second

--3
Create Proc EmpJoiningDate
@Amount float,
@Name varchar(15) output
As
Begin
	Select @Name=EmpName from tblEmp where EmpJoinDate < dateadd(month,-6,getdate()) and EmpSalary> @Amount
End

Declare @Names varchar(15);
Exec EmpJoiningDate 20000, @Names Output;
print @Names;

--4
Sp_Depends tblEmp;
Sp_Depends student;