create table teacher_info(
TID int,
FirstName varchar(15),
LastName varchar(15),
Dept varchar(10),
Age int,
Salary Float
)
insert into teacher_info values (1,'Mizanur','Rahman','CSE',28,35000)
insert into teacher_info values (2,'Meraj','Ali','CSE',26,33000)
insert into teacher_info values (3,'Shafiul','Islam','EEE',24,30000)
insert into teacher_info values (4,'Faisal','Imran','CSE',30,50000)
insert into teacher_info values (5,'Ahsan','Habib','English',28,28000)
insert into teacher_info values (5,'Ahsan','Habib','English',28,28000)
insert into teacher_info values (6,'Faisa','Imra','CS',31,50000)
select * from teacher_info;
select * from teacher_info where Salary IN (
select Salary from teacher_info 
group by Salary 
having count(Salary) > 1
)
order by Salary;

update teacher_info
set Salary=Salary*1.05 where Salary < 32000;

drop table teacher_info;

create table dept_info(
deptID int,
deptName varchar(10),
location varchar(15),
)
insert into dept_info values (1,'CSE','Talaimari')
insert into dept_info values (2,'EEE','Talaimari')
insert into dept_info values (3,'English','Kazla')
insert into dept_info values (4,'BBA','Talaimari')
select * from dept_info;
drop table dept_info;

--1
update teacher_info
set Salary=
case
when Dept='CSE'
then Salary*1.15
when Dept='EEE'
then Salary*1.1
when Dept='English'
then Salary*1.1
end
where Dept='CSE' or Dept='EEE' or Dept='English'

--2
select FirstName, LastName, concat(FirstName, LastName) as FullName, age from teacher_info
where Salary=(Select max(Salary) from teacher_info)

--3
select TID,FirstName from teacher_info
where Salary < (Select avg(Salary) from teacher_info)

--4
delete TID from teacher_info
where Age in (Select Age from teacher_info where Age>25)

--5
Update teacher_info Set Dept = 'English'
where Dept in (Select Dept from teacher_info where Dept = 'EEE')

--6
Update teacher_info Set Salary = Salary*100
where Salary in (Select Salary from teacher_info where Salary>5000)

--7
Select FirstName, Salary from teacher_info
where Dept = 'CSE' and Salary > (Select Salary from teacher_info where FirstName = 'Meraj') 

--8
Select TID, FirstName, LastName from teacher_info
where Dept = (Select Dept from teacher_info where FirstName = 'Meraj' and Dept = 'CSE' and Age = 26) 

--9
select TID, Salary, deptName from teacher_info, dept_info
where teacher_info.Salary > (Select avg(Salary) from teacher_info)

--10
Select Dept, min(Salary) as Minimum from teacher_info
group by Dept
Having min(Salary) < (Select avg(Salary) from teacher_info)

--11
Select FirstName, LastName, Dept from teacher_info
where Dept = (Select DeptName from dept_info Where Location = 'Kazla')

--12
Select TID, FirstName, Salary from teacher_info
where FirstName in (Select FirstName from teacher_info where len(FirstName)>=6)