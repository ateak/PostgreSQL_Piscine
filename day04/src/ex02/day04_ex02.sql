CREATE OR REPLACE VIEW v_generated_dates AS
SELECT date_trunc('day', my_date):: date AS generated_date
FROM generate_series('2022-01-01'::timestamp, '2022-01-31':: timestamp, '1 day'::interval) my_date
ORDER by 1;