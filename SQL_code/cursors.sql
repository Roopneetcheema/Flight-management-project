
DECLARE
    CURSOR fetch1(p_origin VARCHAR2, p_dest VARCHAR2, p_date DATE) IS
        SELECT flight_no, flight_name, origin, destination,
               departure_date, departure_time, arrival_time,
               total_distance, flight_duration, status
        FROM flight_details
        WHERE origin = p_origin
          AND destination = p_dest
          AND TRUNC(departure_date) = TRUNC(p_date);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Flight Details ---');

    FOR x IN fetch1('Delhi','Mumbai',DATE '2024-04-24')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            x.flight_no || ' | ' ||
            x.flight_name || ' | ' ||
            x.origin || ' -> ' || x.destination || ' | ' ||
            x.departure_date || ' | ' ||
            x.status
        );
    END LOOP;
END;
/

DECLARE
    CURSOR fetch2(p_flight VARCHAR2, p_date DATE) IS
        SELECT flight_no, passenger_name, email, phone, gender, booking_date
        FROM passenger_details
        WHERE flight_no = p_flight
          AND TRUNC(booking_date) = TRUNC(p_date);

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Passenger Details ---');

    FOR x IN fetch2('AI101', SYSDATE)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            x.passenger_name || ' | ' ||
            x.email || ' | ' ||
            x.phone || ' | ' ||
            x.gender
        );
    END LOOP;
END;
/


DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM passenger_preferences
    WHERE UPPER(meal_preference) = 'VEG';

    DBMS_OUTPUT.PUT_LINE('Vegetarian Count: ' || v_count);
END;
/



