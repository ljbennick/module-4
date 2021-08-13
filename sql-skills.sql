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


-- EXTRA CREDIT!!

-- artist
-- 1.
SELECT * FROM artist
ORDER BY artist.name DESC
LIMIT 10;

-- 2.
SELECT * FROM artist
WHERE name LIKE 'Black%';

-- 3.
SELECT * FROM artist
WHERE name LIKE '%Black%';

-- employee
-- 1.
SELECT MIN(employee.birth_date) FROM employee;

-- 2.
SELECT MAX(employee.birth_date) FROM employee;


-- invoice
-- 1.
SELECT COUNT(quantity) FROM invoice_line
WHERE invoice_id IN(
  SELECT invoice_id FROM invoice 
  WHERE invoice.billing_state = 'CA' OR invoice.billing_state = 'TX' OR invoice.billing_state = 'AZ'
  );

-- 2.
SELECT AVG(total) FROM invoice;

-- MORE JOIN
-- 1.
SELECT playlist_track.track_id FROM playlist_track
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id
  WHERE name = 'Music';

-- 2.
SELECT track.name FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
WHERE playlist_id = 5;

-- 3.
SELECT track.name AS "Track", playlist.name AS "Playlist" FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id;

-- 4.
SELECT track.name, album.title FROM track
JOIN album ON track.album_id = album.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Alternative & Punk';




-- Data Modeling
CREATE TABLE species (
  species_id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE animal (
  animal_id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  age INT,
  species INT NOT NULL REFERENCES species(species_id),
  is_adoptable BOOLEAN
  );

  CREATE TABLE adopter(
  adopter_id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  age INT NOT NULL,
  location VARCHAR(50),
  occupation VARCHAR(40),
  animal_id INT NOT NULL REFERENCES animal(animal_id)
  );

CREATE TABLE animal_invoice (
  invoice_id SERIAL PRIMARY KEY,
  price INT NOT NULL,
  timestamp TIMESTAMP,
  animal_id INT NOT NULL REFERENCES animal(animal_id),
  adopter_id INT NOT NULL REFERENCES adopter(adopter_id)
  );
  