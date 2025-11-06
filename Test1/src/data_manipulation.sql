-- INSERT
INSERT INTO restaurant (name, cuisine, restaurant_address, rating)
VALUES
('La Piazza', 'Italian', '123 Main St', 4.5);

INSERT INTO order_item (dish_name, quantity, price_per_dish, order_id)
VALUES
('Margherita Pizza', 2, 10.00, 1);

-- UPDATE
UPDATE courier
SET availability = FALSE,
    district = 'Old Town'
WHERE courier_id = 1;

UPDATE restaurant
SET rating = 4.7
WHERE restaurant_id = 2;

-- DELETE
DELETE FROM restaurant
WHERE rating < 3;

DELETE FROM client
WHERE client_id = 3;

-- SELECT
SELECT *
FROM courier
WHERE district = 'Old Town';

SELECT *
FROM client_order
WHERE restaurant_id = 1 AND order_time::DATE = CURRENT_DATE




