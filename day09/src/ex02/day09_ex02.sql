CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $trg_person_delete_audit$
    BEGIN
        INSERT INTO person_audit(created, type_event ,row_id, name, age, gender, address)  SELECT now(), 'D' , OLD.*;
        RETURN OLD;
    END;
$trg_person_delete_audit$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;