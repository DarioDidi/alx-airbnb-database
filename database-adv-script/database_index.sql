-- Before indexing
EXPLAIN ANALYZE 
SELECT * FROM Property 
WHERE location LIKE '%New York%' 
AND pricepernight BETWEEN 100 AND 200
ORDER BY pricepernight;


-- database_index.sql
-- User table indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Property table indexes
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Booking table indexes
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Review table indexes
CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);

-- Payment table indexes
CREATE INDEX idx_payment_booking ON Payment(booking_id);


-- After indexing
EXPLAIN ANALYZE 
SELECT * FROM Property 
WHERE location LIKE '%New York%' 
AND pricepernight BETWEEN 100 AND 200
ORDER BY pricepernight;
