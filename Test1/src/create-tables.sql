-- ENUMS
CREATE TYPE VEHICLE_TYPE AS ENUM ('BICYCLE', 'SCOOTER', 'CAR', 'WALKING');
CREATE TYPE ORDER_STATUS AS ENUM ('preparing', 'delivered', 'delivering', 'canceled');

-- restaurant TABLE
CREATE TABLE IF NOT EXISTS restaurant
(
    restaurant_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    cuisine VARCHAR(20) NOT NULL,
    restaurant_address VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) DEFAULT 0 NOT NULL CHECK ( rating >= 0 AND rating <= 5)
);

-- client TABLE
CREATE TABLE IF NOT EXISTS client
(
    client_id SERIAL PRIMARY KEY,
    delivery_address VARCHAR(100) NOT NULL,
    payment_token VARCHAR(255) NOT NULL UNIQUE
);

-- courier TABLE
CREATE TABLE IF NOT EXISTS courier
(
    courier_id SERIAL PRIMARY KEY,
    vehicle VEHICLE_TYPE NOT NULL,
    availability BOOLEAN NOT NULL DEFAULT TRUE,
    district VARCHAR(50) NOT NULL
);

-- client_order TABLE
CREATE TABLE IF NOT EXISTS client_order
(
    order_id SERIAL PRIMARY KEY,
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    delivery_time TIMESTAMP CHECK (delivery_time IS NULL OR delivery_time > order_time ),
    status ORDER_STATUS NOT NULL DEFAULT 'preparing',
    total_cost DECIMAL(7,2) NOT NULL CHECK ( total_cost >= 0 ),
    client_id INT REFERENCES client(client_id),
    restaurant_id INT REFERENCES restaurant(restaurant_id),
    courier_id INT REFERENCES courier(courier_id)
);

-- order_item TABLE
CREATE TABLE IF NOT EXISTS order_item
(
    dish_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_per_dish DECIMAL(6,2) NOT NULL CHECK (price_per_dish > 0),
    order_id INT REFERENCES client_order(order_id),
    PRIMARY KEY (order_id, dish_name)
);