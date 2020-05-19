/* 1 */
/*Display the part number, description and price for each part. Order by price in descending order.*/
SELECT
    p.part_num,
    p.description,
    p.price
FROM
    part p
ORDER BY
    p.price
DESC
    
/* 2 */
/* List the names of customers with credit limits of $7,500 or less. */
SELECT
    c.customer_name,
    c.credit_limit
FROM
    customer c
WHERE
    c.credit_limit <= 7500

/* 3 */
/* List the names of customers with credit limits of $7,500 or less, who are assigned to sales rep 35 or sales rep 65. */
SELECT
    c.customer_name,
    c.credit_limit,
    c.rep_num
FROM
    customer c
WHERE
    c.credit_limit <= 7500 AND c.rep_num = 35 OR c.credit_limit <= 7500 AND c.rep_num = 65

/* 4 */
/* List the part number and part description of each part that is not in item class AP or SG. Do this in two different ways. */
/* 1st way */
SELECT
    p.part_num,
    p.description,
    p.class
FROM
    part p
WHERE
    p.class != 'AP' AND p.class != 'SG'
/* 2nd way */
SELECT
    p.part_num,
    p.description,
    p.class
FROM
    part p
WHERE NOT
    p.class = 'AP' AND NOT p.class = 'SG'
/* 5 */
/* List the part number, description, and number of units on hand for each part that has between 10 and 25 units on hand, including both 10 and 25. */
SELECT
    p.part_num,
    p.description,
    p.on_hand
FROM
    part p
WHERE
    p.on_hand >= 10 AND p.on_hand <= 25
/* 6 */
/*List the part number, part description, and on-hand value for each part for which the on-hand
value is at least $7,500. Assign the name ON_HAND_VALUE to the computation. (On hand value
is calculated by multiplying the quantity on hand times the price of each item.)*/
/*List the part number, part description, and on-hand value for each part for which the on-hand value is at least $7,500. Assign the name ON_HAND_VALUE to the computation. (On hand value is calculated by multiplying the quantity on hand times the price of each item.)*/
SELECT
    p.part_num,
    p.description,
    (p.on_hand * p.price) AS on_hand_value
FROM
    part p
WHERE on_hand_value <= 7500
/* 7 */
/* Find the number and name of each customer whose name begins with the letter "K". */
SELECT
    c.customer_num,
    c.customer_name
FROM
    customer c
WHERE
    c.customer_name LIKE "K%"
/* 8 */
/* Display the number of customers whose balances exceed their credit limits. */
SELECT
    COUNT(*)
FROM
    customer c
WHERE
    c.balance > c.credit_limit
/* 9 */
/* List the sum of the balances of all customers for each sales rep. */
SELECT
    rep_num,
    SUM(balance)
FROM
    customer
GROUP BY
    rep_num
/* 10 */
/* List the sum of the balances of all customers for each sales rep, but restrict the output to those sales reps for which the sum is more than $10,000. */
SELECT
    rep_num,
    SUM(balance)
FROM
    customer
GROUP BY
    rep_num
HAVING
    SUM(balance) > 10000
/* 11 */
/* List the part number of any part with an unknown description. */
SELECT
    p.part_num
FROM
    part p
WHERE
    p.description = 'unknown'
/* 12 */

/* 13 */