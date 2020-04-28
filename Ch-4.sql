/* Made by Zhongli Liang */ /*1. Write aSELECT statement that inner joins the Categories table to the Products table
        AND returns these columns: category_name,
         product_name,
         list_price. Sort the result SET by category_name
        AND THEN
    by product_name IN ascending sequence. */
    SELECT category_name,
         product_name,
         list_price
FROM categories cat
INNER JOIN products pr
    ON cat.category_id = pr.category_id
ORDER BY  category_name,
         product_name ASC /*2. Write aSELECT statement that inner joins the Customers table to the Addresses table
        AND returns these columns: first_name, last_name, line1, city, state, zip_code. Return one row for each address for the customer
WITH an email address of allan.sherwood@yahoo.com. */
SELECT first_name,
         last_name,
         line1,
         city,
         state,
         zip_code
FROM customers cus
JOIN addresses ad
    ON cus.customer_id = ad.customer_id
WHERE cus.email_address = 'allan.sherwood@yahoo.com' /* 3. Write aSELECT statement that inner joins the Customers table to the Addresses table
        AND returns these columns: first_name,
         last_name,
         line1,
         city,
         state,
         zip_code. Return one row for each customer,
         but only return addresses that are the shipping address for a customer. */
         SELECT first_name,
         last_name,
         line1,
         city,
         state,
         zip_code
FROM customers cus
JOIN addresses ad
    ON cus.customer_id = ad.customer_id
        AND cus.shipping_address_id = ad.address_id /*4. Write aSELECT statement that inner joins the Customers,
         Orders,
         Order_Items,
        
        AND Products tables. This statement should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount,
        AND quantity. Use aliases for the tables. */
        SELECT last_name,
         first_name,
         order_date,
         product_name,
         item_price,
         discount_amount,
         quantity
FROM customers cus
JOIN orders o
    ON cus.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products pr
    ON oi.product_id = pr.product_id
ORDER BY  last_name,
         order_date,
         product_name /*5. Write aSELECT statement that returns the product_name
        AND list_price columns
FROM the Products table. Return one row for each product that has the same list price AS another product. Hint: check that the product_id columns aren’t equal but the list_price columns are equal. Sort the result SET by product_name. */
SELECT p1.product_name,
        
         p1.list_price
FROM products p1
JOIN products p2
    ON (p1.list_price = p2.list_price)
        AND (p1.product_id <> p2.product_id)
ORDER BY  product_name /*6. Write aSELECT statement that returns these two columns: category_name The category_name column
FROM the Categories table product_id The product_id column
FROM the Products table Return one row for each category that has never been used. Hint: Use an outer join
        AND only return rows
WHERE the product_id column contains a NULL value. */
SELECT cat.category_name,
         product_id
FROM categories cat
LEFT JOIN products pr
    ON cat.category_id = pr.category_id /*7. Use the
UNION
operator to generate a result SET consisting of three columns
FROM the Orders table: ship_status A calculated column that contains a value of SHIPPED
        OR NOT SHIPPED order_id The order_id column order_date The order_date column If the order has a value IN the ship_date column,
        
         the ship_status column should contain a value of SHIPPED. Otherwise,
        
         it should contain a value of NOT SHIPPED. Sort the final result SET by order_date. */
         SELECT order_id,
        
         order_date,
        
         'SHIPPED' AS ship_status
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT order_id,
         order_date,
         'NOT SHIPPED' AS ship_status
FROM orders
WHERE ship_date IS NULL
ORDER BY  order_date 