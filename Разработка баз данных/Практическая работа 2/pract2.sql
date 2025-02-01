SELECT * FROM client WHERE client_id = 2;
SELECT * FROM engine WHERE engine_power != 1500;
SELECT * FROM supplier WHERE supplier_id > 3;
SELECT * FROM client WHERE passport >= 6324500000;
SELECT * FROM car WHERE price < 40000000;
SELECT * FROM engine WHERE engine_capacity <= 5.2;
SELECT * FROM engine WHERE engine_capacity IS NOT NULL;
SELECT * FROM engine WHERE engine_capacity IS NULL;
SELECT * FROM car WHERE price BETWEEN 1000000 AND 20000000;
SELECT * FROM car_order WHERE status_id IN (1, 2);
SELECT * FROM seller WHERE seller_id NOT IN (2, 4, 6);
SELECT * FROM client WHERE surname LIKE 'К%';
SELECT * FROM seller WHERE patronymic NOT LIKE '%вн%';

SELECT * FROM car ORDER BY price;
SELECT * FROM car_order ORDER BY order_date DESC;

UPDATE client SET surname = 'Коротков' WHERE client_id = 14;
ALTER TABLE seller ADD COLUMN number_sold_cars SMALLINT;


SELECT * FROM brand WHERE brand BETWEEN 'Bugatti' AND 'Lamborghini';
SELECT * FROM car ORDER BY drive_id, price;
