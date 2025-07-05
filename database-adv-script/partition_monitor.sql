-- Example of EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT p.property_id, p.name, AVG(r.rating) as avg_rating
FROM Property p
JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name
HAVING AVG(r.rating) > 4.0;

-- Example of SHOW PROFILE (MySQL)
SET profiling = 1;
-- Run your query here
SHOW PROFILE;