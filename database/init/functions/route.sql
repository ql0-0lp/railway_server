create function add_route(_date_af_departure date, _date_of_arrival date, _departure_station_id integer, _arrival_station_id integer, _train_id integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO route(date_of_departure, date_of_arrival, fk_departure_station_id, fk_arrival_station_id, fk_train_id)
    VALUES (_date_af_departure, _date_of_arrival, _departure_station_id, _arrival_station_id, _train_id);
END;
$$;

------------------------------------------- ADD DATA TO route TABLE -------------------------------------------

create function delete_route(_route_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM route WHERE route_id = _route_id;
END;
$$;

------------------------------------------- DELETE DATA FROM route TABLE -------------------------------------------


create function update_route(_route_id integer, _date_af_departure date, _date_of_arrival date, _departure_station_id integer, _arrival_station_id integer, _train_id integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE route SET date_of_departure = _date_af_departure,
                     date_of_arrival = _date_of_arrival,
                     fk_departure_station_id = _departure_station_id,
                     fk_arrival_station_id = _arrival_station_id,
                     fk_train_id = _train_id
    WHERE route_id = _route_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR route TABLE -------------------------------------------
