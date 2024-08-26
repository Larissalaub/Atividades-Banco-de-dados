create database Sprint2;
use Sprint2;

create table Musica (
idMusica int auto_increment primary key,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

insert into Musica values
    (1, 'Shape of You', 'Ed Sheeran', 'Pop'),
    (2, 'Blinding Lights', 'The Weeknd', 'Pop'),
    (3, 'Uptown Funk', 'Mark Ronson ft. Bruno Mars', 'Funk');
    
    
    
    create table Album (
    idAlbum int auto_increment primary key,
    nome varchar (40),
    tipo varchar (40),
    dtLancamento date
    );
    
    insert into Album (nome, tipo, dtLancamento) values 
    ('predio', 'digital','2023-01-15'),
    ('deluxo', 'fisico', '2023-02-20');
    
   alter table Musica 
   add column idAlbum int,
   add constraint fkMusica
    foreign key(idAlbum)
    references Album(idAlbum);
    
    update Musica 
    set idAlbum = 1
    where idAlbum = 2;
    
    update Musica 
    set idAlbum = 2
    where idMusica = 2;
    
    update Musica 
    set idAlbum = 2
    where idMusica = 3;
    
    
  SELECT * FROM Musica
  
INNER JOIN Album ON Musica.idAlbum = Album.idAlbum;

SELECT Musica.titulo AS Titulo_Musica, Album.nome AS Nome_Album
FROM Musica
INNER JOIN Album ON Musica.idAlbum = Album.idAlbum;

SELECT Musica.titulo AS Titulo_Musica, Album.nome AS Nome_Album, Album.tipo AS Tipo_Album
FROM Musica
INNER JOIN Album ON Musica.idAlbum = Album.idAlbum
WHERE Album.tipo = 'fisico';







    
    
    
    
    
    
    
    
   