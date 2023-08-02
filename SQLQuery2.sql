create table Customer(
Customer_Name varchar(15),
Customer_city varchar(15),
Customer_Country varchar(15),
Account_No varchar(10)
);

insert into Customer values('Galvin', 'Athens', 'Greece', 'AC452')
insert into Customer values('Smith', 'Easter Island', 'Chile', 'AC857')
insert into Customer values('Michel', 'Athens', 'USA', 'AC325')
insert into Customer values('Ronald', 'Baltimore', 'USA', 'AC665')

--2
Alter table Customer Add TimeZone varchar(10);
update Customer
set TimeZone='GMT-4' where Customer_Country='Greece';
update Customer
set TimeZone='GMT-6' where Customer_Country='Chile';
update Customer
set TimeZone='GMT-7' where Customer_Country='USA';

--3
select Customer_Name from Customer
where Customer_Country = 'USA'
Order by Customer_Name asc;

--4
SELECT Customer_Name from loan16 where Amount > (SELECT AVG(Amount)
FROM loan16)

create table Loan16(
Customer_Name varchar(15),
Loan_number varchar(15),
Amount int
);

insert into Loan16 values('Jony', 'L-174', 25000)
insert into Loan16 values('Michel', 'P-857', 32000)
insert into Loan16 values('Ronald', 'K-658', 12580)
insert into Loan16 values('Rakesh', 'J-582', 15000)

create table Student(
Student_name varchar(15),
CGPA float,
Session varchar(15)
);

insert into Student values('Sara', 3.86, 'Summer15')
insert into Student values('Rakesh', 3.24, 'Summer16')
insert into Student values('Wadud', 3.69, 'Spring14')
insert into Student values('Simran', 3.55, 'Fall13')

select *from Customer;
select *from Loan16;
select *from Student;

--5
select COUNT(*) from Customer;

--6
Select Customer_Name from Customer
Union
Select Customer_Name from Loan16;

--7
Select max(Amount) as Maximum,
min(Amount) as Minimum,
avg(Amount) as Avarege
from Loan16;

--8
Select Customer_Name from Customer
Intersect
Select Customer_Name from Loan16;

--9
Select Student_name from Student where CGPA between 3.50 and 3.99

--10
update Loan16
set Amount= Amount+(Amount/10)
where Customer_Name like 'j%' or Customer_Name like 'm%';
select *from Loan16;
