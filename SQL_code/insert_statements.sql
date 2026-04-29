INSERT INTO flight_details VALUES 
('AI101','Air India','Delhi','Mumbai',DATE '2024-04-24',SYSTIMESTAMP,SYSTIMESTAMP,1400,2.5,'On Time');

INSERT INTO flight_details VALUES 
('AI102','Indigo','Amritsar','Delhi',DATE '2024-04-25',SYSTIMESTAMP,SYSTIMESTAMP,200,1.0,'On Time');

INSERT INTO flight_details VALUES 
('AI103','SpiceJet','Bangalore','Kolkata',DATE '2024-04-26',SYSTIMESTAMP,SYSTIMESTAMP,1500,2.8,'Delayed');


INSERT INTO crew_details VALUES ('C001','John','Male','Pilot',DATE '2020-05-11',50000,10000);
INSERT INTO crew_details VALUES ('C002','Mary','Female','Co-Pilot',DATE '2021-12-10',30000,5000);
INSERT INTO crew_details VALUES ('C003','Gaurav','Male','Ticket Agent',DATE '2022-01-01',20000,5000);


INSERT INTO seat_status VALUES (1,'AI101',20,60,10000,4000,80);
INSERT INTO seat_status VALUES (2,'AI102',30,60,6000,2500,90);
INSERT INTO seat_status VALUES (3,'AI103',40,80,5000,2000,120);


INSERT INTO passenger_details VALUES (101,'AI101','Rahul','rahul@gmail.com','9876543210','Male',SYSDATE);
INSERT INTO passenger_details VALUES (102,'AI102','Priya','priya@gmail.com','9123456780','Female',SYSDATE);
INSERT INTO passenger_details VALUES (103,'AI103','Aman','aman@gmail.com','9988776655','Male',SYSDATE);

INSERT INTO seat_alloted VALUES (1,'AI101',101,'Economy',2,8000);
INSERT INTO seat_alloted VALUES (2,'AI102',102,'Business',1,6000);

INSERT INTO details_cancel VALUES (1,103,SYSDATE);

INSERT INTO airport VALUES ('DEL','Indira Gandhi Airport','Delhi','India');
INSERT INTO airport VALUES ('BOM','Mumbai Airport','Mumbai','India');
INSERT INTO airport VALUES ('BLR','Bangalore Airport','Bangalore','India');

INSERT INTO vip_passengers VALUES (1,'AI101',101,'Gold','Lounge access');
INSERT INTO vip_passengers VALUES (2,'AI102',102,'Platinum','Priority boarding');

INSERT INTO luggage VALUES (1,101,10,'Backpack');
INSERT INTO luggage VALUES (2,102,15,'Suitcase');

INSERT INTO payment_methods VALUES (1,101,'Credit Card','1234567890123456',DATE '2026-12-01','Delhi');
INSERT INTO payment_methods VALUES (2,102,'Debit Card','9876543210987654',DATE '2025-06-01','Mumbai');

INSERT INTO passenger_preferences VALUES (1,101,'Window','Veg','None');
INSERT INTO passenger_preferences VALUES (2,102,'Aisle','Non-Veg','Wheelchair');

INSERT INTO passenger_feedback VALUES (1,101,'Good flight',SYSDATE);
INSERT INTO passenger_feedback VALUES (2,102,'Delayed but okay',SYSDATE);