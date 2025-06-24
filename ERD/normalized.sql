--Normalized Structure:
--1. User Tables
CREATE TABLE user_role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE user (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES user_role(role_id)
);

CREATE INDEX idx_user_email ON user(email);

--2. Property Tables
CREATE TABLE location (
    location_id UUID PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_province VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location_id UUID NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES user(user_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

CREATE INDEX idx_property_host ON property(host_id);

--3. Booking Tables
CREATE TABLE booking_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (status_id) REFERENCES booking_status(status_id)
);

CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_user ON booking(user_id);

--4. Payment Tables

CREATE TABLE payment_method (
    method_id INT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method_id INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (method_id) REFERENCES payment_method(method_id)
);

CREATE INDEX idx_payment_booking ON payment(booking_id);

--5. Review Table
CREATE TABLE review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE INDEX idx_review_property ON review(property_id);
CREATE INDEX idx_review_user ON review(user_id);

--6. Message Table
CREATE TABLE message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(user_id),
    FOREIGN KEY (recipient_id) REFERENCES user(user_id)
);

CREATE INDEX idx_message_sender ON message(sender_id);
CREATE INDEX idx_message_recipient ON message(recipient_id);

/*
Changes Made for 3NF:
Replaced ENUMs with reference tables:

Created user_role table for user roles

Created booking_status table for booking statuses

Created payment_method table for payment methods

Normalized location data:

Created separate location table with address components

Property now references location instead of storing it as VARCHAR

Ensured all non-key attributes depend only on the primary key:

Each table's non-key attributes are fully dependent on the primary key

No transitive dependencies exist

Maintained all original constraints:

All original constraints are preserved

Added appropriate foreign key relationships for the new reference tables

This structure now fully complies with Third Normal Form while maintaining all the functionality of the original design.
*/
