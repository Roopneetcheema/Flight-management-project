SELECT crew_id, crew_name, gender, job, hiredate, sal, comm
FROM crew_details
WHERE UPPER(gender) = 'MALE';

DELETE FROM vip_passengers
WHERE flight_no = 'AI102';

UPDATE seat_status
SET business_class_price = 15000
WHERE flight_no = 'AI101';

SELECT fd.flight_name, s.total_seats
FROM flight_details fd
JOIN seat_status s 
ON fd.flight_no = s.flight_no
WHERE fd.flight_no = 'AI101';