Create database Day11;
Use Day11;

Create table saleman(
salesman_id int,
name varchar(20),
city varchar(20),
commission float
)
insert into saleman values (5001, 'James Hoog', 'New York', 0.15)
insert into saleman values (5002, 'Nail Knite', 'Paris', 0.13)
insert into saleman values (5005, 'Pit Alex', 'London', 0.11)
insert into saleman values (5006, 'Mc Lyon', 'Pris', 0.14)
Select * from saleman;

Create table customer(
customer_id int,
cust_name varchar(20),
city varchar(20),
grade int,
salesman int
)
insert into customer values (3002, 'Nick Rimando', 'New York', 100, 5001)
insert into customer values (3005, 'Graham Zusi', 'California', 200, 5002)
insert into customer values (3001, 'Brad Guzan', 'London', 200, 5005)
insert into customer values (3004, 'Fabian Johns', 'Paris', 300, 5006)
insert into customer values (3007, 'Brad David', 'New York', 200, 5001)
insert into customer values (3009, 'Geoff Camero', 'Berlin', 100, 5003)
insert into customer values (3008, 'Julian Green', 'London', 300, 5002)
insert into customer values (3003, 'Jozy Alidor', 'Moscow', 200, 5007)
Select * from customer;

Create table Title(
WORKER_REF_ID int,
WORKER_TITLE varchar(20),
AFFECTED_FROM date
)
insert into Title values (1, 'Manager', '2019-02-20')
insert into Title values (2, 'Executive', '2019-06-11')
insert into Title values (8, 'Executive', '2019-06-11')
insert into Title values (5, 'Manager', '2019-06-11')
insert into Title values (4, 'Asst. Manager', '2019-06-11')
insert into Title values (7, 'Executive', '2019-06-11')
insert into Title values (6, 'Lead', '2019-06-11')
insert into Title values (3, 'Lead', '2019-06-11')
Select * from Title;

Create table Worker(
WORKER_ID int,
FIRST_NAME varchar(20),
LAST_NAME varchar(20),
SALARY float,
JOINING_DATE datetime,
DEPARTMENT varchar(20)
)
insert into Worker values (1, 'Rana', 'Hamid', 100000, '2014-02-20 09:00:00', 'HR')
insert into Worker values (2, 'Sanjoy', 'Saha', 80000, '2014-06-11 09:00:00', 'Admin')
insert into Worker values (3, 'Mahmudul', 'Hasan', 300000, '2014-02-20 09:00:00', 'HR')
insert into Worker values (4, 'Asad', 'Zaman', 500000, '2014-02-20 09:00:00', 'Admin')
insert into Worker values (5, 'Sajib', 'Mia', 500000, '2014-06-11 09:00:00', 'Admin')
insert into Worker values (6, 'Alamgir', 'Kabir', 200000, '2014-06-11 09:00:00', 'Account')
insert into Worker values (7, 'Foridul', 'Islam', 75000, '2014-01-20 09:00:00', 'Account')
insert into Worker values (8, 'Keshob', 'Ray', 90000, '2014-04-11 09:00:00', 'Admin')
Select * from Worker;

--1
Select DEPARTMENT, count(WORKER_ID) as Number_of_Workers from Worker group by DEPARTMENT order by DEPARTMENT desc;

--2
Select * from Worker where WORKER_ID%2=1;

--3
Select top 5 Concat (Worker.FIRST_NAME,' ', Worker.LAST_NAME) as Name, Title.WORKER_TITLE from Title, Worker
where Title.WORKER_REF_ID = Worker.WORKER_ID

--4
Select top 3 SALARY from (Select Distinct top 3 SALARY from Worker order by SALARY desc) Result Order by SALARY

--5
Create view Grade_Count (grade, Number_of_Customer)
as Select grade, Count(*)
From Customer Group by grade 

Select * from Grade_Count;

--6
Create view SM
as Select * from Saleman where city='New york' and commission>0.12

Select * from SM

--7
Update Worker
Set SALARY = SALARY*100
where SALARY in (Select SALARY from Worker where SALARY>100000)

Select * from Worker;

--8
Delete from Worker Where SALARY > (Select avg(SALARY) from Worker)

Select * from Worker;
