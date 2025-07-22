-- TODO


CREATE PROCEDURE test_annie.pop_cache_params (VARCHAR procedure_name)
BEGIN

    DECLARE count_max INT;
    DECLARE count INT DEFAULT 1;

    SET count_max = SELECT COUNT(*) FROM com_param_combos

    WHILE count < count_max do
    
        CALL procedure_name

    SET count+1
    END WHILE


END;


