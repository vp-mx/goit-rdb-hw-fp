SELECT c.entity              AS country,
       c.code                AS code,
       AVG(ic.Number_rabies) AS avg_rabies,
       MIN(ic.Number_rabies) AS min_rabies,
       MAX(ic.Number_rabies) AS max_rabies,
       SUM(ic.Number_rabies) AS total_rabies
FROM infectious_cases ic
         JOIN countries c ON ic.country_id = c.id
WHERE ic.Number_rabies IS NOT NULL
-- AND ic.Number_rabies <> '' -- in case of empty strings. Our case it already normalized and set NULL for such cases
GROUP BY ic.country_id
ORDER BY avg_rabies DESC
LIMIT 10;