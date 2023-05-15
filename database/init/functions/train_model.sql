CREATE OR REPLACE FUNCTION add_train_model(_train_model_name VARCHAR(128), _max_van int)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO train_model(train_model_name, max_van)
		VALUES (_train_model_name, _max_van);
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_train_model(_train_model_id INT)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM train_model WHERE train_model_id = _train_model_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_train_model(_train_model_id INT, _train_model_name VARCHAR(128), _max_van INT)
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE train_model SET train_model_name = _train_model_name, max_van = _max_van 
		WHERE train_model_id = _train_model_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
