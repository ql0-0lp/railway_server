create function free_seat(_fk_van_id integer)
    returns TABLE(seat_num integer, seat_id integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT seats.seat_num, seats.seat_id
        FROM seats
        WHERE fk_van_id = _fk_van_id AND is_seat_free = true
        ORDER BY seat_num;
END;
$$;