CREATE DATABASE Venda;
USE Venda;

CREATE TABLE Cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
endereco varchar(45),
fkClienteIndicado int,
constraint fkClienteIndicado foreign key Cliente(fkClienteIndicado) references Cliente(idCliente)
);



INSERT INTO Cliente VALUES 
(null, "gustavo", "gusta@Hotmail.com", "Rua lorival", null),
(null, "natalia", "nat@gmail.com", "Rua colinas", 1),
(null, "larissa", "larissa@Sptech.school.com", "Rua vieras", null),
(null, "luisa", "cremosa@Sptech.school.com", "Rua paulista", 3);

CREATE TABLE Vendas (
idVendas int primary key auto_increment,
valor decimal(10,2),
dtVenda datetime,
fkCliente int,
constraint fkCliente foreign key Vendas(fkCliente) references Cliente(idCliente)
);

INSERT INTO Vendas VALUES 
(null, 550, "2021-07-12 15:35:00", 1),
(null, 700, "2023-12-12 17:30:00", 4),
(null, 999, "2023-07-12 12:45:00", 3),
(null, 500, "2023-07-12 14:56:00", 2);

CREATE TABLE Produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(250),
valor decimal(10,2)
);


INSERT INTO Produto VALUES 
(null, "Iphone", "iphone 11 64gb", 6.000),
(null, "Notbook", "alienware m15 rtx3070ti", 15.000),
(null, "fone", "jbl sem fio", 700),
(null, "capinha", " capa pc dell", 700.89);


CREATE TABLE Notas (
idNotas int primary key auto_increment,
qtdProduto decimal(10,2),
valorDesconto decimal(10,2),
fkVendas int,
fkCliente int,
fkProduto int,
constraint fkVendas foreign key Notas(fkVendas) references Vendas(idVendas),
constraint fkClientes foreign key Notas(fkCliente) references Cliente(idCliente),
constraint fkProduto foreign key Notas(fkProduto) references Produto(idProduto)
);

Insert into Notas VALUES 
(null, 2, 100, 3, 3, 1),
(null, 1, 50, 1, 1, 3);


SELECT * FROM Cliente;
SELECT * FROM Vendas;
SELECT * FROM Produto;
SELECT * FROM Notas;

-- g) 
SELECT * FROM Vendas join Cliente on fkCliente = idCliente;

-- h) 
INSERT INTO Vendas VALUES 
(null, 550, "2022-12-11 23:45:56", 3);

SELECT nome, idCliente,idVendas,valor,dtVenda FROM Vendas join Cliente on fkCliente = idCliente 
where idCliente = 3
;

-- i) 
SELECT n.nome as nomeCliente, n.endereco, e.nome as nomeClienteIndicado, e.endereco
FROM Cliente as n
JOIN Cliente as e
ON n.fkClienteIndicado = e.idCliente;

-- j) 
SELECT n.nome as nomeCliente, n.endereco, e.nome as nomeClienteIndicado, e.endereco
FROM Cliente as n
JOIN Cliente as e
ON n.fkClienteIndicado = e.idCliente
where n.nome = "natalia";

-- l) 
SELECT * FROM Notas
join Cliente on fkCliente = idCliente
join Vendas on  fkVendas = idVendas
join Produto on fkProduto = idProduto;

-- m)
SELECT dtVenda, Produto.nome, qtdProduto  FROM Notas 
join Vendas on  fkVendas = idVendas
join Produto on fkProduto = idProduto;

-- n) 
SELECT Produto.nome, Produto.valor,  sum(Notas.qtdProduto)  FROM Notas 
join Vendas on  fkVendas = idVendas
join Produto on fkProduto = idProduto;

-- p)
SELECT min(valor) FROM Produto;
-- Valor máximo
SELECT max(valor) FROM Produto;
