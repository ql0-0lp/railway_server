CREATE OR REPLACE FUNCTION add_train(_fk_train_model VARCHAR(128))
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO train(fk_train_model)
		VALUES (_fk_train_model);
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_train(_train_id INT)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM train WHERE train_id = _train_id;
	END;
$BODY$
LANGUAGE plpgsql;
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
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
