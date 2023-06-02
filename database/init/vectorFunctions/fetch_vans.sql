create function fetch_vans(_fk_train_id integer)
    returns TABLE(van_id integer, van_name character varying, fk_type_van character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT van.van_id, van.van_name, van.fk_type_van
        FROM van
        WHERE fk_train_id = _fk_train_id
        ORDER BY van.van_name;
END;
$$;