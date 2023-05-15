CREATE OR REPLACE FUNCTION add_van(_van_name VARCHAR(128), _fk_type_van varchar(128), _fk_train_id int)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO van(van_name, fk_type_van, fk_train_id)
		VALUES (_van_name, _fk_type_van, _fk_train_id);
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_van(_van_id INT)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM van WHERE van_id = _van_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_van(_van_id INT, _van_name VARCHAR(128))
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE van SET van_name = _van_name
		WHERE van_id = _van_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION fetch_vans(_fk_train_id int)
RETURNS TABLE(van_id int, van_name varchar(128), fk_type_van varchar(128)) AS
$BODY$
    BEGIN
        RETURN QUERY
        SELECT van.van_id, van.van_name, van.fk_type_van
        FROM van
        WHERE fk_train_id = _fk_train_id
        ORDER BY van.van_name;
    END;
$BODY$
LANGUAGE plpgsql;