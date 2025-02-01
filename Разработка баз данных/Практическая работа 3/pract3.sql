-- Команда для резервного копирования
pg_dump -d auto_show -U postgres -f pract_backup.sql

-- 1. Операция проекции. Осуществляется выбор только части полей таблицы, т.е. производится вертикальная выборка данных.
SELECT brand FROM brand;
SELECT price FROM car;
SELECT surname FROM client;

-- 2. Операция селекции. Осуществляется горизонтальная выборка – в результат попадают только записи, удовлетворяющие условию.
SELECT * FROM seller WHERE surname LIKE 'З%';
SELECT * FROM car WHERE price > 5000000;

-- 3. Операции соединения. Здесь следует выделить декартово произведение и на его основе соединение по условию, а также естественное соединение (по одноименным полям или равенству полей с одинаковым смыслом).
SELECT 
    client.firstname, 
    client.surname, 
    car_order.order_id, 
    car_order.order_date
FROM 
    car_order, client
WHERE 
    car_order.client_id = client.client_id;


SELECT 
    client.firstname, 
    client.surname, 
    car_order.order_id, 
    car_order.order_date
FROM 
    car_order
INNER JOIN client on client.client_id = car_order.client_id;


SELECT 
    car_order.order_id, 
    car_order.order_date, 
    car.price, 
    car.mileage
FROM 
    car_order
NATURAL JOIN car;


SELECT
    car.car_id,
    model.model,
    color.color,
    price
FROM
    car, model, color
WHERE car.model_id = model.model_id
AND car.color_id = color.color_id
AND color = 'Оранжевый';


SELECT
    car_id,
    model,
    color,
    price
FROM
    car
NATURAL JOIN model
INNER JOIN color on car.color_id = color.color_id
WHERE color.color = 'Оранжевый';
-- 4. Операция объединения.
SELECT 
    car_order.order_id, 
    car_order.order_date, 
    order_status.status
FROM 
    car_order
NATURAL JOIN order_status
WHERE order_status.status = 'Ожидается' OR order_status.status = 'Отправлен';


SELECT 
    car_order.order_id, 
    car_order.order_date, 
    order_status.status
FROM 
    car_order
INNER JOIN order_status ON car_order.status_id = order_status.status_id
WHERE order_status.status = 'Ожидается'
UNION
SELECT 
    car_order.order_id, 
    car_order.order_date, 
    order_status.status
FROM 
    car_order
INNER JOIN order_status ON car_order.status_id = order_status.status_id
WHERE order_status.status = 'Отправлен';


SELECT 
    car_order.order_id, 
    car_order.order_date, 
    brand.brand,
    model.model,
    car.price,
    car.vehicle_year
FROM 
    car_order
NATURAL JOIN car
NATURAL JOIN model
NATURAL JOIN brand
WHERE brand.brand = 'Bugatti' or brand.brand = 'Lamborgini';


SELECT 
    car_order.order_id, 
    car_order.order_date, 
    brand.brand,
    model.model,
    car.price,
    car.vehicle_year
FROM 
    car_order
NATURAL JOIN car
NATURAL JOIN model
NATURAL JOIN brand
WHERE brand.brand = 'Bugatti'
UNION
SELECT 
    car_order.order_id, 
    car_order.order_date, 
    brand.brand,
    model.model,
    car.price,
    car.vehicle_year
FROM 
    car_order
NATURAL JOIN car
NATURAL JOIN model
NATURAL JOIN brand
WHERE brand.brand = 'Lamborgini';
-- 5. Операция пересечения.
SELECT c.client_id, c.firstname, c.surname
FROM client c
WHERE EXISTS (
    SELECT *
    FROM car_order co
    NATURAL JOIN order_status os
    WHERE co.client_id = c.client_id AND os.status = 'Доставлен'
)
AND EXISTS (
    SELECT *
    FROM car_order co
    NATURAL JOIN order_status os
    WHERE co.client_id = c.client_id AND os.status = 'Ожидается'
);


