CREATE OR REPLACE PROCEDURE proc_Grade (
    p_name IN VARCHAR2,
    p_marks IN NUMBER
) AS
    v_class VARCHAR2(30);
BEGIN
    IF p_marks >= 990 AND p_marks <= 1500 THEN
        v_class := 'Distinction';
    ELSIF p_marks >= 900 AND p_marks <= 989 THEN
        v_class := 'First Class';
    ELSIF p_marks >= 825 AND p_marks <= 899 THEN
        v_class := 'Higher Second Class';
    ELSE
        v_class := 'Not Classified';
    END IF;

    INSERT INTO results (name, class)
    VALUES (p_name, v_class);
END;
/

BEGIN
    FOR rec IN (SELECT name, total_marks FROM stude_marks) LOOP
        proc_Grade(rec.name, rec.total_marks);
    END LOOP;
END;
/