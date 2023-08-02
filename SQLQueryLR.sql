Create database Lab_Report;
Use Lab_Report;

Create table Hospital (H_ID int not NULL, H_Name varchar(50), H_Address varchar(50), Primary key  (H_ID));
Select * from Hospital;

Create table Doctor (D_ID int not NULL, D_Name varchar(50), D_Salary int, Qualification varchar(500), H_ID int,
Primary key (D_ID),
Foreign Key (H_ID) references Hospital (H_ID));
Select * from Doctor;

Create Table Patient (P_ID int not NULL, P_Name varchar(50), P_Address varchar(50), P_Mobile int, H_ID int, D_ID int,
Primary key (P_ID),
Foreign Key (H_ID) references Hospital (H_ID),
Foreign Key (D_ID) references Doctor (D_ID));
Select * from Patient;

Create table Medical_Record (Record_ID int not NULL, Date_of_Exanimation Date, Problem varchar(500),
Primary key (Record_Id),
Foreign Key (Record_id) references Patient (P_ID));
Select * from Medical_Record;

Create table Bill (Bill_ID int not NULL, P_ID int, No_of_Days Float, Room_Charge Float, Doctor_Charge Float, Medicine_Cost Float,
Primary key (Bill_ID),
Foreign key (P_ID) references Patient (P_ID));
Select * from Bill;


drop table Patient;
drop table Hospital;
drop table Medical_Record;
drop table Doctor;