SELECT MAKEDATE(Year, 1)      AS start_date,
       CURDATE()              AS curr_date,
       YEAR(CURDATE()) - Year AS year_difference
FROM infectious_cases;