create table loan(
loan_number varchar(10),
branch_name varchar(10),
amount int
);

insert into loan values('110','ZeroPoint',50000)
insert into loan values('115','Motihar',27000)
insert into loan values('118','Mirpur',30000)

select *from loan;

create table borrower(
customer_Name varchar(10),
loan_Number varchar(10),
);

insert into borrower values('Tripty','105')
insert into borrower values('Nishan','110')
insert into borrower values('Maruf','115')
insert into borrower values('Sohana','118')

select *from borrower;

Create table Depositor(
customer_name varchar(15),
Account_number int
);

insert into Depositor values('Tripty',444)
insert into Depositor values('Proma',555)
insert into Depositor values('Siam',666)
insert into Depositor values('Faysal',999)

select * from Depositor;

--1
(select customer_name from Depositor)union(select customer_name from borrower)

--2
(select customer_name from Depositor)except(select customer_name from borrower)

--3
(select customer_name from depositor)intersect(select customer_name from borrower)

--4
Select Customer_Name, Loan.Loan_Number, Amount
from Loan left join Borrower on Loan.Loan_Number=Borrower.Loan_Number
where Amount < 28000;

create table Branch(
Branch_Name varchar(10),
Branch_city varchar(10),
Assests int,
);

insert into Branch values('Dhanmondi','Dhaka',20000)
insert into Branch values('Banani','Dhaka',40000)
insert into Branch values('Sapahar','Naogaon',50000)
insert into Branch values('Jhautola','Cumilla',5000)
insert into Branch values('Dhanmondi','Dhaka',10000)

select * from Branch;

--5
select Branch_Name	from branchwhere assests > all (select Assests from branchwhere branch_name = 'Dhanmondi')

--6
update Branch
set Assests = Assests * 1.1
where branch_name = 'Dhanmondi'

update Branch
set Assests = Assests * 1.05
where branch_name = 'Banani'

update Branch 
set Assests = Assests * 1.02 
where branch_name != 'Banani' AND branch_name != 'Dhanmondi';
