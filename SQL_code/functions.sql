create or replace FUNCTION CalculateYearsWorked(
    hiredate_crew IN DATE
) RETURN NUMBER
IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate_crew) / 12);
END;
/
create or replace FUNCTION calculate_price(
    f_flight_no IN VARCHAR2,
    f_class IN VARCHAR2,
    f_total_seats IN NUMBER
) RETURN NUMBER
IS
    v_price NUMBER;
    v_available NUMBER;
BEGIN
    IF UPPER(f_class) = 'BUSINESS' THEN
        SELECT business_class, business_class_price
        INTO v_available, v_price
        FROM seat_status
        WHERE flight_no = f_flight_no;
    ELSE
        SELECT economy_class, economy_class_price
        INTO v_available, v_price
        FROM seat_status
        WHERE flight_no = f_flight_no;
    END IF;

    IF f_total_seats > v_available THEN
        RAISE_APPLICATION_ERROR(-20001, 'Seats not available');
    END IF;

    RETURN v_price * f_total_seats;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Flight not found');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, SQLERRM);
END;
/
create or replace FUNCTION display_total_passengers
RETURN NUMBER
IS
    total_passengers NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_passengers 
    FROM passenger_details;

    RETURN total_passengers;
END;
/
create or replace FUNCTION SegregatePrivileges(
    status_param IN VARCHAR2
) RETURN VARCHAR2
IS
BEGIN
    CASE UPPER(status_param)
        WHEN 'GOLD' THEN
            RETURN 'Priority boarding, Lounge access';
        WHEN 'SILVER' THEN
            RETURN 'Extra baggage allowance';
        WHEN 'PLATINUM' THEN
            RETURN 'Upgrade vouchers, Premium lounge access';
        ELSE
            RETURN 'No privileges defined';
    END CASE;
END;
/