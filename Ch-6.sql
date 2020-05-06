/* Made by Zhongli Liang */

/* 1 */
SELECT COUNT(order_id) AS order_count,
         SUM(tax_amount) AS Tax_Total
FROM orders 
/* 2 */

SELECT category_name,
         COUNT(*) AS productCount,
         MAX(list_price) AS MostExpensiveProduct
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
GROUP BY  category_name
ORDER BY  productCount DESC

/* 3 */
SELECT email_address,
         SUM(item_price * quantity) AS itemPriceTotal,
         SUM(discount_amount * quantity) AS discountAmountTotal
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY  email_address
ORDER BY  itemPriceTotal DESC 
/* 4 */

SELECT email_address,
         COUNT(o.order_id) AS order_count,
         SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY  email_address
HAVING COUNT(o.order_id) > 1
ORDER BY  order_total DESC 

/* 5 */
SELECT email_address,
         COUNT(o.order_id) AS order_count,
         SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE item_price > 400
GROUP BY  email_address
HAVING COUNT(o.order_id) > 1
ORDER BY  order_total DESC; 

/* 6 */

SELECT product_name,
         SUM((item_price - discount_amount) * quantity) AS ProductTotal
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY  product_name
WITH ROLLUP 

/* 7 */

SELECT email_address,
         COUNT(DISTINCT oi.product_id) AS NumberOfProducts
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY  email_address
HAVING COUNT(DISTINCT oi.product_id) > 1
ORDER BY  email_address 
