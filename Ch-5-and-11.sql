/* 1 */
INSERT INTO categories(category_id, category_name)
VALUES(DEFAULT, 'brass')
/* 2 */
UPDATE
    categories
SET
    category_name = 'Woodwinds'
WHERE
    category_id = 5

/* 3 */
DELETE
FROM
    categories
WHERE
    category_id = 5
/* 4 */
INSERT INTO products(
    product_id,
    category_id,
    product_code,
    product_name,
    description,
    list_price,
    discount_percent,
    date_added
)
VALUES(
    DEFAULT,
    4,
    'dgx_640',
    'Yamaha DGX 640 88-Key Digital Piano',
    'Long description to come',
    799.99,
    0,
    CURRENT_TIMESTAMP
)
/* 5 */
UPDATE
    products
SET
    discount_percent = 35
WHERE
    product_id = 11
/* 6 */
INSERT INTO customers(
    email_address,
    PASSWORD,
    first_name,
    last_name
)
VALUES('rick@raven.com', '', 'Rick', 'Raven')
/* 7 */
UPDATE
    customers
SET
    customers.password = 'secret'
WHERE
    customers.email_address = 'rick@raven.com'
/* 8 */
UPDATE
    customers
SET
    customers.password = 'reset'
LIMIT 100
/* 10 */
DROP DATABASE IF EXISTS my_web_db;

CREATE DATABASE my_web_db;

USE my_web_db;

CREATE TABLE users (
  user_id       INT          PRIMARY KEY,
  email_address VARCHAR(100) UNIQUE,
  first_name    VARCHAR(45)  NOT NULL,
  last_name     VARCHAR(45)  NOT NULL
);

CREATE TABLE products (
  product_id   INT         PRIMARY KEY,
  product_name VARCHAR(45) UNIQUE
);

CREATE TABLE Downloads (
  download_id   INT         PRIMARY KEY,
  user_id       INT         NOT NULL,
  download_date DATETIME    NOT NULL,
  filename      VARCHAR(50) NOT NULL,
  product_id    INT         NOT NULL,
  CONSTRAINT FK_DownloadsUsers
    FOREIGN KEY (user_id )
    REFERENCES users (user_id),
  CONSTRAINT FK_DownloadsProducts
    FOREIGN KEY (product_id )
    REFERENCES products (product_id)
);

CREATE INDEX IX_UserID
 ON users (user_id);

CREATE INDEX IX_ProductID
 ON products (product_id);

CREATE INDEX IX_EmailAddress
 ON users (email_address);

CREATE INDEX IX_DownloadDate
 ON Downloads (download_date);

/* 11 */
USE my_web_db;

INSERT INTO users VALUES 
(1, 'shiinayuri@gmail.com', 'Shiina', 'Yuri'),
(2, 'janedoe@yahoo.com', 'Jane', 'Doe');

INSERT INTO products VALUES 
(1, 'Local Music 1'),
(2, 'Local Music 2');

INSERT INTO downloads VALUES 
(1, 1, CURRENT_TIMESTAMP, 'free_falling.mp3', 1), 
(2, 2, CURRENT_TIMESTAMP, 'stuttering.mp3', 1), 
/* 12 */
SELECT
    u.first_name,
    u.last_name,
    p.product_name
FROM
    users AS u
JOIN downloads AS d
JOIN products AS p
ORDER BY
    p.product_name,
    u.first_name,
    u.last_name
/* 13 */
USE
    my_web_db;
ALTER TABLE
    products ADD price DECIMAL(5, 2) DEFAULT 9.99;
ALTER TABLE
    products ADD date_time DATETIME;
/* 14 */
ALTER TABLE
    users
ALTER COLUMN
    first_name VARCHAR(20) NOT NULL;

UPDATE users
SET first_name = NULL
WHERE user_id = 1;

UPDATE users
SET first_name = 'Robert Charles Halliday'
WHERE user_id = 1;
