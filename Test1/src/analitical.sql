-- Обчислити загальний дохід за рестораном за місяць
WITH restaurant_months_profit AS (
   SELECT
    restaurant_id,
    r.name,
    DATE_TRUNC('month', order_time),
    SUM(total_cost) AS month_profit
FROM client_order
    INNER JOIN restaurant r USING (restaurant_id)
GROUP BY
    restaurant_id,
    r.name,
    DATE_TRUNC('month', order_time)
)
SELECT
    name,
    AVG(month_profit) AS avg_monthly_profit
FROM restaurant_months_profit
GROUP BY name;

-- Знайти топ-10 ресторанів з найвищим рейтингом та найбільшою кількістю замовлень
SELECT
    restaurant_id,
    name,
    rating,
    COUNT(order_id) AS number_of_orders
FROM restaurant
    INNER JOIN client_order USING (restaurant_id)
GROUP BY restaurant_id, name, rating
ORDER BY rating DESC, number_of_orders DESC;

-- Обчислити середній час доставки за кур'єром
SELECT
    courier_id,
    AVG(delivery_time - order_time) AS avg_delivery_duration
FROM client_order
WHERE delivery_time IS NOT NULL
GROUP BY courier_id;

-- Визначити кур'єрів з найбільшою кількістю скасованих доставок (використати CTE)
WITH courier_canceled_orders AS (
    SELECT
        courier_id,
        COUNT(order_id) AS canceled_orders
    FROM client_order
    WHERE status = 'cancelled'
    GROUP BY courier_id
)
SELECT
    courier_id,
    canceled_orders,
    ROW_NUMBER() OVER (ORDER BY canceled_orders DESC) AS rank
FROM courier_canceled_orders
ORDER BY rank;
