CREATE DATABASE Pet;
USE Pet;
CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
telFixo CHAR(9),
telCelular CHAR(12),
rua VARCHAR(45),
bairro VARCHAR(45),
numCasa VARCHAR(5),
complemento VARCHAR(10)

);

INSERT INTO cliente VALUES
(null, 'larissa', 'laube', '1020-3040', '1191020-3040', 'Avenida São Bernardo', 'Inamar', '243', 'Casa 1'),
(null, 'carlos', 'silva', '5060-7080', '1195060-7080', 'Avenida São Bernardo', 'Inamar', '243', 'Casa 3'),
 (null, 'kaka', 'amaral', '1122-3344', '1191122-3344', 'Rua dos Sabias', 'Parque dos passaros', '481', 'Casa');

CREATE TABLE pet (
idPet INT AUTO_INCREMENT,
tipo VARCHAR(45),
nome VARCHAR(45),
raca VARCHAR(45),
dtNasc DATE,
fkCliente INT,
CONSTRAINT fkClientePet FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente),
CONSTRAINT pkPetCliente PRIMARY KEY (idPet, fkCliente))
AUTO_INCREMENT = 100;

INSERT INTO pet VALUES
(null, 'Cachorro', 'caramelo', 'Salsicha', '2008-12-12', 1),
(null, 'Gato', 'saldem', 'Persa', '2015-01-01', 2),
(null, 'Cachorro', 'Teco', 'Pitbull', '2020-05-05', 3),
(null, 'Cachorro', 'adenor', 'Pitbull', '2022-03-03', 3);
   
SELECT * FROM cliente;
SELECT * FROM pet;
                         
ALTER TABLE cliente MODIFY COLUMN nome VARCHAR(60);

SELECT * FROM pet WHERE tipo = 'Cachorro';

SELECT nome, dtNasc FROM pet;

SELECT * FROM pet ORDER BY nome;

SELECT * FROM cliente ORDER BY bairro DESC;

SELECT * FROM pet WHERE nome LIKE 'S%';

SELECT * FROM cliente WHERE sobrenome = 'silva';

UPDATE cliente SET telFixo = '4433-2211' WHERE idCliente = 1;

SELECT * FROM cliente;

SELECT * FROM pet JOIN cliente
ON fkCliente = idCliente;
   
SELECT * FROM pet JOIN cliente
ON fkCliente = idCliente
WHERE cliente.idCliente = 3;
       
DELETE FROM pet WHERE idPet = 103;

SELECT * FROM pet;

DROP TABLE cliente, pet;
    