CREATE OR REPLACE FUNCTION add_train(_fk_train_model VARCHAR(128))
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO train(fk_train_model)
		VALUES (_fk_train_model);
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM add_train_model('М302', 28);
SELECT * FROM add_train_model('М303', 30);

SELECT * FROM train_model;	

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_train(_train_id INT)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM train WHERE train_id = _train_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM delete_train_model(1);
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_train(_train_id INT, _fk_train_model VARCHAR(128))
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE train SET fk_train_model = _fk_train_model
		WHERE train_id = _train_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM update_train_model(3, 'М302', 30);
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
