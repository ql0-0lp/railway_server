create function add_ticket(_fk_user_id integer, _fk_route_id integer, _fk_seat_id integer, _fk_van_id integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO ticket(fk_user_id, fk_route_id, fk_seat_id, fk_van_id)
    VALUES (_fk_user_id, _fk_route_id, _fk_seat_id, _fk_van_id);
END;
$$;

------------------------------------------- ADD DATA TO ticket TABLE -------------------------------------------


create function delete_ticket(_ticket_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM ticket WHERE ticket_id = _ticket_id;
END;
$$;

------------------------------------------- DELETE DATA FROM ticket TABLE -------------------------------------------

create function update_ticket(_ticket_id integer, _fk_user_id integer, _fk_route_id integer, _fk_seat_id integer, _fk_van_id integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE ticket SET fk_user_id = _fk_user_id, fk_route_id = _fk_route_id,
                      fk_seat_id = _fk_seat_id, fk_van_id = _fk_van_id
    WHERE ticket_id = _ticket_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR ticket TABLE -------------------------------------------