SELECT c.client_id, c.firstname, c.surname
FROM client c
NATURAL JOIN car_order
NATURAL JOIN order_status
WHERE order_status.status = 'Доставлен'
INTERSECT
SELECT c.client_id, c.firstname, c.surname
FROM client c
NATURAL JOIN car_order
NATURAL JOIN order_status
WHERE order_status.status = 'Ожидается';


SELECT s.seller_id, s.firstname, s.surname, s.patronymic
FROM seller s
JOIN contract c1 ON s.seller_id = c1.seller_id
JOIN car_order co1 ON c1.order_id = co1.order_id
JOIN car car1 ON co1.car_id = car1.car_id
JOIN engine e1 ON car1.engine_id = e1.engine_id
WHERE e1.engine_power > 700
INTERSECT
SELECT s.seller_id, s.firstname, s.surname, s.patronymic
FROM seller s
JOIN contract c2 ON s.seller_id = c2.seller_id
JOIN car_order co2 ON c2.order_id = co2.order_id
JOIN car car2 ON co2.car_id = car2.car_id
JOIN engine e2 ON car2.engine_id = e2.engine_id
WHERE e2.engine_power < 700;


SELECT s.seller_id, s.firstname, s.surname
FROM seller s
WHERE EXISTS (
    SELECT 1
    FROM contract c1
    JOIN car_order co1 ON c1.order_id = co1.order_id
    JOIN car car1 ON co1.car_id = car1.car_id
    JOIN engine e1 ON car1.engine_id = e1.engine_id
    WHERE c1.seller_id = s.seller_id AND e1.engine_power > 700
)
AND EXISTS (
    SELECT 1
    FROM contract c2
    JOIN car_order co2 ON c2.order_id = co2.order_id
    JOIN car car2 ON co2.car_id = car2.car_id
    JOIN engine e2 ON car2.engine_id = e2.engine_id
    WHERE c2.seller_id = s.seller_id AND e2.engine_power < 700
);
-- 6. Операция разности. Эта операция также определяется часто с помощью подзапроса с ключевым словом NOT EXISTS, которое показывает отсутствие элемента во множестве, задаваемом подзапросом.
SELECT DISTINCT s.seller_id, s.firstname, s.surname
FROM seller s
WHERE EXISTS (
    SELECT 1
    FROM contract c
    JOIN car_order o ON c.order_id = o.order_id
    WHERE c.seller_id = s.seller_id AND EXTRACT(YEAR FROM o.order_date) = 2024
)
AND NOT EXISTS (
    SELECT 1
    FROM contract c
    JOIN car_order o ON c.order_id = o.order_id
    WHERE c.seller_id = s.seller_id AND EXTRACT(YEAR FROM o.order_date) = 2023
);


SELECT DISTINCT s.seller_id, s.firstname, s.surname
FROM seller s
JOIN (
    SELECT c.seller_id
    FROM contract c
    JOIN car_order o ON c.order_id = o.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2024
    EXCEPT
    SELECT c.seller_id
    FROM contract c
    JOIN car_order o ON c.order_id = o.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2023
) subquery ON s.seller_id = subquery.seller_id;
-- 7. Операция группировки. Эта операция связана со своеобразной сверткой таблицы по полям группировки. Помимо полей группировки результат запроса может содержать итоговые агрегирующие функции по группам (COUNT, SUM, AVG, MAX, MIN). 
SELECT brand, SUM(car.price) AS total_price
FROM car
NATURAL JOIN model
NATURAL JOIN brand
GROUP BY brand;


SELECT c.vehicle_year, AVG(c.mileage) AS avg_mileage
FROM car c
GROUP BY c.vehicle_year;


SELECT s.firstname, s.surname, COUNT(*) AS cars_sold
FROM seller s
JOIN contract c ON s.seller_id = c.seller_id
GROUP BY s.seller_id, s.firstname, s.surname;


SELECT m.model, MAX(c.price) AS max_price, MIN(c.price) AS min_price
FROM car c
JOIN model m ON c.model_id = m.model_id
GROUP BY m.model;
-- 8. Операция сортировки.
SELECT b.brand, COUNT(m.model_id) AS model_count
FROM brand b
INNER JOIN model m ON b.brand_id = m.brand_id
GROUP BY b.brand_id, b.brand
ORDER BY model_count DESC;


