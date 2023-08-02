CREATE  TABLE  Train_times(
Start_location varchar(75),
Destination varchar(75),
Departs time,
Arrives time
);

ALTER TABLE Train_times 
ADD run_at_weekends char(1);
ALTER TABLE Train_times
DROP COLUMN run_at_weekends;

DROP TABLE Train_times;

INSERT INTO Train_times VALUES('Edminton','Richmond','10:15','19:40');

UPDATE Train_times SET Arrives = '20:40' WHERE Destination = 'Richmond';

DELETE FROM Train_times
WHERE Destination = 'Richmond';

--Task 1
select *from Train_times;

UPDATE Train_times
SET Departs = '2:45'
WHERE Destination = 'Wayvelle' OR Destination = 'Glandore';

UPDATE Train_times
SET Arrives = '20:45'
WHERE Start_location = 'Edminton' OR Destination = 'Richmond';
