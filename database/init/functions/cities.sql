CREATE OR REPLACE FUNCTION add_cities(_city_name varchar(255))
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO cities(city_name)
		VALUES (_city_name);
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_cities(_city_name varchar(255))
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM cities WHERE city_name = _city_name;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------

CREATE OR REPLACE FUNCTION fetch_city()
    RETURNS TABLE(city_name varchar(255)) AS
$BODY$
BEGIN
    RETURN QUERY
        SELECT cities.city_name
        FROM cities
        ORDER BY cities.city_name;
END;
$BODY$
    LANGUAGE plpgsql;
------------------------------------------- FETCH DATA FROM trains TABLE -------------------------------------------



