CREATE DATABASE treinador;



USE treinador;
CREATE TABLE treinadores (
idTreinador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
celular CHAR(12),
emailPessoal VARCHAR(45),
emailProfissional VARCHAR(45),
fkTreinador INT,
CONSTRAINT fkTreinador1 FOREIGN KEY (fkTreinador) REFERENCES treinadores(idTreinador)) AUTO_INCREMENT = 10;

CREATE TABLE nadador (
idNadador INT AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
estado VARCHAR(45),
dtNasc DATE,
fkTreinador INT,
CONSTRAINT fkTreinador2 FOREIGN KEY (fkTreinador) REFERENCES treinadores(idTreinador),
CONSTRAINT pkNadadorTreinador PRIMARY KEY (idNadador, fkTreinador)) AUTO_INCREMENT = 100;

INSERT INTO treinadores VALUES
(null, 'larissa', 'silva', '1191020-3040', 'larissa@pessoal.com', 'larissa@profissional.com', null),
(null, 'Gabriel', 'Silva', '1195060-7080', 'gabriel@pessoal.com', 'gabriel@profissional.com', 10),
(null, 'Giovani', 'Solto', '1191122-3344', 'giovani@pessoal.com', 'giovani@profissional.com', 11);
   
INSERT INTO nadador VALUES
(null, 'Matheus', 'Nunes', 'São Paulo', '2003-02-12', 10),
(null, 'carlos', 'Nunes', 'São Paulo', '2000-02-02', 10),
(null, 'amanda', 'Furtado', 'Santa Catarina', '1999-10-09', 11),
(null, 'altos', 'Veiga', 'Goias', '1995-05-27', 12);
   
SELECT * FROM treinadores;
SELECT * FROM nadador;

SELECT * FROM treinadores JOIN nadador
ON idTreinador = nadador.fkTreinador;
   
SELECT * FROM treinadores JOIN nadador
ON idTreinador = nadador.fkTreinador
WHERE treinadores.nome = 'larissa';
       
SELECT * FROM treinadores AS Treinador JOIN treinadores AS Orientador
ON Orientador.idTreinador = Treinador.fkTreinador;
   
SELECT * FROM treinadores AS Treinador JOIN treinadores AS Orientador
ON Orientador.idTreinador = Treinador.fkTreinador
WHERE Orientador.nome = 'Gabriel';
       
SELECT *
FROM treinadores AS Treinador JOIN nadador ON idTreinador = nadador.fkTreinador
LEFT JOIN treinadores AS Orientador ON Orientador.idTreinador = Treinador.fkTreinador
WHERE Treinador.nome = 'Giovani';


