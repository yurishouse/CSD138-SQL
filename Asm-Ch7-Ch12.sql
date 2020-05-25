/* Made by Zhongli Liang */

/* 1 */
SELECT DISTINCT category_name
FROM categories c
WHERE c.category_id IN 
    (SELECT p.category_id
    FROM products p)
ORDER BY  category_name 
/* 2 */
SELECT product_name,
         list_price
FROM products
WHERE list_price > 
    (SELECT AVG(p.list_price)
    FROM products p)
ORDER BY  list_price 
/* 3 */
SELECT c.category_name
FROM categories c
WHERE NOT EXISTS 
    (SELECT 1
    FROM products p
    WHERE p.category_id = c.category_id); 
/* 4 */
SELECT p1.product_name,
         p1.discount_percent
FROM products AS p1
WHERE p1.discount_percent NOT IN 
    (SELECT p2.discount_percent
    FROM products AS p2
    WHERE p1.product_name <> p2.product_name)
ORDER BY  product_name 
/* 5 */
SELECT email_address,
         order_date,
         order_id
FROM 
    (SELECT ROW_NUMBER() OVER(PARTITION BY c.customer_id
    ORDER BY  order_date DESC)RNO, email_address, order_date, order_id
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id )TAB
WHERE RNO=1
/* 6 part a *
CREATE VIEW customer_addresses AS SELECT cust.customer_id,
         cust.email_address,
         cust.last_name,
         cust.first_name,
         bill.line1 AS bill_line1,
         bill.line2 AS bill_line2,
         bill.city AS bill_city,
         bill.state AS bill_state,
         bill.zip_code AS bill_zip,
         ship.line1 AS ship_line1,
         ship.line2 AS ship_line2,
         ship.city AS ship_city,
         ship.state AS ship_state,
         ship.zip_code AS ship_zip
FROM customers cust, addresses ship, addresses bill
WHERE cust.billing_address_id = bill.address_id
        AND cust.shipping_address_id = ship.address_id;
/* 6 part b */
SELECT customer_id,
         last_name,
         first_name,
         bill_line1
FROM customer_addresses; 