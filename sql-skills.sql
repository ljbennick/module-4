-- artist
-- 1.
INSERT INTO artist (name)
VALUES('The Red Hot Chili Peppers'), ('Of Montreal'), ('Isaiah Rashad');

-- 2.
SELECT * FROM artist 
ORDER BY artist ASC
LIMIT 5;

-- employee
-- 1.
SELECT employee.first_name AS "First", employee.last_name As "Last"
FROM employee
WHERE city = 'Calgary';

-- 2.
SELECT * FROM employee
WHERE reports_to = 2;

-- 3.
SELECT COUNT(employee.city) FROM employee
WHERE city = 'Lethbridge';

-- invoice
-- 1.
SELECT COUNT(i.quantity) FROM invoice
JOIN invoice_line i ON invoice.invoice_id = i.invoice_id
WHERE billing_country = 'USA';

-- 2.
SELECT MAX(invoice.total) FROM invoice;

-- 3.
SELECT MIN(invoice.total) FROM invoice;

-- 4.
SELECT * FROM invoice
WHERE total >5;

-- 5.
SELECT COUNT(invoice.total) FROM invoice
WHERE total < 5;

-- 6.
SELECT SUM(invoice.total) FROM invoice;

-- JOIN
-- 1.
SELECT * FROM invoice
JOIN invoice_line i ON invoice.invoice_id = i.invoice_id
WHERE unit_price = .99;

-- 2.
SELECT invoice_date, customer.first_name AS "First", customer.last_name AS "Last", total
FROM invoice 
JOIN customer ON invoice.customer_id = customer.customer_id;

-- 3.
SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name 
FROM customer
JOIN employee ON customer.support_rep_id = employee.employee_id;

-- 4.
SELECT album.title AS "Album Title", artist.name AS "Artist Name"
FROM album
JOIN artist ON album.artist_id = artist.artist_id;

