USE airbnb_original;
-- Seed Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('11111111-1111-1111-1111-111111111111', 'John', 'Doe', 'john.doe@example.com', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '+1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Jane', 'Smith', 'jane.smith@example.com', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '+1987654321', 'host'),
('33333333-3333-3333-3333-333333333333', 'Admin', 'User', 'admin@example.com', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '+1122334455', 'admin'),
('44444444-4444-4444-4444-444444444444', 'Michael', 'Johnson', 'michael.j@example.com', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '+1555666777', 'guest'),
('55555555-5555-5555-5555-555555555555', 'Sarah', 'Williams', 'sarah.w@example.com', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '+1888999000', 'host');

-- Seed Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', 'A cozy apartment in the heart of NYC', '123 Main St, New York, NY 10001, USA', 150.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Beach House', 'Beautiful beachfront property', '456 Ocean Ave, Miami, FL 33101, USA', 250.00),
('cccccccc-cccc-cccc-cccc-cccccccccccc', '55555555-5555-5555-5555-555555555555', 'Mountain Cabin', 'Rustic cabin with amazing views', '789 Mountain Rd, Denver, CO 80014, USA', 175.00),
('dddddddd-dddd-dddd-dddd-dddddddddddd', '55555555-5555-5555-5555-555555555555', 'Downtown Loft', 'Modern loft in the city center', '101 Downtown St, Los Angeles, CA 90001, USA', 200.00),
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', 'Lakeside Cottage', 'Quiet cottage by the lake', '202 Lakeview Dr, Chicago, IL 60007, USA', 125.00);

-- Seed Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('ffffffff-ffff-ffff-ffff-ffffffffffff', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2023-07-01', '2023-07-07', 900.00, 'confirmed'),
('gggggggg-gggg-gggg-gggg-gggggggggggg', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '44444444-4444-4444-4444-444444444444', '2023-08-15', '2023-08-20', 1250.00, 'confirmed'),
('hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', '2023-09-01', '2023-09-05', 700.00, 'pending'),
('iiiiiiii-iiii-iiii-iiii-iiiiiiiiiiii', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '44444444-4444-4444-4444-444444444444', '2023-07-10', '2023-07-15', 1000.00, 'canceled'),
('jjjjjjjj-jjjj-jjjj-jjjj-jjjjjjjjjjjj', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '2023-08-01', '2023-08-07', 875.00, 'confirmed');

-- Seed Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('kkkkkkkk-kkkk-kkkk-kkkk-kkkkkkkkkkkk', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 900.00, 'credit_card'),
('llllllll-llll-llll-llll-llllllllllll', 'gggggggg-gggg-gggg-gggg-gggggggggggg', 1250.00, 'paypal'),
('mmmmmmmm-mmmm-mmmm-mmmm-mmmmmmmmmmmm', 'hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 700.00, 'credit_card'),
('nnnnnnnn-nnnn-nnnn-nnnn-nnnnnnnnnnnn', 'iiiiiiii-iiii-iiii-iiii-iiiiiiiiiiii', 1000.00, 'stripe'),
('oooooooo-oooo-oooo-oooo-oooooooooooo', 'jjjjjjjj-jjjj-jjjj-jjjj-jjjjjjjjjjjj', 875.00, 'credit_card');

-- Seed Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('pppppppp-pppp-pppp-pppp-pppppppppppp', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Great place, would stay again!'),
('qqqqqqqq-qqqq-qqqq-qqqq-qqqqqqqqqqqq', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '44444444-4444-4444-4444-444444444444', 4, 'Beautiful location, but a bit noisy'),
('rrrrrrrr-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', 5, 'Absolutely perfect getaway'),
('ssssssss-ssss-ssss-ssss-ssssssssssss', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '44444444-4444-4444-4444-444444444444', 3, 'Nice but needs better cleaning'),
('tttttttt-tttt-tttt-tttt-tttttttttttt', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', 4, 'Very peaceful and relaxing');

-- Seed Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('uuuuuuuu-uuuu-uuuu-uuuu-uuuuuuuuuuuu', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, I have a question about your property'),
('vvvvvvvv-vvvv-vvvv-vvvv-vvvvvvvvvvvv', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Sure, what would you like to know?'),
('wwwwwwww-wwww-wwww-wwww-wwwwwwwwwwww', '44444444-4444-4444-4444-444444444444', '55555555-5555-5555-5555-555555555555', 'Is the mountain cabin pet-friendly?'),
('xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx', '55555555-5555-5555-5555-555555555555', '44444444-4444-4444-4444-444444444444', 'Yes, we allow pets with a small fee'),
('yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy', '22222222-2222-2222-2222-222222222222', '44444444-4444-4444-4444-444444444444', 'Thank you for your recent booking!');
