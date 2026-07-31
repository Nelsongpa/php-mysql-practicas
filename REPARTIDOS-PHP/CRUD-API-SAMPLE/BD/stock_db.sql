CREATE DATABASE IF NOT EXISTS stock CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE stock;

CREATE TABLE IF NOT EXISTS producto (
    id       INT          NOT NULL AUTO_INCREMENT,
    nombre   VARCHAR(100) NOT NULL,
    cantidad INT          NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO producto (nombre, cantidad) VALUES
    ('notebooks', 15),
    ('heladera',  100);
