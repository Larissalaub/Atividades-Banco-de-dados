CREATE DATABASE PraticaFuncionario;
USE PraticaFuncionario;

CREATE TABLE setor (
idSetor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
andar INT
);

CREATE TABLE funcionario (
idFunc INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
telFixo CHAR(9),
telCel CHAR(12),
salario DECIMAL(7,2),
fkSetor INT,
CONSTRAINT fkSetor FOREIGN KEY (fkSetor) REFERENCES setor(idSetor)
) AUTO_INCREMENT = 100;

CREATE TABLE acompanhante (
idAcomp INT AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
relacao VARCHAR(45),
dtNasc DATE,
fkFunc INT,
CONSTRAINT fkFuncAcomp FOREIGN KEY (fkFunc) REFERENCES funcionario(idFunc),
CONSTRAINT pkAcompFunc PRIMARY KEY (idAcomp, fkFunc)) AUTO_INCREMENT = 200;

INSERT INTO setor VALUES
(null, 'marketing', 10),
(null, 'qualidade', 6),
(null, 'recursos humanos', 2);
   
INSERT INTO funcionario VALUES
(null, 'manoel', 'Santos', '1020-3040', '1191020-3040', 4300.00, 1),
(null, 'larissa', 'laube', '5060-7080', '1195060-7080', 3400.00, 2),
(null, 'rosinha', 'cardi', '1122-3344', '1191122-3344', 5600, 3);
   
INSERT INTO acompanhante VALUES
(null, 'algoz', 'Santos', 'mãe', '1983-04-28', 100),
(null, 'Rodrigo', 'neno', 'primo', '2004-06-29', 101),
(null, 'Ingrid', 'alek', 'filha', '1991-04-04', 102);
   
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

SELECT * FROM setor JOIN funcionario
ON idsetor = fkSetor;
   
-- DUVIDA NESSE SELECT: Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
SELECT * FROM setor JOIN funcionario
ON idSetor = fkSetor WHERE setor.nome = 'qualidade';

SELECT * FROM funcionario JOIN acompanhante
ON idFunc = fkFunc;
   
SELECT * FROM funcionario JOIN acompanhante
ON idFunc = fkFunc WHERE funcionario.nome = 'larissa';
       
SELECT *
FROM setor JOIN funcionario ON idSetor = fkSetor
JOIN acompanhante ON idFunc = fkFunc;
   