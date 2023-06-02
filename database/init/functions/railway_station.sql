create function add_railway_station(_railway_station_name character varying, _fk_city_name character varying) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO railway_station(railway_station_name, fk_city_name)
    VALUES (_railway_station_name, _fk_city_name);
END;
$$;

------------------------------------------- ADD DATA TO railway_stations TABLE -------------------------------------------


create function delete_railway_station(_railway_station_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM railway_station WHERE railway_station_id = _railway_station_id;
END;
$$;

------------------------------------------- DELETE DATA FROM railway_stations TABLE -------------------------------------------


create function update_railway_station(_railway_station_id integer, _railway_station_name character varying) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE railway_station SET railway_station_name = _railway_station_name
    WHERE railway_station_id = _railway_station_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR railway_stations TABLE -------------------------------------------
