/* Exercise 1: Full Table Backup */
/* 1.1 */
SELECT COUNT(*) FROM customer;

/* 1.2 */ 
SELECT * INTO customer_full_backup FROM customer; 
or
CREATE TABLE customer_full_backup AS SELECT * FROM customer;

/* 1.3 */
SELECT COUNT(*) FROM customer_full_backup;

/* 1.4 */
CHECKSUM TABLE customer, customer_full_backup;

/* Exercise 2: Partial Table Backup */
/* 2.1a */
SELECT COUNT(*) FROM rental;

/* 2.1b */
SELECT COUNT(*) FROM rental
WHERE return_date IS NOT NULL;

/* 2.1c */
SELECT COUNT(*) FROM rental
WHERE return_date IS NULL;

/* 2.2 */
CREATE TABLE returned_rental AS SELECT * FROM rental
WHERE return_date IS NOT NULL;

/* Exercise 3: Drop Tables */
DROP TABLE IF EXISTS customer_full_backup;
DROP TABLE IF EXISTS returned_rental

/* Exercise 4: Insert statement WITHOUT a column list */
INSERT INTO city
VALUES (DEFAULT, 'Alliance', 103, DEFAULT);

INSERT INTO address
VALUES (DEFAULT, '520 James St', NULL, 'Nebraska', 601, 69301, 3086299153, DEFAULT);

INSERT INTO customer
VALUES (DEFAULT, 1, 'Jacob', 'Mundt', 'JACOB.R.MUNDT@proton.me', 606, 1, NOW(), DEFAULT)

/* Exercise 5: Insert statement using a column list */
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (1, 'Evil', 'Mundt', 'EVIL.JACOB@gmail.com', 606, 1, NOW())

/* Exercise 6: Update multiple columns for a single record */
UPDATE customer
SET store_id = 2, email='JACOB.R.MUNDT@gmail.com'
WHERE customer_id = 600;

UPDATE customer
SET store_id = 2, email='EVIL.JACOB@proton.me'
WHERE customer_id = 601;

/* Exercise 7: Update multiple records (rows) */
UPDATE customer
SET address_id = 605
WHERE address_id = 606;

/* Exercise 8: Write delete statements */
/* 8.1a */
DELETE FROM city
WHERE city_id = 601;
 
/* 8.1b */
DELETE FROM address
WHERE address_id = 606;

/* 8.1c */ 
DELETE FROM customer
WHERE customer_id = 600;

DELETE FROM customer
WHERE customer_id = 601;

/* 8.2 */
SELECT * FROM customer
where customer_id = 600;

SELECT * FROM customer
where customer_id 601;

SELECT * FROM address
WHERE address_id = 606;

SELECT * FROM city
WHERE city_id = 601;

/* 8.3 */
/* as like in the example, the order listed in the assignment fails. This is because of a dependancy chain, where you can't remove something
that something else relies on. The chain goes from customer > adress > city. In order to resolve this, you have to delete the requested
records in reverse order. */