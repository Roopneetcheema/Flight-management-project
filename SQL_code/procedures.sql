create or replace PROCEDURE GetPassengerLuggage(
    passenger_id_param IN NUMBER
)
IS
    v_passenger_name passenger_details.passenger_name%TYPE;
BEGIN
    -- Get passenger name
    SELECT passenger_name 
    INTO v_passenger_name
    FROM passenger_details
    WHERE id_pass = passenger_id_param;

    DBMS_OUTPUT.PUT_LINE('Passenger: ' || v_passenger_name);

    -- Loop luggage
    FOR luggage_rec IN (
        SELECT luggage_id, weight_kg, description
        FROM luggage
        WHERE passenger_id = passenger_id_param
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Luggage ID: ' || luggage_rec.luggage_id ||
            ', Weight: ' || luggage_rec.weight_kg ||
            ' kg, Description: ' || luggage_rec.description
        );
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Passenger not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
create or replace PROCEDURE sal_incr(
    id_no IN crew_details.crew_id%TYPE,
    par IN NUMBER
)
IS
BEGIN
    UPDATE crew_details
    SET sal = sal + (sal * par / 100)
    WHERE crew_id = id_no;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No crew found');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Crew ID: ' || id_no);
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/