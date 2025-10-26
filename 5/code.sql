DROP FUNCTION IF EXISTS year_diff;

DELIMITER //

CREATE FUNCTION year_diff(given_year INT)
    RETURNS INT
    DETERMINISTIC
    NO SQL
BEGIN
    DECLARE start_date DATE;
    SET start_date = MAKEDATE(given_year, 1);
    RETURN YEAR(CURDATE()) - given_year;
END//

DELIMITER ;

SELECT MAKEDATE(Year, 1) AS start_date,
       CURDATE()         AS curr_date,
       year_diff(Year)   AS year_diff
FROM infectious_cases;