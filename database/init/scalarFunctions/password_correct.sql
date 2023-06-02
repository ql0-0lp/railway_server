create function password_correct(_user_login text) returns text
    language plpgsql
as
$$
DECLARE pass text;
BEGIN
    SELECT user_password INTO pass
    FROM human
    WHERE user_login = _user_login;

    RETURN pass;
END;
$$;