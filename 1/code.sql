CREATE SCHEMA IF NOT EXISTS pandemic;
USE pandemic;

-- after importing data from CSV files
UPDATE infectious_cases SET Number_yaws = NULL WHERE Number_yaws = '';
UPDATE infectious_cases SET polio_cases = NULL WHERE polio_cases = '';
UPDATE infectious_cases SET cases_guinea_worm = NULL WHERE cases_guinea_worm = '';
UPDATE infectious_cases SET Number_rabies = NULL WHERE Number_rabies = '';
UPDATE infectious_cases SET Number_malaria = NULL WHERE Number_malaria = '';
UPDATE infectious_cases SET Number_hiv = NULL WHERE Number_hiv = '';
UPDATE infectious_cases SET Number_tuberculosis = NULL WHERE Number_tuberculosis = '';
UPDATE infectious_cases SET Number_smallpox = NULL WHERE Number_smallpox = '';
UPDATE infectious_cases SET Number_cholera_cases = NULL WHERE Number_cholera_cases = '';

ALTER TABLE infectious_cases
MODIFY COLUMN Number_yaws DOUBLE,
MODIFY COLUMN polio_cases DOUBLE,
MODIFY COLUMN cases_guinea_worm DOUBLE,
MODIFY COLUMN Number_rabies DOUBLE,
MODIFY COLUMN Number_malaria DOUBLE,
MODIFY COLUMN Number_hiv DOUBLE,
MODIFY COLUMN Number_tuberculosis DOUBLE,
MODIFY COLUMN Number_smallpox DOUBLE,
MODIFY COLUMN Number_cholera_cases DOUBLE;

SELECT COUNT(*) FROM infectious_cases;
