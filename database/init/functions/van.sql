CREATE OR REPLACE FUNCTION add_van(_van_name VARCHAR(128), _fk_type_van varchar(128), _fk_train_id int)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO van(van_name, fk_type_van, fk_train_id)
		VALUES (_van_name, _fk_type_van, _fk_train_id);
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM add_train_model('М302', 28);
SELECT * FROM add_train_model('М303', 30);

SELECT * FROM train_model;	

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_van(_van_id INT)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM van WHERE van_id = _van_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM delete_train_model(1);
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_van(_van_id INT, _van_name VARCHAR(128), _fk_type_van varchar(128), _fk_train_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE van SET van_name = _van_name, 
			fk_type_van = _fk_type_van, 
			fk_train_id = _fk_train_id
		WHERE van_id = _van_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM update_train_model(3, 'М302', 30);
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
