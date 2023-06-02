create function fetch_tickets(_fk_user_id integer)
    returns TABLE(ticket_id integer, fk_user_id integer, user_name text, user_last_name text, user_patronymic text, user_document character varying, route_id integer, date_of_departure date, date_of_arrival date, departure_station character varying, arrival_station character varying, fk_train_id integer, seat_num integer, departure_city character varying, arrival_city character varying, van_id integer, van_type character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT ticket.ticket_id, ticket.fk_user_id, human.user_name, human.user_last_name,
               human.user_patronymic, human.user_document, fetching.route_id,
               fetching.date_of_departure, fetching.date_of_arrival, fetching.departure_station,
               fetching.arrival_station, fetching.fk_train_id, seats.seat_num,
               departure_city.departure_city, arrival_city.arrival_city, ticket.fk_van_id,
               van.fk_type_van
        FROM ticket
                 INNER JOIN seats ON ticket.fk_seat_id = seats.seat_id
                 INNER JOIN fetch_routes() AS fetching ON ticket.fk_route_id = fetching.route_id
                 INNER JOIN human ON ticket.fk_user_id = human.user_id
                 INNER JOIN fetch_departure_city() AS departure_city ON ticket.ticket_id = departure_city.ticket_id
                 INNER JOIN fetch_arrival_city() AS arrival_city ON ticket.ticket_id = arrival_city.ticket_id
                 INNER JOIN van ON ticket.fk_van_id = van.van_id
        WHERE ticket.fk_user_id = _fk_user_id
        ORDER BY date_of_departure;
END;
$$;