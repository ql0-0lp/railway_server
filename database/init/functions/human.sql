CREATE OR REPLACE FUNCTION add_human(
	_user_role varchar(8),
	_user_name text,
	_user_last_name text,
	_user_patronymic text, 
	_user_document varchar(64),
	_user_date_of_birth date,
	_user_tel text,
	_user_email text, 
	_user_login text,
	_user_password text)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO human(user_role, user_name, user_last_name, 
						  user_patronymic, user_document, user_date_of_birth, 
						  user_tel, user_email, user_login, user_password)
		VALUES (_user_role, _user_name, _user_last_name, 
				_user_patronymic, _user_document, _user_date_of_birth, 
				_user_tel, _user_email, _user_login, _user_password);
	END;
$BODY$
LANGUAGE plpgsql;