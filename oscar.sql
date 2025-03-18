CREATE DATABASE IF NOT EXISTs oscar;

USE oscar;

CREATE TABLE MelhorFilme(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
votos INT DEFAULT 0
);


CREATE TABLE Vencedores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(255) NOT NULL UNIQUE,
    vencedor_nome VARCHAR(255) NOT NULL,
    votos INT
);

DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorFilme AFTER UPDATE ON MelhorFilme
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;
SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFilme
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorFilme AFTER INSERT ON MelhorFilme
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFilme
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;



INSERT INTO MelhorFilme (nome, votos) VALUES
('Anora',5),
('O Brutalista',100),
('Um Completo Desconhecido',23),
('Conclave',98),
('Duna: Parte Dois',56),
('Emilia Pérez',2),
('Ainda Estou Aqui',1964),
('Nickel Boys',4),
('A Substância',400),
('Wicked',290),
('Sing Sing',70),
('O Aprendiz',22),
('A Verdadeira Dor',6),
('O Atentado de 5 de Setembro',1),
('A Garota da Agulha',15),
('Flow',11),
('A Semente do Fruto Sagrado',3),
('Robô Selvagem', 7),
('Divertida-Mente 2',15),
('Wallace & Gromit: Avengança',17),
('Memórias de um Caracol',6),
('The Only Girl in the Orchestra',10),
('Death by Numbers',97),
('Incident',904),
('I Am Ready, Warden',3),
('Instruments of a Beating Heart',9),
('No Other Land',10),
('Porcelain Wars',97),
('Black Box Diaries',24 ),
('Trilha Sonora para um Golpe de Estado',3),
('Sugarcane',9),
('Elton John: Never Too Late',78),
('Gladiador 2',63),
('Nosferatu',39),
('A Different Man',3),
('Maria',10), 
('Planeta dos Macacos: O Reinado',17),
('Better Man - A História de Robbie Williams',404),
('Alien: Romulus',3);


CREATE TABLE MelhorDiretor(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
votos INT DEFAULT 0,
FOREIGN KEY(filme_id) REFERENCES MelhorFilme(id)
);

DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorDiretor AFTER UPDATE ON MelhorDiretor
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorDiretor
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorDiretor AFTER INSERT ON MelhorDiretor
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorDiretor
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;


INSERT INTO MelhorDiretor (nome, filme_id, votos)VALUES
('Sean Baker', 1, 400),
('Brady Corbet',2, 100),
('James Mangold',3, 63),
('Jacques Audiard',6, 98),
('Coralie Fargeat',9, 47);


CREATE TABLE MelhorAtor(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);

DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorAtor AFTER UPDATE ON MelhorAtor
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtor
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Ator', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorAtor AFTER INSERT ON MelhorAtor
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtor
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Ator', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;

INSERT INTO MelhorAtor (nome, filme_id, votos)VALUES
('Adrien Brody', 2, 400),
('Timothée Chalamet',3, 100),
('Ralph Fiennes',4, 63),
('Colman Domingo',11, 98),
('Sebastian Stan',12, 47);


CREATE TABLE MelhorAtriz(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);




DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorAtriz AFTER UPDATE ON MelhorAtriz
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtriz
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Atriz', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorAtriz AFTER INSERT ON MelhorAtriz
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtriz
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Atriz', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;


INSERT INTO MelhorAtriz (nome, filme_id, votos)VALUES
('Mikey Madison', 1, 400),
('Fernanda Torres',7, 1000),
('Demi Moore',9, 603),
('Cynthia Erivo',10, 908),
('Karla Sofia Gascón',6, 1);

