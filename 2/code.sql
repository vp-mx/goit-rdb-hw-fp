USE pandemic;
CREATE TABLE countries
(
    id     INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(255) NOT NULL UNIQUE,
    code   CHAR(10)
);


INSERT INTO countries (entity, code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

-- Add FK column and constraint
ALTER TABLE infectious_cases
    ADD COLUMN country_id INT,
    ADD CONSTRAINT fk_country
        FOREIGN KEY (country_id)
            REFERENCES countries (id);

-- Update FK based on two columns (Entity + Code)
SET SQL_SAFE_UPDATES = 0;
UPDATE infectious_cases ic
    JOIN countries c
    ON ic.Entity = c.entity AND ic.Code = c.code
SET ic.country_id = c.id;

SELECT COUNT(*) AS unmatched_rows
FROM infectious_cases
WHERE country_id IS NULL;

SELECT COUNT(*) AS total_rows_with_country_id
FROM infectious_cases
WHERE country_id IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;


ALTER TABLE infectious_cases
    DROP COLUMN Entity,
    DROP COLUMN Code;

SELECT COUNT(*)
FROM infectious_cases;
