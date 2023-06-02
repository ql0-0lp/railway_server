create function add_seats(_seat_num integer, _fk_van_id integer, _is_seat_free boolean) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO seats(seat_num, fk_van_id, is_seat_free)
    VALUES (_seat_num, _fk_van_id, _is_seat_free);
END;
$$;

------------------------------------------- ADD DATA TO seats TABLE -------------------------------------------


create function delete_seats(_seat_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM seats WHERE seat_id = _seat_id;
END;
$$;

------------------------------------------- DELETE DATA FROM seats TABLE -------------------------------------------


create function update_seats(_seat_id integer, _seat_num integer, _is_seat_free boolean) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE seats SET seat_num = seat_num, is_seat_free = _is_seat_free
    WHERE seat_id = _seat_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR seats TABLE -------------------------------------------
