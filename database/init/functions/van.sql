create function add_van(_van_name character varying, _fk_type_van character varying, _fk_train_id integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO van(van_name, fk_type_van, fk_train_id)
    VALUES (_van_name, _fk_type_van, _fk_train_id);
END;
$$;

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


create function delete_van(_van_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM van WHERE van_id = _van_id;
END;
$$;

------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


create function update_van(_van_id integer, _van_name character varying, _fk_type_van character varying, _fk_train_id integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE van SET van_name = _van_name,
                   fk_type_van = _fk_type_van,
                   fk_train_id = _fk_train_id
    WHERE van_id = _van_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
