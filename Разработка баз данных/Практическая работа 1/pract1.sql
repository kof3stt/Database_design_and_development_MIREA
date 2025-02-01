CREATE DATABASE auto_show;
\c auto_show

CREATE TABLE client(
    client_id SERIAL PRIMARY KEY,
    firstname VARCHAR (50) NOT NULL,
    surname VARCHAR (50) NOT NULL,
    patronymic VARCHAR (50) NOT NULL,
    passport BIGINT NOT NULL UNIQUE
);

CREATE TABLE supplier(
    supplier_id BIGSERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE seller(
    seller_id BIGSERIAL PRIMARY KEY,
    firstname VARCHAR (50) NOT NULL,
    surname VARCHAR (50) NOT NULL,
    patronymic VARCHAR (50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE order_status(
    status_id SMALLSERIAL PRIMARY KEY,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE brand(
    brand_id SERIAL PRIMARY KEY,
    brand VARCHAR(100) NOT NULL
);

CREATE TABLE model(
    model_id SERIAL PRIMARY KEY,
    brand_id INT REFERENCES brand(brand_id) ON DELETE CASCADE NOT NULL,
    model VARCHAR(100) NOT NULL
);

CREATE TABLE color(
    color_id SERIAL PRIMARY KEY,
    color VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE drive(
    drive_id SMALLSERIAL PRIMARY KEY,
    drive_type VARCHAR(50) NOT NULL
);

CREATE TABLE engine_type(
    engine_type_id SMALLSERIAL PRIMARY KEY,
    engine_type VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE engine(
    engine_id BIGSERIAL PRIMARY KEY,
    engine_power BIGINT NOT NULL,  --(мощность, л.с)
    engine_capacity REAL, --(объем, null для электро)
    battery_capacity INT, --(емкость батареи, null для бензина)
    engine_type_id SMALLINT REFERENCES engine_type(engine_type_id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    model_id SMALLINT REFERENCES model(model_id) ON DELETE CASCADE NOT NULL,
    drive_id SMALLINT REFERENCES drive(drive_id) ON DELETE CASCADE NOT NULL,
    price BIGINT NOT NULL,
    mileage INT NOT NULL,
    vehicle_year SMALLINT NOT NULL,
    color_id SMALLINT REFERENCES color(color_id) ON DELETE CASCADE NOT NULL,
    engine_id BIGINT REFERENCES engine(engine_id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE car_order(
    order_id BIGSERIAL PRIMARY KEY,
    status_id SMALLINT REFERENCES order_status(status_id) ON DELETE CASCADE NOT NULL,
    order_date DATE NOT NULL,
    car_id INT REFERENCES car(car_id) ON DELETE CASCADE NOT NULL,
    client_id INT REFERENCES client(client_id) ON DELETE CASCADE NOT NULL,
    supplier_id INT REFERENCES supplier(supplier_id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE contract(
    contract_id BIGSERIAL PRIMARY KEY,
    seller_id BIGINT REFERENCES seller(seller_id) ON DELETE CASCADE NOT NULL,
    order_id BIGINT REFERENCES car_order(order_id) ON DELETE CASCADE NOT NULL
);

INSERT INTO client (firstname, surname, patronymic, passport) VALUES 
    ('Александр', 'Арефьев', 'Михайлович', 6324170051),
    ('Александр', 'Васильев', 'Станиславович', 6324548740),
    ('Даниил', 'Волков', 'Андреевич', 6324733970),
    ('Валерия', 'Воробей', 'Глебовна', 6324890496),
    ('Егор', 'Гасилин', 'Денисович', 6324275675),
    ('Ольга', 'Довбуш', 'Александровна', 6324602322),
    ('Леонид', 'Егоров', 'Александрович', 6324601436),
    ('Николай', 'Заковряшин', 'Михайлович', 6324587891),
    ('Эдуард', 'Исаков', 'Вячеславович', 6324156944),
    ('Александр', 'Калмыков', 'Михайлович', 6324057936),
    ('Софья', 'Капитонова', 'Романовна', 6324458970),
    ('Арина', 'Карева', 'Александровна', 6324262081),
    ('Владислав', 'Кликушин', 'Игоревич', 6324738250),
    ('Александр', 'Корольков', 'Дмитриевич', 6324929817),
    ('Данил', 'Коротков', 'Игоревич', 6324579623),
    ('Дмитрий', 'Орехов', 'Сергеевич', 6324258070),
    ('Александр', 'Основин', 'Игоревич', 6324517967),
    ('Кирилл', 'Павлов', 'Сергеевич', 6324691698),
    ('Александра', 'Преснякова', 'Владимировна', 6324141182),
    ('Юлия', 'Рапопорт', 'Юрьевна', 6324321841),
    ('Владимир', 'Расщепкин', 'Антонович', 6324880154),
    ('Егор', 'Ромашов', 'Алексеевич', 6324768917),
    ('Илья', 'Рудиков', 'Михайлович', 6324643746),
    ('Тимур', 'Сариков', 'Аслиддинович', 6324113058),
    ('Илья', 'Серебренников', 'Константинович', 6324133236),
    ('Павел', 'Суховилов', 'Павлович', 6324511815),
    ('Тимур', 'Шарибов', 'Рамазанович', 6324438243),
    ('Павел', 'Яковлев', 'Андреевич', 6324690550),
    ('Леонид', 'Яськов', 'Владимирович', 6324866341),
    ('Данила', 'Яшин', 'Олегович', 6324060179);

INSERT INTO supplier (email, country) VALUES 
    ('akatev@mirea.ru', 'Россия'),
    ('zheleznyak@mirea.ru', 'Египет'),
    ('sorokin_a@mirea.ru', 'Индия'),
    ('dzerzhinskij@mirea.ru', 'Россия'),
    ('puturidze@mirea.ru', 'Грузия');

INSERT INTO seller (firstname, surname, patronymic, phone_number, email) VALUES 
    ('Людмила', 'Скворцова', 'Анатольевна', '+79152893255', 'skvortsova@mirea.ru'),
    ('Александр', 'Филатов', 'Сергеевич', '+79261234568', 'filatov_a@mirea.ru'),
    ('Михаил', 'Рысин', 'Леонидович', '+79361234569', 'rysin@mirea.ru'),
    ('Марина', 'Туманова', 'Борисовна', '+79161236879', 'tumanova@mirea.ru'),
    ('Ирина', 'Куликова', 'Викторовна', '+79161236015', 'kulikova_irv@mirea.ru'),
    ('Иван', 'Зайцев', 'Юрьевич', '+79163245643', 'zajcev_i@mirea.ru'),
    ('Галина', 'Богомольная', 'Владимировна', '+79163241010', 'bogomolnaya@mirea.ru');

INSERT INTO order_status (status) VALUES 
    ('Ожидается'),
    ('Отправлен'),
    ('Доставлен');

INSERT INTO brand (brand) VALUES 
    ('Bugatti'),
    ('Nissan'),
    ('Xiaomi'),
    ('Mercedes-Benz'),
    ('Lamborgini');

INSERT INTO model (brand_id, model) VALUES 
    (1, 'Chiron'),
    (1, 'Divo'),
    (2, 'Juke'),
    (2, 'GT-R'),
    (3, 'SU7'),
    (4, 'GLS 450'),
    (5, 'Huracan Tecnica'),
    (5, 'Aventador SVJ'),
    (2, 'Pathfinder');

INSERT INTO color (color) VALUES 
    ('Оранжевый'),
    ('Синий'),
    ('Белый'),
    ('Чёрный'),
    ('Голубой'),
    ('Серебристый');

INSERT INTO drive (drive_type) VALUES 
    ('Полный'),
    ('Передний'),
    ('Задний');

INSERT INTO engine_type (engine_type) VALUES 
    ('Бензин'),
    ('Дизель'),
    ('Электро');

INSERT INTO engine (engine_power, engine_capacity, battery_capacity, engine_type_id) VALUES 
    (1500, 8, NULL, 1),
    (117, 1.6, NULL, 1),
    (555, 3.8, NULL, 1),
    (673, NULL, 495, 3),
    (367, 3, NULL, 2),
    (640, 5.2, NULL, 1),
    (770, 6.5, NULL, 1),
    (174, 2.5, NULL, 2);

INSERT INTO car (model_id, drive_id, price, mileage, vehicle_year, color_id, engine_id) VALUES 
    (1, 1, 400000000, 1, 2021, 2, 1),
    (2, 1, 985000000, 700, 2021, 4, 1),
    (3, 2, 1250000, 126300, 2012, 3, 2),
    (4, 1, 14500000, 1800, 2017, 1, 3),
    (5, 1, 6250000, 55, 2024, 5, 4),
    (6, 1, 18690000, 10, 2024, 4, 5),
    (7, 3, 40900000, 0, 2024, 1, 6),
    (8, 1, 99200000, 0, 2024, 4, 7),
    (9, 1, 1180000, 299900, 2005, 6, 8),
    (5, 1, 6000000, 37, 2024, 3, 4);

INSERT INTO car_order (status_id, order_date, car_id, client_id, supplier_id) VALUES 
    (1, '2024-10-01', 1, 1, 1),
    (2, '2021-01-05', 2, 4, 2),
    (3, '2024-10-05', 3, 7, 3),
    (2, '2024-10-22', 4, 14, 4),
    (1, '2022-10-05', 5, 13, 5),
    (2, '2024-10-24', 6, 15, 5),
    (3, '2024-10-23', 7, 3, 4),
    (3, '2024-12-09', 8, 13, 3),
    (1, '2024-12-10', 9, 2, 2),
    (2, '2024-12-12', 10, 5, 2);

INSERT INTO contract (seller_id, order_id) VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (7, 8),
    (4, 9),
    (1, 10);
