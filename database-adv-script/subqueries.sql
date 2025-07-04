use airbnb_original;
--    Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT p.property_id, p.name, p.location, p.pricepernight,
       (SELECT AVG(rating) FROM Review WHERE property_id = p.property_id) AS avg_rating
FROM Property p
WHERE (SELECT AVG(rating) FROM Review WHERE property_id = p.property_id) > 4.0;
    
--  Write a correlated subquery to find users who have made more than 3 bookings.
SELECT u.user_id, u.first_name, u.last_name, u.email
FROM User u
WHERE (
    SELECT COUNT(*) 
    FROM Booking b 
    WHERE b.user_id = u.user_id
) > 3;