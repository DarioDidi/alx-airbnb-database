use airbnb_original;
-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT * FROM Booking
INNER JOIN User 
ON User.user_id = Booking.user_id;
-- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT * FROM Property
LEFT JOIN Review
ON Property.property_id = Review.property_id;
-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT * FROM Booking
LEFT JOIN User 
ON User.user_id = Booking.user_id
UNION
SELECT * FROM User
LEFT JOIN Booking
ON User.user_id = Booking.user_id;

SELECT * FROM Booking
FULL JOIN
User;