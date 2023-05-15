CREATE OR REPLACE FUNCTION add_railway_station(_railway_station_name varchar(128), _fk_city_id varchar(255))
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO railway_station(railway_station_name, fk_city_id)
		VALUES (_railway_station_name, _fk_city_id);
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_railway_station(_railway_station_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM railway_station WHERE railway_station_id = _railway_station_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_railway_station(_railway_station_id int, _railway_station_name varchar(128))
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE railway_station SET railway_station_name = _railway_station_name
		WHERE railway_station_id = _railway_station_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION fetch_railway_station(_fk_city_id varchar(255))
    RETURNS TABLE(railway_station_id int, railway_station_name varchar(128)) AS
$BODY$
BEGIN
    RETURN QUERY
        SELECT railway_station.railway_station_id, railway_station.railway_station_name
        FROM railway_station
        WHERE fk_city_id = _fk_city_id
        ORDER BY railway_station.railway_station_name;
END;
$BODY$
    LANGUAGE plpgsql;
------------------------------------------- FETCH DATA FOR trains TABLE -------------------------------------------
