create or replace TRIGGER "CHECKAIRPORTCOUNTRY" 
BEFORE INSERT OR UPDATE ON airport
FOR EACH ROW
BEGIN
    IF UPPER(:NEW.country) <> 'INDIA' THEN
        RAISE_APPLICATION_ERROR(-20002, 'Only Indian airports allowed');
    END IF;
END;
/
create or replace TRIGGER "CHECKLUGGAGEWEIGHT" 
BEFORE INSERT OR UPDATE ON luggage
FOR EACH ROW
BEGIN
    IF :NEW.weight_kg > 20 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Luggage cannot exceed 20 kg');
    END IF;
END;
/
create or replace TRIGGER "TRIG_DETAILS" 
AFTER DELETE ON passenger_details
FOR EACH ROW
BEGIN
    INSERT INTO details_cancel (
        cancel_id,
        passenger_id,
        passenger_name,
        cancel_date
    )
    VALUES (
        details_cancel_seq.NEXTVAL,
        :OLD.id_pass,
        :OLD.passenger_name,
        SYSDATE
    );
END;
/