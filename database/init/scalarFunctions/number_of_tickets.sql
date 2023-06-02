create function number_of_tickets(_fk_user_id integer) returns integer
    language plpgsql
as
$$
DECLARE num int;
BEGIN
    SELECT COUNT(ticket_id) INTO num
    FROM ticket
    WHERE fk_user_id = _fk_user_id;

    RETURN num;
END;
$$;