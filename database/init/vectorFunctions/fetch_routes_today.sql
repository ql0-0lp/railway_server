create function fetch_routes_today()
    returns TABLE(route_id integer, date_of_departure date, date_of_arrival date, departure_station character varying, arrival_station character varying, fk_train_id integer, departure_city character varying, arrival_city character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT * FROM fetch_routes() AS fr
        WHERE fr.date_of_departure = CURRENT_DATE;
END;
$$;