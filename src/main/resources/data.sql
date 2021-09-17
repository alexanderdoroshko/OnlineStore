--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------
-- DROP TABLE IF EXISTS CATEGORIES;
CREATE TABLE IF NOT EXISTS CATEGORIES (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(45) NOT NULL,
    RATING INT NOT NULL,
    IMAGE_PATH VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_CATEGORY_ID_UNIQUE (ID ASC),
    UNIQUE INDEX IDX_NAME_UNIQUE (NAME ASC));

--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------
-- DROP TABLE IF EXISTS USERS;
CREATE TABLE IF NOT EXISTS USERS (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(45) NOT NULL,
    SURNAME VARCHAR(45) NOT NULL,
    EMAIL VARCHAR(200) NOT NULL,
    PASSWORD VARCHAR(50) NOT NULL,
    DATE_OF_BIRTHDAY DATE NOT NULL,
    BALANCE INT NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_USER_ID_UNIQUE (ID ASC),
    UNIQUE INDEX IDX_EMAIL_UNIQUE (EMAIL ASC),
    UNIQUE INDEX IDX_PASSWORD_UNIQUE (PASSWORD ASC));

--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------
-- DROP TABLE IF EXISTS ORDERS;
CREATE TABLE IF NOT EXISTS ORDERS (
    ID INT NOT NULL AUTO_INCREMENT,
    DATE VARCHAR(50) NOT NULL,
    PRICE INT NOT NULL,
    USER_ID INT NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_ID_UNIQUE (ID ASC),
    CONSTRAINT FK_ORDERS_USER_ID_USERS_ID
    FOREIGN KEY (USER_ID)
    REFERENCES USERS (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------
-- DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE IF NOT EXISTS PRODUCTS (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(300) NULL,
    IMAGE_PATH VARCHAR(200) NOT NULL,
    PRICE INT NOT NULL,
    CATEGORY_ID INT NOT NULL,
    PRIMARY KEY (ID),
--     UNIQUE INDEX IDX_ID_UNIQUE (ID ASC),
    CONSTRAINT FK_PRODUCTS_CATEGORY_ID_CATEGORIES_ID
    FOREIGN KEY (CATEGORY_ID)
    REFERENCES CATEGORIES (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

--------------------------------------------------------
--  DDL for Table ORDERS_PRODUCTS
--------------------------------------------------------
-- DROP TABLE IF EXISTS ORDERS_PRODUCTS;
CREATE TABLE IF NOT EXISTS ORDERS_PRODUCTS (
    ORDER_ID INT NOT NULL,
    PRODUCT_ID INT NOT NULL,
    PRIMARY KEY (ORDER_ID, PRODUCT_ID),
    CONSTRAINT FK_ORDERS_PRODUCTS_ORDER_ID_ORDERS_ID
    FOREIGN KEY (ORDER_ID)
    REFERENCES ORDERS(ID),
    CONSTRAINT FK_ORDERS_PRODUCTS_PRODUCT_ID_PRODUCTS_ID
    FOREIGN KEY (PRODUCT_ID)
    REFERENCES PRODUCTS(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO `categories` (`ID`, `NAME`, `RATING`, `IMAGE_PATH`) VALUES ('1', 'Mobile phones', '1', 'mobile.jpg');
INSERT INTO `categories` (`ID`, `NAME`, `RATING`, `IMAGE_PATH`) VALUES ('2', 'Laptop', '1', 'laptop.jpg');
INSERT INTO `categories` (`ID`, `NAME`, `RATING`, `IMAGE_PATH`) VALUES ('3', 'Fridges', '2', 'fridge.jpg');
INSERT INTO `categories` (`ID`, `NAME`, `RATING`, `IMAGE_PATH`) VALUES ('4', 'Cameras', '4', 'camera.jpg');
INSERT INTO `categories` (`ID`, `NAME`, `RATING`, `IMAGE_PATH`) VALUES ('5', 'GPS navigators', '4', 'gps-nav.jpg');
INSERT INTO `categories` (`ID`, `NAME`, `RATING`, `IMAGE_PATH`) VALUES ('6', 'Car', '3', 'car.jpg');

-- Телефоны
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('1', 'Смартфон Xiaomi Mi 11 Lite 6GB/128GB международная версия с NFC', 'Android, экран 6.55\" AMOLED (1080x2400), Qualcomm Snapdragon 732G, ОЗУ 6 ГБ, флэш-память 128 ГБ, карты памяти, камера 64 Мп, аккумулятор 4250 мАч, 2 SIM', 'Xiaomi Mi 11 lite .jpeg', '939', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('2', 'Samsung Galaxy M31 SM-M315F', 'Android, экран 6.4\" AMOLED (1080x2340), Exynos 9611, ОЗУ 6 ГБ, флэш-память 128 ГБ, карты памяти, камера 64 Мп, аккумулятор 6000 мАч, 2 SIM', 'Samsung Galaxy M31 SM-M315F.jpeg', '690', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('3', 'Apple iPhone XR 64GB', 'Apple iOS, экран 6.1\" IPS (828x1792), Apple A12 Bionic, ОЗУ 3 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 2942 мАч, 1 SIM', 'Apple iPhone XR 64GB.jpeg', '1470', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('4', 'Смартфон HONOR 30i LRA-LX1 4GB/128GB', 'Android, экран 6.3" AMOLED (1080x2400), HiSilicon Kirin 710F, ОЗУ 4 ГБ, флэш-память 128 ГБ, карты памяти, камера 48 Мп, аккумулятор 4000 мАч, 2 SIM', 'honorSmart.jpeg', '550', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('5', 'Смартфон Realme 6 Pro 8GB/128GB международная версия (синяя молния)','Android, экран 6.6" IPS (1080x2400), Qualcomm Snapdragon 720G, ОЗУ 8 ГБ, флэш-память 128 ГБ, карты памяти, камера 64 Мп, аккумулятор 4300 мАч, 2 SIM', 'realme6.jpeg', '729', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('6', 'Смартфон OnePlus Nord N10 5G (полуночный лед)','Android, экран 6.49" IPS (1080x2400), Qualcomm Snapdragon 690, ОЗУ 6 ГБ, флэш-память 128 ГБ, карты памяти, камера 64 Мп, аккумулятор 4300 мАч, 2 SIM', 'oneplus.jpeg', '1020', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('7', 'Смартфон Nokia G20 4GB/64GB (грозовое небо)','Android, экран 6.5" IPS (720x1600), Mediatek Helio G35, ОЗУ 4 ГБ, флэш-память 64 ГБ, карты памяти, камера 48 Мп, аккумулятор 5050 мАч, 2 SIM', 'nokiag20.jpeg', '450', '1');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('8', 'Смартфон Samsung Galaxy S21 5G SM-G9910 8GB/128GB (фиолетовый фантом)','Android, экран 6.2" AMOLED (1080x2400), Qualcomm Snapdragon 888, ОЗУ 8 ГБ, флэш-память 128 ГБ, камера 64 Мп, аккумулятор 4000 мАч, 2 SIM', 'samsung2.jpeg', '2150', '1');

-- Ноутбуки
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('9', 'Ноутбук Huawei MateBook D 14 AMD NblL-WDQ9', '14.0\" 1920 x 1080 IPS, 60 Гц, несенсорный, AMD Ryzen 5 4500U 2300 МГц, 8 ГБ, SSD 512 ГБ, видеокарта встроенная, Windows 10, цвет крышки серый', 'huaweiNote.jpeg', '2699', '2');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('10', 'Ноутбук Lenovo IdeaPad S145-15API 81UT00MLRE', '15.6\" 1920 x 1080 TN+Film, 60 Гц, несенсорный, AMD 3020e 1200 МГц, 4 ГБ, SSD 256 ГБ, видеокарта встроенная, без ОС, цвет крышки серый', 'lenovoNote.jpeg', '897', '2');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('11', 'Ноутбук ASUS VivoBook 15 X512DA-BQ1134', '15.6\" 1920 x 1080 IPS, 60 Гц, несенсорный, AMD Ryzen 5 3500U 2100 МГц, 8 ГБ, SSD 512 ГБ, видеокарта встроенная, Linux, цвет крышки серый', 'asusNote.jpeg', '1579', '2');

-- Холодильники
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('12', 'Холодильник Indesit ITS 4200 W', 'полный No Frost, механическое управление, класс A, полезный объём: 325 л (247 + 78 л), 60x64x196 см, белый', 'indesitFridge.jpeg', '849', '3');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('13', 'Холодильник ATLANT ХМ 4621-141', 'полный No Frost, механическое управление, класс A, полезный объём: 325 л (247 + 78 л), 60x64x196 см, белый', 'atlantFridge.jpeg', '968', '3');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('14', 'Холодильник LG GA-B419SLGL', 'полный No Frost, электронное управление, класс A+, полезный объём: 302 л (223 + 79 л), инверторный компрессор, 59.5x64.3x190.7 см, графит', 'LgFriedge.jpeg', '1200', '3');

-- Камеры
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('15', 'Беззеркальный фотоаппарат Sony Alpha a7 III Body', 'беззеркальная камера, матрица Full frame (полный кадр) 24.2 Мп, без объектива (body), Wi-Fi', 'sonyCamera.jpeg', '4700', '4');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('16', 'Зеркальный фотоаппарат Canon EOS 6D Body', 'зеркальная камера, матрица Full frame (полный кадр) 20.2 Мп, без объектива (body), Wi-Fi', 'CanonCamera.jpg', '3399', '4');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('17', 'Зеркальный фотоаппарат Nikon D3500 Kit 18-55mm VR', 'зеркальная камера, матрица APS-C (1.5 crop) 24.2 Мп, с объективом F3.5-5.6 18-55 мм', 'NikonCamera.jpeg', '1320', '4');

-- GPS навигаторы
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('18', 'GPS навигатор NAVITEL T737 PRO', 'экран 7\" IPS (1024 x 600), процессор MediaTek MT8321 1300 МГц, ОЗУ 1 Гб, флэш-память 16 ГБ, 3G, камера 2 Мп, Android 9.0 Pie', 'navitelGPS.jpeg', '276', '5');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('19', 'GPS навигатор Garmin Drive 52 MT', 'экран 5\" TFT (480 x 272)', 'garminGps.jpeg', '547', '5');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('20', 'GPS навигатор GEOFOX MID 702 ХЕ', 'экран 7\" TFT (800 x 480), процессор MStar MSB2531 800 МГц, ОЗУ 256 Мб, флэш-память 8 Гб, Windows CE 6.0', 'geofoxGPS.jpeg', '220', '5');

-- Car
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('21', 'Lexus NX', '2018 г., автомат, 2.0 л, бензин, 50 000 км', 'LexusCar.jpeg', '86320', '6');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('22', 'Infiniti Q30', '2017 г., механика, 1.5 л, дизель, 47 000 км', 'infinityCar.jpeg', '46200', '6');
INSERT INTO `products` (`ID`, `NAME`, `DESCRIPTION`, `IMAGE_PATH`, `PRICE`, `CATEGORY_ID`) VALUES ('23', 'Renault Megane III', '2010 г., механика, 1.5 л, дизель, 224 000 км', 'renaultCarjpeg.jpeg', '17400', '6');

--User
INSERT INTO `users` (`ID`, `NAME`, `SURNAME`, `EMAIL`, `PASSWORD`, `DATE_OF_BIRTHDAY`, `BALANCE`) VALUES ('1', 'Alex', 'Doroshko', 'hangman2311@gmal.com', 'dragonborn', '1988-11-23', '1000');






