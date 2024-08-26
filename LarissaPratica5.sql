create database Sprint1;
use Sprint1;

create table Professor (
idProfessor int auto_increment primary key,
nome varchar (50) not null,
sobrenome varchar (30),
especialidade1 varchar (40) not null,
especialidade2 varchar (40)
);

insert into Professor values
 (default, 'viviam', '', 'Banco de dados', 'inglês'),
 (default, 'Joao', 'Paula', 'algoritmo',  'banco de dados' ),
 (default,'rafael', 'petry', 'TI', 'PI'),
 (default,'carlos', 'frizza', 'PI', 'algoritmo'),
 (default,'murilo', 'mota', 'banco de dados', 'arquitetura'),
 (default,'marise', 'miranda', 'arquitetura comp', 'arduio' );
 
create table Disciplina (
idDisc int auto_increment primary key,
nomeDisc varchar (45),
fkProfessor int,
constraint fkProf foreign key (fkProfessor)
	references Professor(idProfessor)
);

insert into Disciplina value 
(default, 'inglês', 1),
(default, 'banco de dados', 2),
(default, 'algoritmo', 3);

select * from Professor join Disciplina
on fkProfessor = idProfessor;

select nome, nomeDisc from Professor join Disciplina on fkProfessor = idProfessor;

select * from Professor join Disciplina
on fkProfessor = idProfessor 
where sobrenome = 'Petry';

select especialidade1, nomeDisc
from Professor join Disciplina
on idProfessor = fkProfessor
where Professor.nome = 'viviam'
order by especialidade1;



-- Ex 2
create database Sprint2;
use Sprint2;

create table Curso (
idCurso int auto_increment primary key,
nome varchar(50),
sigla char (3),
coordenador varchar (45),
fkFaculdade int,
constraint fkfacu foreign key (fkFaculdade)
	references Faculdade(idFaculdade)
);

INSERT INTO curso (nome, sigla, coordenador)
VALUES
    ('analise e desenvolvimento de sistema', 'ads', 'Brandão'),
    ('sistema da informação', 'sis', 'Marise'),
    ('ciencia da computação', 'cso', 'marcos');


create table Faculdade(
idFaculdade int primary key auto_increment,
nomeFaculdade varchar(100),
noomeDoDono varchar (45),
responsavel varchar(50)
);

insert into Faculdade values 
(default, 'FMU', 'angelica', 'aurelio'),
(default, 'unasp', 'vitor', 'murilo'),
(default, 'sptech', 'vera', 'vera');

select * from Faculdade;
select * from Curso;

select * from Faculdade join curso
on fkFaculdade = idFaculdade;

select * from Faculdade join curso
on fkFaculdade = idFaculdade
where responsavel  = 'vera';

ALTER TABLE Faculdade
ADD idadeRepresentante INT CHECK (idadeRepresentante >= 18);

select * from faculdade;

select * from curso;











