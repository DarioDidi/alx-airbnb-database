CREATE DATABASE Airbnb_db;

use Airbnb_db;
DROP TABLE IF EXISTS User;
CREATE TABLE User(
	user_id VARCHAR(36) PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	password_hash VARCHAR(40) NOT NULL,
	phone_number VARCHAR(15),
	role ENUM('guest', 'host', 'admin') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS Property;
CREATE TABLE Property (
    property_id VARCHAR(36) Primary Key, 
    host_id VARCHAR(36),
    FOREIGN KEY(host_id) references User(user_id),
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(30) NOT NULL,
    pricepernight DECIMAL(6,4) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking (
    booking_id VARCHAR(36) Primary Key,
    property_id VARCHAR(36),
    Foreign Key(property_id) references Property(property_id),
    user_id VARCHAR(36),
    Foreign Key(user_id) references User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(6,4) NOT NULL,
    status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment(
    payment_id VARCHAR(36) Primary Key,
    booking_id VARCHAR(36),
    Foreign Key(booking_id) references Booking(booking_id),
    amount DECIMAL(6,4) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM ('credit_card', 'paypal', 'stripe') NOT NULL
);

DROP TABLE IF EXISTS Review;
CREATE TABLE Review(
    review_id VARCHAR(36) Primary Key,
    property_id VARCHAR(36),
    Foreign Key(property_id) references Property(property_id),
    user_id VARCHAR(36),
    Foreign Key(user_id) references User(user_id),
    rating INTEGER, 
	CONSTRAINT rating CHECK (rating <= 5 AND rating >= 1),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS Message;
CREATE TABLE Message(
    message_id VARCHAR(36) Primary Key,
    sender_id VARCHAR(36),
    Foreign Key(sender_id) references User(user_id),
    recipient_id VARCHAR(36),
    Foreign Key(recipient_id) references User(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

