-- FUNCTION: public.archive_booking()

-- DROP FUNCTION IF EXISTS public.archive_booking();

CREATE OR REPLACE FUNCTION public.archive_booking()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    INSERT INTO booking_archive (BookingID, CustomerID, HotelID, RoomID, Payment, PricePaid, CheckIn, CheckOut, ArchivalReason)
    VALUES (OLD.BookingID, OLD.CustomerID, OLD.HotelID, OLD.RoomID, OLD.Payment, OLD.PricePaid, OLD.CheckIn, OLD.CheckOut, 'Deleted from booking table');
    RETURN OLD;
END;
$BODY$;

CREATE TRIGGER booking_delete_trigger
AFTER DELETE ON booking
FOR EACH ROW
EXECUTE FUNCTION archive_booking();

ALTER FUNCTION public.archive_booking()
    OWNER TO postgres;
