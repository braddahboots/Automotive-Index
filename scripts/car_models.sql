-- db indexed_cars

CREATE TABLE IF NOT EXISTS car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
);

-- ## Indexing

-- create index on columns that would improve query performance
CREATE INDEX title_idx
  ON car_models (make_title)

-- 1. Create a query to get a list of all `make_title` values from the `car_models` table where the `make_code` is `'LAM'`, without any duplicate rows, and note the time somewhere. (should have 1 result)
-- TIME: 61.437 ms
-- SELECT DISTINCT make_title
-- FROM car_models
--   WHERE make_code = 'LAM'


-- -- 2. Create a query to list all `model_title` values where the `make_code` is `'NISSAN'`, and the `model_code` is `'GT-R'` without any duplicate rows, and note the time somewhere. (should have 1 result)
-- -- TIME: 64.472 ms
-- SELECT DISTINCT model_title
-- FROM car_models
--   WHERE make_code = 'NISSAN'
--     AND model_code = 'GT-R'

-- -- 3. Create a query to list all `make_code`, `model_code`, `model_title`, and year from `car_models` where the `make_code` is `'LAM'`, and note the time somewhere. (should have 1360 rows)
-- -- TIME: 36.584 ms
-- SELECT make_code, model_code, model_title, car_models.year
-- FROM car_models
--   WHERE make_code = 'LAM'

-- -- 4. Create a query to list all fields from all `car_models` in years between `2010` and `2015`, and note the time somewhere (should have 78840 rows)
-- -- TIME: 116.839 ms
-- SELECT *
-- FROM car_models
--   WHERE car_models.year >= 2010
--     AND car_models.year <= 2015


-- -- 5. Create a query to list all fields from all `car_models` in the year of `2010`, and note the time somewhere (should have 13140 rows)
-- -- TIME: 67.626 ms
-- SELECT *
-- FROM car_models
--   WHERE car_models.year = 2010
