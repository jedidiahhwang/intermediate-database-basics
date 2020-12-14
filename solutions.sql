-- TABLE 1: PRACTICE JOINS

-- SELECT * FROM invoice i
-- JOIN invoice_line il ON il.invoice_id = i.invoice_id
-- WHERE il.unit_price > 0.99;

-- SELECT i.invoice_date, c.first_name, c.last_name, i.total
-- FROM invoice i
-- JOIN customer c ON i.customer_id = c.customer_id;

-- SELECT c.first_name, c.last_name, e.first_name, e.last_name
-- FROM customer c
-- JOIN employee e ON c.support_rep_id = e.employee_id;

-- SELECT alb.title, art.name
-- FROM album alb
-- JOIN artist art ON alb.artist_id = art.artist_id

-- SELECT pt.track_id
-- FROM playlist_track pt
-- JOIN playlist p ON p.playlist_id = pt.playlist_id
-- WHERE p.name = 'Music';

-- SELECT t.name
-- FROM track t
-- JOIN playlist_track pt ON pt.track_id = t.track_id
-- WHERE pt.playlist_id = 5;

-- SELECT t.name, p.name
-- FROM track t
-- JOIN playlist_track pt ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;

-- SELECT t.name, alb.title
-- FROM track t
-- JOIN album alb ON t.album_id = alb.album_id
-- JOIN genre g ON t.genre_id = g.genre_id
-- WHERE g.name = 'Alternative & Punk';




-- TABLE 2: PRACTICE NESTED QUERIES

-- SELECT * FROM invoice
-- WHERE invoice_id IN 
-- 	(SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

-- SELECT * FROM playlist_track
-- WHERE playlist_id IN
-- 	(SELECT playlist_id FROM playlist WHERE name = 'Music');

-- SELECT * FROM track
-- WHERE track_id IN
-- 	(SELECT track_id FROM playlist_track WHERE playlist_id = 5);

-- SELECT * FROM track
-- WHERE genre_id IN
-- 	(SELECT genre_id FROM genre WHERE name = 'Comedy');

-- SELECT * FROM track
-- WHERE album_id IN
-- 	(SELECT album_id FROM album WHERE title = 'Fireball');

-- SELECT * FROM track
-- WHERE album_id IN
-- 	(SELECT album_id FROM album WHERE artist_id IN 
--    (SELECT artist_id FROM artist WHERE name = 'Queen')
--   );




-- TABLE 3: PRACTICE UPDATING ROWS

-- UPDATE customer
-- SET fax = null
-- WHERE fax IS NOT null;

-- UPDATE customer
-- SET company = 'Self'
-- WHERE company IS null;
	
-- UPDATE customer
-- SET last_name= 'Thompson'
-- WHERE first_name = 'Julia' AND last_name = 'Barnett';

-- UPDATE customer 
-- SET support_rep_id = 4
-- WHERE email = 'luisrojas@yahoo.cl';

-- UPDATE track
-- SET composer = 'To darkness around us'
-- WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
-- AND composer IS null;




-- TABLE 4: GROUP BY

-- SELECT COUNT(*), g.name FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name;

-- SELECT COUNT(*), g.name FROM track t
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Pop' OR g.name = 'Rock'
-- GROUP BY g.name;

-- SELECT COUNT(*), art.name FROM album alb
-- JOIN artist art ON art.artist_id = alb.artist_id
-- GROUP BY art.name;




-- TABLE 5: USE DISTINCT

-- SELECT DISTINCT composer
-- FROM track;

-- SELECT DISTINCT billing_postal_code
-- FROM invoice;

-- SELECT DISTINCT company
-- FROM customer;




-- TABLE 6: DELETE ROWS

-- CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

-- SELECT * FROM practice_delete;

-- DELETE FROM practice_delete
-- WHERE type = 'bronze';

-- DELETE FROM practice_delete
-- WHERE type = 'silver';

-- DELETE FROM practice_delete
-- WHERE value = 150;




-- TABLE 7: eCOMMERCE SIMULATION

-- CREATE TABLE users 
-- 	(id SERIAL PRIMARY KEY,
--    name TEXT,
--    email TEXT
--   );
  
-- CREATE TABLE products 
-- 	(id SERIAL PRIMARY KEY,
--    name TEXT,
--    price INTEGER
--   );
  
-- CREATE TABLE orders 
-- 	(id SERIAL PRIMARY KEY,
--    ref INTEGER REFERENCES products(id)
--   );

-- INSERT INTO users 
-- 	(name, email)
-- VALUES
-- 	('Michael', 'mscott@dundermifflin.com'),
--   ('Jim', 'jhalpert@dundermifflin.com'),
--   ('Pam', 'pbeesly@dundermifflin.com');
  
-- INSERT INTO products 
-- 	(name, price)
-- VALUES
-- 	('65 pound cardstock', 120),
--   ('45 pound cardstock', 100),
--   ('30 pound cardstock', 80);

-- ALTER TABLE orders
-- ADD COLUMN quantity INTEGER;

-- INSERT INTO orders
-- 	(quantity)
-- VALUES
-- 	(5),
--   (10),
--   (1);

-- SELECT * FROM orders;

-- SELECT * FROM orders
-- JOIN products ON products.id = orders.id;

-- SELECT SUM(*) FROM orders
-- JOIN products ON products.id = orders.id;

-- ALTER TABLE orders
-- ADD COLUMN refUser INTEGER REFERENCES users(id);

-- SELECT * FROM orders
-- JOIN users ON users.id = orders.id;

-- SELECT SUM(*) FROM orders
-- JOIN users ON users.id = orders.id;