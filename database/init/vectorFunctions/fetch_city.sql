create function fetch_city()
    returns TABLE(city_name character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT cities.city_name
        FROM cities
        ORDER BY cities.city_name;
END;
$$;