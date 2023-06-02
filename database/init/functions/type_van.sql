create function add_type_van(_type_van_name character varying, _seat_count integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO type_van(type_van_name, seat_count)
    VALUES (_type_van_name, _seat_count);
END;
$$;

------------------------------------------- ADD DATA TO type_van TABLE -------------------------------------------


create function delete_type_van(_type_van_name character varying) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM type_van WHERE type_van_name = _type_van_name;
END;
$$;

------------------------------------------- DELETE DATA FROM human TABLE -------------------------------------------


create function update_type_van(_type_van_name character varying, _seat_count integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE type_van SET seat_count = _seat_count
    WHERE type_van_name = _type_van_name;
END;
$$;

------------------------------------------- UPDATE DATA FOR human TABLE -------------------------------------------


