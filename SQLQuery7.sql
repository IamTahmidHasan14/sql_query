Create table Quotations(
Person varchar(25),
Quotation varchar(500),
Year Int
);

--1
insert into Quotations values ('Paulo Coelho', (HASHBYTES('sha1','"When Someone leaves, its because someone else is about to arive"')), 1993)
insert into Quotations values ('Mitch Albom', (HASHBYTES('sha1','"All endings are also beginnings. We just dont know at at the time"')), 1998)
insert into Quotations values ('J.K.Rowling', (HASHBYTES('sha1','"It is our choices that show what we truely are, far more than our abilities"')), 1987)
insert into Quotations values ('Paulo Coelho', (HASHBYTES('sha1','"Be brave and take risk. Nothing can substitute experience"')), 1980)
insert into Quotations values ('Vernica', (HASHBYTES('sha1','"Fear doesnt shut you down; it wakes you up"')), 1983)
Select * from Quotations;

--2
Select Quotation, Year from Quotations where Person='Paulo Coelho' and Year<1990;

Create table Employee(
JobID int,
Name varchar(50),
DeptID Int
);
insert into Employee Values (2340,'Jackson',333)
insert into Employee Values (6002,'Sara',444)
insert into Employee Values (7845,'Maria',333)
insert into Employee Values (8547,'Ronald',999)
insert into Employee Values (1245,'Kafi', 444)
select * from Employee;

Create table InfoEmp(
ID int,
Name varchar(50),
Position varchar(10),
Join_Date Date
);
insert into InfoEmp values (3256,'Ronald','CEO','2021-02-12')
insert into InfoEmp values (7845,'Maria','PO','2021-08-11')
insert into InfoEmp values (1245,'Kafi','AE','2021-06-15')
insert into InfoEmp values (3256,'Jenelia','ME','2021-01-31')
insert into InfoEmp values (8547,'Mehta','PO','2021-12-25')
select * from InfoEmp;

--3
Select * from Employee,InfoEmp where DeptID > 400 and Join_Date <= DATEADD(Month,-6, GETDATE())

--4
Update InfoEmp
Set Position='SuperBoss'
where Position='PO' and Join_Date <= DATEADD(Month,-6, GETDATE())
