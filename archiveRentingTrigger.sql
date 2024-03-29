-- FUNCTION: public.archive_renting()

-- DROP FUNCTION IF EXISTS public.archive_renting();

CREATE OR REPLACE FUNCTION public.archive_renting()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    INSERT INTO renting_archive (RentingID, CustomerID, RoomID, CheckIn, CheckOut, ArchivalReason)
    VALUES (OLD.RentingID, OLD.CustomerID, OLD.RoomID, OLD.CheckIn, OLD.CheckOut, 'Deleted from renting table');
    RETURN OLD;
END;
$BODY$;

CREATE TRIGGER renting_delete_trigger
AFTER DELETE ON renting
FOR EACH ROW
EXECUTE FUNCTION archive_renting();

ALTER FUNCTION public.archive_renting()
    OWNER TO postgres;
