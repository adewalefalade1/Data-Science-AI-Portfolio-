/* =====================================================================
   New Wheels — SQL Business Analytics
   Author: Adewale Adeyinka Falade
   Database: New Wheels (vehicle resale) — tables: customer_t, order_t,
             product_t, shipper_t
   Tool: MySQL / SQL
   Note: Queries are my own authored solutions. The business brief and
         dataset belong to the course provider and are not reproduced here.
   ===================================================================== */


/* Q1 — Number of customers and their distribution across states */
SELECT
    state,
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    order_t
JOIN
    customer_t USING(customer_id)
GROUP BY
    state;


/* Q2 — Top 5 vehicle makers by number of customers */
SELECT
    vehicle_maker,
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    order_t
JOIN
    product_t USING(product_id)
GROUP BY
    vehicle_maker
ORDER BY
    customer_count DESC
LIMIT 5;


/* Q3 — Most preferred vehicle maker in each state */
SELECT
    c.state,
    p.vehicle_maker,
    COUNT(DISTINCT o.customer_id) AS customer_count
FROM
    order_t o
JOIN
    customer_t c ON o.customer_id = c.customer_id
JOIN
    product_t p ON o.product_id = p.product_id
GROUP BY
    c.state, p.vehicle_maker
ORDER BY
    c.state, customer_count DESC;


/* Q4 — Distribution of customer feedback ratings */
SELECT
    customer_feedback,
    COUNT(*) AS feedback_count
FROM
    order_t
WHERE
    customer_feedback IS NOT NULL
GROUP BY
    customer_feedback;


/* Q5 — Percentage distribution of feedback by quarter (dissatisfaction trend) */
SELECT
    quarter_number,
    ROUND(SUM(CASE WHEN customer_feedback = 'Very Bad'  THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS very_bad_pct,
    ROUND(SUM(CASE WHEN customer_feedback = 'Bad'       THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS bad_pct,
    ROUND(SUM(CASE WHEN customer_feedback = 'Okay'      THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS okay_pct,
    ROUND(SUM(CASE WHEN customer_feedback = 'Good'      THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS good_pct,
    ROUND(SUM(CASE WHEN customer_feedback = 'Very Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS very_good_pct
FROM
    order_t
WHERE
    customer_feedback IS NOT NULL
GROUP BY
    quarter_number
ORDER BY
    quarter_number;


/* Q6 — Trend of number of orders by quarter */
SELECT
    quarter_number,
    COUNT(order_id) AS total_orders
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    quarter_number;


/* Q7 — Net revenue and quarter-over-quarter % change
   NOTE: reconstructed. The original submission accidentally pasted the Q6
   orders query here. This version uses my own net-revenue formula (see Q8)
   with a LAG() window function for the QoQ change. Please verify before use. */
SELECT
    quarter_number,
    ROUND(SUM(quantity * vehicle_price * (1 - discount / 100.0)), 2) AS net_revenue,
    ROUND(
        ( SUM(quantity * vehicle_price * (1 - discount / 100.0))
          - LAG(SUM(quantity * vehicle_price * (1 - discount / 100.0))) OVER (ORDER BY quarter_number) )
        * 100.0
        / LAG(SUM(quantity * vehicle_price * (1 - discount / 100.0))) OVER (ORDER BY quarter_number)
    , 2) AS qoq_pct_change
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    quarter_number;


/* Q8 — Trend of net revenue and orders by quarter */
SELECT
    quarter_number,
    ROUND(SUM(quantity * vehicle_price * (1 - discount / 100.0)), 2) AS net_revenue,
    COUNT(order_id) AS total_orders
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    quarter_number;


/* Q9 — Average discount offered by credit card type */
SELECT
    credit_card_type,
    ROUND(AVG(discount), 2) AS avg_discount
FROM
    customer_t
JOIN
    order_t USING(customer_id)
GROUP BY
    credit_card_type;


/* Q10 — Average shipping time (days) by quarter */
SELECT
    quarter_number,
    ROUND(AVG(julianday(ship_date) - julianday(order_date)), 2) AS avg_shipping_days
FROM
    order_t
WHERE
    order_date IS NOT NULL AND ship_date IS NOT NULL
GROUP BY
    quarter_number;
