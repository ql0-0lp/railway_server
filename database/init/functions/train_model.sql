create function add_train_model(_train_model_name character varying, _max_van integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO train_model(train_model_name, max_van)
    VALUES (_train_model_name, _max_van);
END;
$$;

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


create function delete_train_model(_train_model_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM train_model WHERE train_model_id = _train_model_id;
END;
$$;

------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


create function update_train_model(_train_model_id integer, _train_model_name character varying, _max_van integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE train_model SET train_model_name = _train_model_name, max_van = _max_van
    WHERE train_model_id = _train_model_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
