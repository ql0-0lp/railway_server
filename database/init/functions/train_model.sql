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


CREATE OR REPLACE FUNCTION fetch_train_model()
    RETURNS TABLE(train_model_id int, train_model_name varchar(128), max_van int) AS
$BODY$
BEGIN
    RETURN QUERY
        SELECT train_model.train_model_id, train_model.train_model_name, train_model.max_van
        FROM train_model
        ORDER BY train_model.train_model_name;
END;
$BODY$
    LANGUAGE plpgsql;
------------------------------------------- FETCH DATA FOR trains TABLE -------------------------------------------
