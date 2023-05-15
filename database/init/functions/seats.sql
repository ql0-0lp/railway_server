CREATE OR REPLACE FUNCTION add_seats(_seat_num int, _fk_van_id int)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO seats(seat_num, fk_van_id)
		VALUES (_seat_num, _fk_van_id);
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_seats(_seat_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM seats WHERE seat_id = _seat_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_seats(_seat_id int, _seat_num int)
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE seats SET seat_num = _seat_num
		WHERE seat_id = _seat_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION fetch_seats(_fk_van_id int)
    RETURNS TABLE(_seat_num int) AS
$BODY$
BEGIN
    RETURN QUERY
        SELECT seat_num
        FROM seats
        WHERE fk_van_id = _fk_van_id AND state = true
        ORDER BY seat_num;
END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- FETCH DATA FOR trains TABLE -------------------------------------------