# 4. Cree una nueva tabla sponsors en la base de datos que almacene
# como atributos, su identificador propio, su nombre, tipo, el
# identificador de la carrera que patrocina (un patrocinador solo puede
# patrocinar una carrera) y el dinero que aporta anualmente. Existen
# dos tipos de patrocinadores: oficiales, deben aportan una cantidad
# igual o superior a 5M de euros, y cooficiales, para cantidades inferiores.
# Diseñe un trigger que clasifique al sponsor y rellene el atributo type de
# su correspondiente tabla.

CREATE TABLE sponsors (
    sponsorId INT NOT NULL,
    name varchar(250) DEFAULT NULL,
    type varchar(250) DEFAULT NULL,
    raceId INT,
    contribution INT DEFAULT 0,
    CONSTRAINT FOREIGN KEY (raceId) REFERENCES races (raceId),
    PRIMARY KEY (sponsorId)
);

DELIMITER $$
CREATE TRIGGER type_setter
    BEFORE INSERT ON sponsors
    FOR EACH ROW
BEGIN
    IF NEW.contribution >= 5000000 THEN
        SET NEW.type = 'oficial';
    else
        SET NEW.type = 'cooficial';
    END IF;
END $$
DELIMITER ;

INSERT INTO sponsors (sponsorId, name, raceId, contribution)
VALUES
    (1, 'Red Bull Racing', 1, 7000000),
    (2, 'Shell', 36, 3000000),
    (3, 'Puma', 108, 5500000),
    (4, 'Monster Energy', 94, 2000000),
    (5, 'Rolex', 158, 10000000),
    (6, 'Tag Heuer', 990, 4500000),
    (7, 'Adidas', 7, 800000);


SELECT *
FROM sponsors;

DROP TABLE sponsors;