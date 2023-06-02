create function delete_human(_user_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM human WHERE user_id = _user_id;
END;
$$;;

------------------------------------------- DELETE DATA TO humans TABLE -------------------------------------------

create function update_human(_user_id integer, _user_name text, _user_last_name text, _user_patronymic text, _user_document character varying, _user_date_of_birth date, _user_tel text, _user_email text, _user_password text) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE human SET user_name = _user_name,
                     user_last_name = _user_last_name,
                     user_patronymic = _user_patronymic,
                     user_document = _user_document,
                     user_date_of_birth = _user_date_of_birth,
                     user_tel = _user_tel,
                     user_email = _user_email,
                     user_password = _user_password
    WHERE user_id = _user_id;
END;
$$;

------------------------------------------- UPDATE DATA TO humans TABLE -------------------------------------------

create function add_human(_user_role text, _user_name text, _user_last_name text, _user_patronymic text, _user_document character varying,
                          _user_date_of_birth date, _user_tel text, _user_email text, _user_login text, _user_password text) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO human(user_role, user_name, user_last_name,
                      user_patronymic, user_document, user_date_of_birth,
                      user_tel, user_email, user_login, user_password)
    VALUES (_user_role, _user_name, _user_last_name,
            _user_patronymic, _user_document, _user_date_of_birth,
            _user_tel, _user_email, _user_login, _user_password);
END;
$$;

------------------------------------------- ADD DATA TO humans TABLE -------------------------------------------
