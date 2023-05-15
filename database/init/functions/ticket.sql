CREATE OR REPLACE FUNCTION add_ticket(
	_fk_user_id int,
	_date_of_departure timestamp,
	_date_of_arrival timestamp,
	_fk_train_id int,
	_fk_seat_id int,
	_fk_departure_station_id int,
	_fk_arrival_station_id int)
RETURNS VOID AS 
$BODY$
	BEGIN
		INSERT INTO ticket(fk_user_id, date_of_departure, date_of_arrival,
				fk_train_id, fk_seat_id, fk_departure_station_id, fk_arrival_station_id)
		VALUES (_fk_user_id, _date_of_departure, _date_of_arrival,
				_fk_train_id, _fk_seat_id, _fk_departure_station_id,
				_fk_arrival_station_id);
	END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION delete_ticket(_ticket_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		DELETE FROM ticket WHERE ticket_id = _ticket_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


CREATE OR REPLACE FUNCTION update_ticket(
	_ticket_id int, 
	_fk_user_id int,
	_date_of_departure timestamp,
	_date_of_arrival timestamp,
	_fk_train_id int,
	_fk_seat_id int,
	_fk_departure_station_id int,
	_fk_arrival_station_id int)
RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE ticket SET fk_user_id = _fk_user_id, 
				date_of_departure = _date_of_departure,
				date_of_arrival = _date_of_arrival,
				fk_train_id = _fk_train_id,
				fk_seat_id = _fk_seat_id,
				fk_departute_station_id = _fk_departure_station_id,
				fk_arrival_station_id = _fk_arrival_station_id
		WHERE ticket_id = _ticket_id;
	END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
