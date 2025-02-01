-- 1. Агрегатная функция SUM
SELECT DISTINCT
    supplier.country,
    SUM(car.price) OVER (PARTITION BY supplier.country) AS total_price_by_country
FROM 
    car_order
NATURAL JOIN car
NATURAL JOIN supplier;
-- 2. Агрегатная функция AVG
SELECT 
    drive.drive_type,
    engine.engine_power,
    AVG(engine.engine_power) OVER (PARTITION BY drive.drive_type) AS avg_power_by_drive
FROM 
    car
NATURAL JOIN drive
NATURAL JOIN engine;
-- 3. Агрегатная функция COUNT
SELECT 
    order_date,
    COUNT(*) OVER (PARTITION BY order_date) AS total_orders
FROM 
    car_order;
-- 4. Агрегатная функция MIN
SELECT 
    brand.brand,
    car.price,
    MIN(car.price) OVER (PARTITION BY brand.brand_id) AS min_price_by_brand
FROM 
    car
INNER JOIN model ON car.model_id = model.model_id
INNER JOIN brand ON model.brand_id = brand.brand_id;
-- 5. Агрегатная функция MAX
SELECT 
    drive.drive_type,
    engine.engine_power,
    MAX(engine.engine_power) OVER (PARTITION BY drive.drive_type) AS max_power_by_drive
FROM 
    car
NATURAL JOIN drive
NATURAL JOIN engine;
-- 6. Ранжирующая функция ROW_NUMBER
SELECT 
    client_id,
    firstname,
    surname,
    order_date,
    ROW_NUMBER() OVER (PARTITION BY client_id ORDER BY order_date) AS order_number
FROM 
    car_order
NATURAL JOIN client;
-- 7. Ранжирующая функция RANK
SELECT 
    car_id, 
    brand,
    model,
    vehicle_year, 
    RANK() OVER (ORDER BY vehicle_year ASC) AS age_rank
FROM car
NATURAL JOIN model
NATURAL JOIN brand;
-- 8. Ранжирующая функция DENSE_RANK
SELECT 
    car_id,
    brand,
    model,
    price,
    DENSE_RANK() OVER (ORDER BY price DESC) AS rank_by_price
FROM car
NATURAL JOIN model
NATURAL JOIN brand;
-- 9. Ранжирующая функция NTILE
SELECT 
    car_id,
    brand,
    model,
    vehicle_year, 
    NTILE(2) OVER (ORDER BY vehicle_year ASC) AS year_group
FROM car
NATURAL JOIN model
NATURAL JOIN brand;
-- 10. Функция смещения LEAD
SELECT 
    car_id,
    brand,
    model,
    price, 
    LEAD(price, 1, price) OVER (ORDER BY price) - price AS price_difference
FROM car
NATURAL JOIN model
NATURAL JOIN brand;
-- 11. Функция смещения LAG
SELECT 
    car_id,
    brand,
    model,
    price, 
    LAG(price, 1, price) OVER (ORDER BY price DESC) - price AS price_difference
FROM car
NATURAL JOIN model
NATURAL JOIN brand;
-- 12. Функция смещения FIRST_VALUE() и LAST_VALUE()
SELECT DISTINCT
    firstname,
    surname,
    FIRST_VALUE(price) OVER (PARTITION BY client_id ORDER BY price) AS lowest_price,
    LAST_VALUE(price) OVER (PARTITION BY client_id ORDER BY price ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS highest_price
FROM car_order
NATURAL JOIN client
NATURAL JOIN car;

