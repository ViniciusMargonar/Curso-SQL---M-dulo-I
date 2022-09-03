/*
eliminando base de dados
só execua se existir
*/

DROP DATABASE IF EXISTS banco_video;
-- criando a base de dados!

CREATE DATABASE banco_video;

USE banco_video;

DROP TABLE IF EXISTS estado;
-- importante virgula no começo para facilitar.

CREATE TABLE estado(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ,CHECK (ativo IN ('S','N'))
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))
);

/*
Regras definidas na mesma linha da definição da coluna
sao conhecidas como: CONSTRAINT INLINE
e fora como: CONSTRAINT OUT OF LINE
*/


-- INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (1,'PARANÁ','PR','S','2022-09-03');
-- INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (2,'PARANÁ','PR','S','2022-09-03');
-- INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (3,'SÃO PAULO','SP','S','2022-09-03');

INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR');
-- Retirou-se aquilo que já é preenchido automaticamente
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');

SELECT id,nome,sigla,ativo,data_cadastro FROM estado;

