create table Ordeer(
SL int,
FirstName varchar(10),
LastName varchar(10),
OrderPrice int,
OrderDate date
);
insert into Ordeer values (1, 'John', 'Smith', 700, '07/27/2020')
insert into Ordeer values (2, 'David', 'Johnson', 600, '08/02/2019')
insert into Ordeer values (3, 'Maria', 'Lopez', 125, '02/16/2020')
insert into Ordeer values (4, 'Ronald', 'Lee', 226, '05/20/2018')
insert into Ordeer values (5, 'John', 'Smith', 350, '10/07/2018')
insert into Ordeer values (6, 'David', 'Johnson', 480, '10/11/2018')

drop table Ordeer
Select *from Ordeer;

--1
Select count(distinct FirstName) as CustomerNumber from Ordeer;

--2
select sum (OrderPrice) as TotalPrice from Ordeer;

--3
select FirstName, LastName from Ordeer 
where OrderPrice = (select max(OrderPrice) from Ordeer)

--4
Select * from Ordeer
where  OrderDate between '05/20/2018' and '10/11/2018'
and OrderPrice = (select min(OrderPrice) from Ordeer where  OrderDate between '05/20/2018' and '10/11/2018');

--5
select LastName, avg (OrderPrice) from Ordeer where LastName='Smith' group by LastName;
 
--6
select FirstName, LastName from Ordeer where FirstName Like 'M%' and LastName Like '%z'

--7
Select FirstName, len(FirstName) as Lenght from Ordeer; 

--8
select FirstName, LastName, concat(FirstName, LastName) from Ordeer
where OrderPrice > 500
