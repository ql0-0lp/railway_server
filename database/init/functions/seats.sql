CREATE OR REPLACE FUNCTION add_seats(_seat_num int, _fk_van_id int)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO seats(seat_num, fk_van_id)
		VALUES (_seat_num, _fk_van_id);
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM add_train_model('М302', 28);
SELECT * FROM add_train_model('М303', 30);

SELECT * FROM train_model;	

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_seats(_seat_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM seats WHERE seat_id = _seat_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM delete_train_model(1);

------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_seats(_seat_id int, _seat_num int, _fk_van_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE seats SET seat_num = seat_num, fk_van_id = _fk_van_id
		WHERE seat_id = _seat_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM update_train_model(3, 'М302', 30);
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
