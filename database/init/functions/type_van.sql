CREATE OR REPLACE FUNCTION add_type_van(_type_van_name varchar(128), _seat_count int)
RETURNS VOID AS
$BODY$
	BEGIN
		INSERT INTO type_van(type_van_name, seat_count)
		VALUES (_type_van_name, _seat_count);
	END;
$BODY$
LANGUAGE plpgsql;


SELECT * FROM add_type_van('Купе', 65);

SELECT * FROM type_van;
------------------------------------------- ADD DATA TO type_van TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_type_van(_type_van_name varchar(128))
RETURNS VOID AS
$$
	BEGIN
		DELETE FROM type_van WHERE type_van_name = _type_van_name;
	END;
$$
LANGUAGE plpgsql;

SELECT * FROM delete_type_van('Купе')
------------------------------------------- DELETE DATA FROM human TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_type_van(_type_van_name varchar(128), _seat_count int)
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE type_van SET seat_count = _seat_count
		WHERE type_van_name = _type_van_name;
	END;
$BODY$
LANGUAGE plpgsql;
					
SELECT * FROM update_type_van('Купе', 50);
------------------------------------------- UPDATE DATA FOR human TABLE -------------------------------------------