CREATE TABLE MelhorAtorCoadjuvante(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorAtorCoadjuvante AFTER UPDATE ON MelhorAtorCoadjuvante
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtorCoadjuvante
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Ator Coadjuvante', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorAtorCoadjuvante AFTER INSERT ON MelhorAtorCoadjuvante
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtorCoadjuvante
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Ator Coadjuvante', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;



INSERT INTO MelhorAtorCoadjuvante (nome, filme_id, votos)VALUES
('Kieran Culkin', 13, 48),
('Edward Norton',3, 108),
('Jeremy Strong',12, 63),
('Yura Borisov',1, 8),
('Guy Pearce',2, 89);


CREATE TABLE MelhorAtrizCoadjuvante(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorAtrizCoadjuvante AFTER UPDATE ON MelhorAtrizCoadjuvante
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtrizCoadjuvante
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Atriz Coadjuvante', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorAtrizCoadjuvante AFTER INSERT ON MelhorAtrizCoadjuvante
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAtrizCoadjuvante
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Atriz Coadjuvante', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;


INSERT INTO MelhorAtrizCoadjuvante (nome, filme_id, votos)VALUES
('Zoe Saldaña', 6, 0),
('Ariana Grande',10, 3000),
('Isabella Rossellini',4, 33),
('Monica Barbaro',3, 9),
('Felicity Jones',2, 8);



CREATE TABLE MelhorRoteiroOriginal(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorRoteiroOriginal AFTER UPDATE ON MelhorRoteiroOriginal
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorRoteiroOriginal
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Roteiro Original', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorRoteiroOriginal AFTER INSERT ON MelhorRoteiroOriginal
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorRoteiroOriginal
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Roteiro Original', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;

INSERT INTO MelhorRoteiroOriginal(nome, filme_id, votos)VALUES
('Anora', 1, 0),
('A Verdadeira Dor',13, 30),
('A Substância',9, 39),
('O Atentado de 5 Setembro',14 , 45),
('O Brutalista',2, 90);



CREATE TABLE MelhorRoteiroAdaptado(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);




DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorRoteiroAdaptado AFTER UPDATE ON MelhorRoteiroAdaptado
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorRoteiroAdaptado
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Roteiro Adaptado', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorRoteiroAdaptado AFTER INSERT ON MelhorRoteiroAdaptado
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorRoteiroAdaptado
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Roteiro Adaptado', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;

INSERT INTO MelhorRoteiroAdaptado (nome, filme_id, votos)VALUES
('Conclave', 4, 109),
('Emilia Pérez',6, 90),
('Sing Sing',11, 59),
('Um Completo Desconhecido',3 , 4),
('Nickel Boys',8, 4);


CREATE TABLE MelhorFilmeInternacional(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
pais VARCHAR (255) NOT NULL,
votos INT DEFAULT 0
);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorFilmeInternacional AFTER UPDATE ON MelhorFilmeInternacional
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFilmeInternacional
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Filme Internacional', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorFilmeInternacional AFTER INSERT ON MelhorFilmeInternacional
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFilmeInternacional
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Filme Internacional', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;


INSERT INTO MelhorFilmeInternacional (nome, filme_id, votos)VALUES
('Ainda Estou Aqui', 7, 10568),
('A Garota da Agulha',15, 90),
('Flow',16, 59),
('A Semente do Fruto Sagrado',17 , 4),
('Emilia Pérez',6, 4);

CREATE TABLE MelhorAnimacao(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorAnimacao AFTER UPDATE ON MelhorAnimacao
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAnimacao
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Animacao', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorAnimacao AFTER INSERT ON MelhorAnimacao
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorAnimacao
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Animacao', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER;


INSERT INTO MelhorAnimacao(nome, filme_id, votos)VALUES
('Robô Selvagem', 18, 10),
('Divertida-Mente 2',19, 97),
('Flow',16, 904),
('Wallace & Gromit: Avengança',20, 3),
('Memórias de um Caracol',21, 9);


CREATE TABLE MelhorDocumentariodeCurtaMetragem(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
votos INT DEFAULT 0
);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorDocumentariodeCurtaMetragem AFTER UPDATE ON MelhorDocumentariodeCurtaMetragem
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorDocumentariodeCurtaMetragem
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Documentario de Curta Metragem', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorDocumentariodeCurtaMetragem AFTER INSERT ON MelhorDocumentariodeCurtaMetragem
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorDocumentariodeCurtaMetragem
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Documentario de Curta Metragem', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO MelhorDocumentariodeCurtaMetragem(nome, filme_id, votos)VALUES
('The Only Girl in the Orchestra', 22, 10),
('Death by Numbers',23, 97),
('Incident',24, 904),
('I Am Ready, Warden',25, 3),
('Instruments of a Beating Heart',26, 9);


CREATE TABLE MelhorDocumentariodeLongaMetragem(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
votos INT DEFAULT 0
);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorDocumentariodeLongaMetragem AFTER UPDATE ON MelhorDocumentariodeLongaMetragem
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorDocumentariodeLongaMetragem
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Documentario de Longa Metragem', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorDocumentariodeLongaMetragem AFTER INSERT ON MelhorDocumentariodeLongaMetragem
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorDocumentariodeLongaMetragem
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Documentario de Longa Metragem', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//


INSERT INTO MelhorDocumentariodeLongaMetragem(nome, filme_id, votos)VALUES
('No Other Land', 27, 10),
('Porcelain Wars',28, 97),
('Black Box Diaries',29, 904),
('Trilha Sonora para um Golpe de Estado',30, 3),
('Sugarcane',31, 9);


CREATE TABLE MelhorTrilhaSonora(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorTrilhaSonora AFTER UPDATE ON MelhorTrilhaSonora
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorTrilhaSonora
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor TrilhaSonora', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorTrilhaSonora AFTER INSERT ON MelhorTrilhaSonora
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorTrilhaSonora
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor TrilhaSonora', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//


INSERT INTO MelhorTrilhaSonora(nome, filme_id, votos)VALUES
('O Brutalista', 2, 10),
('Emilia Pérez',6, 97),
('Conclave',4, 904),
('Robô Selvagem',18, 3),
('Wicked',10, 9);

CREATE TABLE MelhorCancaoOriginal(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorCancaoOriginal AFTER UPDATE ON MelhorCancaoOriginal
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorCancaoOriginal
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor CancaoOriginal', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorCancaoOriginal AFTER INSERT ON MelhorCancaoOriginal
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorCancaoOriginal
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor CancaoOriginal', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//



INSERT INTO MelhorCancaoOriginal(nome, filme_id, votos)VALUES
('El Mal', 6, 10),
('Like a Bird',11, 97),
('The Journal',39, 904),
('Mi Camino',6, 3),
('Never Too Late',32, 9);



CREATE TABLE MelhorFigurino(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorFigurino AFTER UPDATE ON MelhorFigurino
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFigurino
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorFigurino AFTER INSERT ON MelhorFigurino
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFigurino
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO MelhorFigurino(nome, filme_id, votos)VALUES
('Wicked', 10, 10),
('Um Completo Desconhecido',3, 97),
('Conclave',4, 904),
('Gladiador 2',33, 3),
('Nosferatu',34, 9);

CREATE TABLE MaquiagemEPenteados(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MaquiagemEPenteados AFTER UPDATE ON MaquiagemEPenteados
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MaquiagemEPenteados
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MaquiagemEPenteados AFTER INSERT ON MaquiagemEPenteados
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MaquiagemEPenteados
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO MaquiagemEPenteados(nome, filme_id, votos)VALUES
('A Substância', 9, 10),
('Emilia Pérez',6, 97),
('Wicked',10, 904),
('A Different Man',35, 3),
('Nosferatu',34, 9);



CREATE TABLE DirecaoDeArte(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_DirecaoDeArte AFTER UPDATE ON DirecaoDeArte
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM DirecaoDeArte
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_DirecaoDeArte AFTER INSERT ON DirecaoDeArte
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM DirecaoDeArte
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO DirecaoDeArte(nome, filme_id, votos)VALUES
('Conclave', 4, 10),
('Duna 2',5, 97),
('Wicked',10, 904),
('O Brutalista',2, 3),
('Nosferatu',34, 9);



CREATE TABLE MelhorFotografia(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorFotografia AFTER UPDATE ON MelhorFotografia
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFotografia
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Fotografia', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorFotografia AFTER INSERT ON MelhorFotografia
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorFotografia
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Fotografia', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO MelhorFotografia(nome, filme_id, votos)VALUES
('Enilia Pérez', 6, 10),
('Duna 2',5, 97),
('Maria',36, 904),
('O Brutalista',2, 3),
('Nosferatu',34, 9);



CREATE TABLE MelhorEdicao(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhorEdicao AFTER UPDATE ON MelhorEdicao
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorEdicao
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhor Edicao', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhorEdicao AFTER INSERT ON MelhorEdicao
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhorEdicao
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhor Edicao', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO MelhorEdicao(nome, filme_id, votos)VALUES
('Enilia Pérez', 6, 10),
('Anora',1, 97),
('Conclave',4, 904),
('O Brutalista',2, 3),
('Wicked',10, 9);



CREATE TABLE MelhoresEfeitosViuais(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
filme_id INT,
FOREIGN KEY(filme_id ) REFERENCES MelhorFilme(id),
votos INT DEFAULT 0
);


DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_MelhoresEfeitosViuais AFTER UPDATE ON MelhoresEfeitosViuais
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhoresEfeitosViuais
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Melhores Efeitos Viuais', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//

CREATE TRIGGER tr_insere_vencedor_MelhoresEfeitosViuais AFTER INSERT ON MelhoresEfeitosViuais
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM MelhoresEfeitosViuais
ORDER BY votos DESC
LIMIT 1;

INSERT INTO Vencedores (categoria, vencedor_nome, votos)
VALUES ('Melhores Efeitos Viuais', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

INSERT INTO MelhoresEfeitosViuais(nome, filme_id, votos)VALUES
('Duna 2', 6, 10),
('Planeta dos Macacos: O Reinado',37, 97),
('Better Man - A História de Robbie Williams',38, 904),
('Alien: Romulus',39, 3),
('Wicked',10, 9);



DELIMITER //

CREATE TRIGGER tr_atualiza_vencedor_Vencedores AFTER UPDATE ON Vencedores
FOR EACH ROW
BEGIN

DECLARE v_vencedor_nome VARCHAR(255);
DECLARE v_vencedor_votos INT;

SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
FROM Vencedores
ORDER BY votos DESC
LIMIT 1;



INSERT INTO Vencedores (catgeoria, vencedor_nome, votos)
VALUES ('Vencedores', v_vencedor_nome, v_vencedor_votos)
ON DUPLICATE KEY UPDATE

vencedor_nome = v_vencedor_nome,
votos = v_vencedor_votos;

END//

DELIMITER ;

DELIMITER//



