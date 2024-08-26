CREATE DATABASE gastos;
USE gastos;
CREATE TABLE pessoa (
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNasc DATE,
profissao VARCHAR(45)
);

CREATE TABLE gastos (
idGasto INT AUTO_INCREMENT,
dataLanc DATE,
valor DECIMAL(10,2),
descricao VARCHAR(45),
fkPessoa INT,
CONSTRAINT fkPessoaGasto FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa),
CONSTRAINT pkGastoPessoa PRIMARY KEY (idGasto, fkPessoa));

INSERT INTO pessoa VALUES
(null, 'iuri', '2003-02-12', 'estudante'),
(null, 'Maarilene', '1972-12-12', 'auxiliar adm'),
(null, 'margo', '1973-04-11', 'professora');
   
INSERT INTO gastos VALUES
(null, '2022-10-01', 5000.00, 'iphone 13', 1),
(null, '2022-12-20', 1200.00, 'tenis nike', 2),
(null, '2023-01-20', 700.00, 'vestido', 3);
   
SELECT * FROM pessoa;
SELECT * FROM gastos;

SELECT * FROM pessoa WHERE nome LIKE 'M%';
SELECT * FROM gastos WHERE valor > 1000.00;

SELECT * FROM pessoa JOIN gastos
ON idPessoa = fkPessoa;

SELECT * FROM pessoa JOIN gastos
ON idPessoa = fkPessoa
WHERE pessoa.idPessoa = 1;
       
UPDATE pessoa SET profissao = 'estágiario' WHERE idPessoa = 1;
UPDATE pessoa SET profissao = 'diretora' WHERE idPessoa = 3;
UPDATE gastos SET fkPessoa = 1 WHERE idGasto = 2;

DELETE FROM gastos WHERE idGasto IN(1,3);