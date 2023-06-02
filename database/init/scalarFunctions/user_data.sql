create function user_data(_user_id integer)
    returns TABLE(_user_name text, _user_last_name text, _user_patronymic text, _user_document character varying, _user_date_of_birth date, _user_tel text, _user_email text, _user_login text, _user_password text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT user_name, user_last_name, user_patronymic, user_document, user_date_of_birth, user_tel,
               user_email, user_login, user_password
        FROM human
        WHERE user_id = _user_id;
END;
$$;