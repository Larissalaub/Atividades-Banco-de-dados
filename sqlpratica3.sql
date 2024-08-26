create database Sprint2;
use Sprint2;

create table atleta (
idAtleta int auto_increment primary key,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int

);
insert into atleta (nome, modalidade, qtdMedalha) values 
   ('joao', 'futebol', 2),
   ('lis', 'balet', 7),
   ('vivian', 'surf', 5),
   ('eliza', 'balet', 8),
   ('jacob', 'dança', 7);
   
   select*from atleta;
   
   create table Pais (
  idPais int auto_increment primary key,
  nome varchar (30),
  capital varchar (40)
);

INSERT INTO Pais (nome, capital) VALUES
('italia', 'roma'),
('brasil', 'brasilia'),
('argentina', 'buenos Aires'),
('canada', 'toronto'),
('mexico', 'cidade do mexico');


select*from Pais;
 
 alter table atleta add column fkPais int;
describe atleta;

alter table atleta add constraint fkPais
    foreign key (fkPais)
        references pais(idPais);
        
UPDATE Atleta
SET fkPais = 1
where idAtleta = 1;

UPDATE Atleta
SET fkPais = 2
where idAtleta = 2;

UPDATE Atleta
SET fkPais = 2
where idAtleta = 5;

UPDATE Atleta
SET fkPais = 3
where idAtleta = 4;

UPDATE Atleta
SET fkPais = 4
where idAtleta = 3;

select * from atleta join pais 
on idPais = fkPais;

select a.nome as nomeAtleta,
p.nome as nomesPais 
from atleta as a join paiss as p
on idPais = fkpais;

SELECT * from atleta join pais 
on idPais = fkpais 
where capital ='brasilia' ;









 
 
   
   

