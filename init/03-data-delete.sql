-- docker exec -it video_rental_db sh -lc "mysql -uroot -proot < /docker-entrypoint-initdb.d/03-data-delete.sql"

USE video_rental;

START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM rentals;
DELETE FROM movies;
DELETE FROM users;

ALTER TABLE rentals AUTO_INCREMENT = 1;
ALTER TABLE movies  AUTO_INCREMENT = 1;
ALTER TABLE users   AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
