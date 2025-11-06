-- RESTAURANTS
INSERT INTO restaurant (name, cuisine, restaurant_address, rating) VALUES
('La Piazza', 'Italian', '123 Main St', 4.5),
('Sushi Zen', 'Japanese', '45 Cherry Ave', 4.8),
('Taco Fiesta', 'Mexican', '89 Market Rd', 4.2),
('Burger House', 'American', '12 River Blvd', 4.0);

-- CLIENTS
INSERT INTO client (delivery_address, payment_token) VALUES
('221B Baker Street', 'tok_1ABC123'),
('742 Evergreen Terrace', 'tok_2XYZ456'),
('12 Great Place', 'tok_3QWE789'),
('1600 Pennsylvania Ave', 'tok_4RTY012');

-- COURIERS
INSERT INTO courier (vehicle, availability, district) VALUES
('BICYCLE', TRUE, 'Downtown'),
('SCOOTER', FALSE, 'Uptown'),
('CAR', TRUE, 'Suburb'),
('WALKING', TRUE, 'Old Town');

-- CLIENT_ORDERS
INSERT INTO client_order (order_time, delivery_time, total_cost, client_id, restaurant_id, courier_id) VALUES
(NOW() - INTERVAL '2 hours', NOW() - INTERVAL '1 hour 30 minutes', 35.50, 1, 1, 1),
(NOW() - INTERVAL '1 day', NOW() - INTERVAL '23 hours', 22.00, 2, 2, 2),
(NOW() - INTERVAL '3 hours', NOW() - INTERVAL '2 hours 30 minutes', 18.75, 3, 3, 3),
(NOW() - INTERVAL '4 hours', NOW() - INTERVAL '3 hours 15 minutes', 40.00, 4, 4, 4);

-- ORDER_ITEMS
INSERT INTO order_item (dish_name, quantity, price_per_dish, order_id) VALUES
('Margherita Pizza', 2, 10.00, 1),
('Pasta Carbonara', 1, 15.50, 1),
('Sushi Set', 1, 22.00, 2),
('Chicken Taco', 3, 6.25, 3),
('Beef Taco', 2, 6.25, 3),
('Double Cheeseburger', 2, 12.00, 4),
('Fries', 1, 4.00, 4);