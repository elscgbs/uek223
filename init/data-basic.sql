-- Users (explizite IDs für stabile Foreign Keys)
INSERT INTO users (id, username, role) VALUES
(1, 'alice', 'CUSTOMER'),
(2, 'bob',   'EMPLOYEE'),
(3, 'carol', 'MANAGER');

INSERT INTO movies (id, title, available_copies) VALUES
(1, 'The Matrix', 3),
(2, 'Inception',  2);

-- Rentals
-- 1) Offener Verleih (alice leiht "The Matrix", faellig in 7 Tagen)
INSERT INTO rentals (id, user_id, movie_id, due_date, return_date)
VALUES (1, 1, 1, DATE_ADD(CURRENT_DATE(), INTERVAL 7 DAY), NULL);

-- 2) Bereits zurückgegeben (alice -> "Inception")
INSERT INTO rentals (id, user_id, movie_id, due_date, return_date)
VALUES (2, 1, 2, DATE_ADD(CURRENT_DATE(), INTERVAL -14 DAY), CURRENT_DATE());
