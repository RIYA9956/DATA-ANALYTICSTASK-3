-- SELECT CLAUSE
select * from customer

--WHERE CLAUSE
SELECT * FROM customer
WHERE address_id > 200

--ORDER BY CLAUSE
SELECT * FROM customer
ORDER BY customer_id ASC

--GROUPBY CLAUSE
SELECT customer_id,first_name,store_id,address_id FROM customer
GROUP BY store_id,address_id, customer_id
ORDER BY first_name ASC

--SELECT CLAUSE, WHERE CLAUSE, ORDER BY CLAUSE, GROUP BY CLAUSE
SELECT customer_id,first_name,store_id,address_id FROM customer
WHERE address_id > 200
GROUP BY store_id,address_id, customer_id
ORDER BY first_name ASc

--joins
SELECT *
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id;


SELECT *
FROM customer
LEFT JOIN rental
ON customer.customer_id = rental.customer_id;

SELECT *
FROM customer
RIGHT JOIN payment
ON customer.customer_id = payment.customer_id;


--SUBQUERY
SELECT first_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
);

--CREATE VIEWS FOR ANALYSIS
CREATE VIEW customer_payment_summary AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    SUM(p.amount) AS total_paid
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email;


SELECT * FROM customer_payment_summary ORDER BY total_paid DESC;





