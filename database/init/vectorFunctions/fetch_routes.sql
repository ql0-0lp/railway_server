create function fetch_routes()
    returns TABLE(route_id integer, date_of_departure date, date_of_arrival date, departure_station_name character varying, arrival_station_name character varying, fk_train_id integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT r.route_id, r.date_of_departure, r.date_of_arrival, rs_departure.railway_station_name as departure_station_name, rs_arrival.railway_station_name as arrival_station_name, r.fk_train_id
        FROM route r
                 INNER JOIN railway_station rs_departure ON r.fk_departure_station_id = rs_departure.railway_station_id
                 INNER JOIN railway_station rs_arrival ON r.fk_arrival_station_id = rs_arrival.railway_station_id;
END;
$$;