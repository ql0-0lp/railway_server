CREATE USER _user WITH PASSWORD '_user';
GRANT UPDATE, DELETE ON TABLE human TO _user;
GRANT DELETE ON TABLE ticket TO _user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO _user;
GRANT SELECT ON
    cities, human, railway_station, route, seats, ticket, train, train_model, type_van, van TO _user;

CREATE ROLE _user;
CREATE ROLE _admin;

CREATE USER user_role WITH PASSWORD 'user';
CREATE USER admin_role WITH PASSWORD 'admin';

GRANT _user TO user_role;
GRANT _admin TO admin_role;

GRANT postgres TO _admin;
GRANT UPDATE, DELETE ON TABLE human TO _user;
GRANT DELETE ON TABLE ticket TO _user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO _user;
GRANT SELECT ON cities, human, railway_station, route, seats,
    ticket, train, train_model, type_van, van TO _user;