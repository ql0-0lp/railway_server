CREATE TABLE train_model
(
	train_model_id serial PRIMARY KEY,
	train_model_name varchar(128) NOT NULL,
	max_van int NOT NULL
);

CREATE TABLE type_van
(
	type_van_name varchar(128) PRIMARY KEY,
	seat_count int NOT NULL
);

CREATE TABLE train
(
	train_id serial PRIMARY KEY,
	fk_train_model int REFERENCES train_model(train_model_id) NOT NULL
);

CREATE TABLE van
(
	van_id serial PRIMARY KEY,
	van_name varchar(128) NOT NULL,
	fk_type_van varchar(128) REFERENCES type_van(type_van_name) NOT NULL,
	fk_train_id int REFERENCES train(train_id) NOT NULL
);

CREATE TABLE cities
(
	city_name varchar(255) PRIMARY KEY
);

CREATE TABLE railway_station
(
	railway_station_id serial PRIMARY KEY,
	railway_station_name varchar(128) NOT NULL,
	fk_city_id varchar(255) REFERENCES cities(city_name) NOT NULL
);

CREATE TABLE human
(
	user_id serial PRIMARY KEY,
	user_role varchar(8) DEFAULT 'USER' NOT NULL,
	user_name text NOT NULL,
	user_last_name text NOT NULL,
	user_patronymic text NOT NULL,
	user_document varchar(64) NOT NULL,
	user_date_of_birth date NOT NULL,
	user_tel text NOT NULL,
	user_email text NOT NULL,
	user_login text NOT NULL,
	user_password text NOT NULL
);

CREATE TABLE seats
(
	seat_id serial PRIMARY KEY,
	seat_num int NOT NULL,
	state bool NOT NULL DEFAULT true,
	fk_van_id int REFERENCES van(van_id) NOT NULL
);

CREATE TABLE route
(
    route_id serial PRIMARY KEY,
    date_of_departure date NOT NULL,
    date_of_arrival date NOT NULL,
    fk_departure_station_id int REFERENCES railway_station(railway_station_id) NOT NULL,
    fk_arrival_station_id int REFERENCES railway_station(railway_station_id) NOT NULL,
    fk_train_id int REFERENCES train(train_id) NOT NULL
);

CREATE TABLE ticket
(
    ticket_id serial PRIMARY KEY,
    fk_user_id int REFERENCES human(user_id) NOT NULL,
    fk_route_id int REFERENCES route(route_id) NOT NULL,
    fk_seat_id int REFERENCES seats(seat_id) NOT NULL
);