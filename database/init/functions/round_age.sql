create function round_age() returns void
    language plpgsql
as
$$
BEGIN
    UPDATE human SET user_date_of_birth =
                         CASE
                             WHEN AGE(user_date_of_birth) < INTERVAL '18 years' THEN DATE_TRUNC('year', NOW() - INTERVAL '18 years')
                             ELSE user_date_of_birth
                             END;
END;
$$;