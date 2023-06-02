create function add_cities(_city_name character varying) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO cities(city_name)
    VALUES (_city_name);
END;
$$;

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------

create function delete_cities(_city_name character varying) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM cities WHERE city_name = _city_name;
END;
$$;

------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


