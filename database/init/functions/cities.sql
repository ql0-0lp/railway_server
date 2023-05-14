CREATE OR REPLACE FUNCTION add_cities(_city_name varchar(255))
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO cities(city_name)
		VALUES (_city_name);
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM add_train_model('М302', 28);
SELECT * FROM add_train_model('М303', 30);

SELECT * FROM train_model;	

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_cities(city_name varchar(255))
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM van WHERE city_name = _city_name;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM delete_train_model(1);
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


