create function fetch_railway_station(_fk_city_name character varying)
    returns TABLE(railway_station_id integer, railway_station_name character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT railway_station.railway_station_id, railway_station.railway_station_name
        FROM railway_station
        WHERE fk_city_name = _fk_city_name
        ORDER BY railway_station.railway_station_name;
END;
$$;