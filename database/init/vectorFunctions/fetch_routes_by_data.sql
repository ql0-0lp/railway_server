create function fetch_routes_by_data(_departure_city character varying, _arrival_city character varying, _date_of_departure date)
    returns TABLE(route_id integer, date_of_departure date, date_of_arrival date, departure_station character varying, arrival_station character varying, fk_train_id integer, departure_city character varying, arrival_city character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT * FROM fetch_routes() AS fr
        WHERE fr.departure_city = _departure_city
          AND  fr.arrival_city = _arrival_city
          AND fr.date_of_departure = _date_of_departure;
END;
$$;