CREATE OR REPLACE FUNCTION add_railway_station(_railway_station_name varchar(128), _fk_city_id varchar(255))
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO railway_station(railway_station_name, fk_city_id)
		VALUES (_railway_station_name, _fk_city_id);
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM add_train_model('М302', 28);
SELECT * FROM add_train_model('М303', 30);

SELECT * FROM train_model;	

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_railway_station(_railway_station_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM railway_station WHERE railway_station_id = _railway_station_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM delete_train_model(1);
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_railway_station(_railway_station_id int, _railway_station_name varchar(128), _fk_city_id varchar(255))
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE railway_station SET railway_station_name = _railway_station_name, fk_city_id = _fk_city_id
		WHERE railway_station_id = _railway_station_id;
	END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM update_train_model(3, 'М302', 30);
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