SELECT car_id, brand, model, mileage, engine_power
FROM car
NATURAL JOIN engine
NATURAL JOIN model
NATURAL JOIN brand
ORDER BY engine.engine_power DESC, car.mileage ASC;


SELECT s.country, s.email, COUNT(car_order.order_id) AS cars_delivered
FROM supplier s
NATURAL JOIN car_order
WHERE car_order.status_id IN (2, 3)
GROUP BY s.supplier_id, s.country, s.email
ORDER BY cars_delivered DESC;
-- 9. Операция деления.
SELECT s.supplier_id, s.email, s.country
FROM supplier s
WHERE NOT EXISTS (
    SELECT et.engine_type_id
    FROM engine_type et
    WHERE NOT EXISTS (
        SELECT co.supplier_id
        FROM car_order co
        JOIN car ca ON co.car_id = ca.car_id
        JOIN engine e ON ca.engine_id = e.engine_id
        WHERE co.supplier_id = s.supplier_id AND e.engine_type_id = et.engine_type_id
    )
);

-- 10. Создание представления.
CREATE VIEW Order_Info AS
SELECT 
    co.order_id,
    cl.firstname AS client_firstname,
    cl.surname AS client_surname,
    cl.patronymic AS client_patronymic,
    cl.passport as client_passport,
    co.order_date,
    car.price AS car_price,
    car.mileage AS car_mileage,
    car.vehicle_year AS car_year,
    b.brand AS car_brand,
    m.model AS car_model
FROM car_order co
INNER JOIN client cl ON co.client_id = cl.client_id
JOIN car ON co.car_id = car.car_id
JOIN model m ON car.model_id = m.model_id
JOIN brand b ON m.brand_id = b.brand_id;

SELECT * FROM Order_Info WHERE client_surname LIKE 'К%';

--Процедура, которая добавляет нового клиента в таблицу client
CREATE OR REPLACE PROCEDURE add_client(
    p_firstname VARCHAR,
    p_surname VARCHAR,
    p_patronymic VARCHAR,
    p_passport BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO client (firstname, surname, patronymic, passport)
    VALUES (p_firstname, p_surname, p_patronymic, p_passport);
END;
$$;

CALL add_client('Леонид', 'Еськов', 'Владимирович', 7777777777);
-- Процедура, которая удаляет клиента по ID.
CREATE OR REPLACE PROCEDURE delete_client(
    p_client_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM client WHERE client_id = p_client_id;
END;
$$;
-- Функция для подсчёта заказов каждого статуса.
CREATE OR REPLACE FUNCTION count_orders_by_status(p_status_id SMALLINT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    order_count INT := 0;
    order_record RECORD;
BEGIN
    FOR order_record IN SELECT order_id FROM car_order WHERE status_id = p_status_id LOOP
        order_count := order_count + 1;
    END LOOP;
    RETURN order_count;
END;
$$;

SELECT count_orders_by_status(1);
-- Функция для подсчёта общей стоимости покупок автомобилей для определённого клиента.
CREATE OR REPLACE FUNCTION total_order_cost_by_client(p_client_id INT)
RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE
    total_cost BIGINT := 0;
    order_record RECORD;
BEGIN
    FOR order_record IN
        SELECT c.price FROM car_order co
        JOIN car c ON co.car_id = c.car_id
        WHERE co.client_id = p_client_id
    LOOP
        total_cost := total_cost + order_record.price;
    END LOOP;
    RETURN total_cost;
END;
$$;

SELECT total_order_cost_by_client(13);
-- Триггер, который проверяет год выпуска автомобиля
CREATE OR REPLACE FUNCTION validate_vehicle_year_update()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.vehicle_year < 1900 OR NEW.vehicle_year > EXTRACT(YEAR FROM CURRENT_DATE) THEN
        RAISE EXCEPTION 'Некорректный год выпуска автомобиля: %', NEW.vehicle_year;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_car_update
BEFORE UPDATE ON car
FOR EACH ROW
EXECUTE FUNCTION validate_vehicle_year_update();






-- 1 процедура, 1 функция, 2 триггера

-- цикл в процедуре???
