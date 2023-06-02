create function add_train(_fk_train_model integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO train(fk_train_model)
    VALUES (_fk_train_model);
END;
$$;

------------------------------------------- ADD DATA TO trains TABLE -------------------------------------------


create function delete_train(_train_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM train WHERE train_id = _train_id;
END;
$$;

------------------------------------------- DELETE DATA FROM trains TABLE -------------------------------------------


create function update_train(_train_id integer, _fk_train_model integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE train SET fk_train_model = _fk_train_model
    WHERE train_id = _train_id;
END;
$$;

------------------------------------------- UPDATE DATA FOR trains TABLE -------------------------------------------
