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
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))
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

CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE(nome,estado_id)

);

INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA', 1);

SELECT * FROM cidade;

-- Mais facil alterar direto na tabela caso ainda nao esteja em producao!

-- ALTERAR TABELA

ALTER TABLE estado ADD COLUMN regiao INT;

-- SELECT * FROM estado;
-- DESCRIBE estado;
DESC estado;

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP COLUMN regiao;
ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO' AFTER nome;

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100)  NOT NULL AFTER sigla;

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP CONSTRAINT estado_ativo_deve_ser_S_ou_N;
ALTER TABLE estado MODIFY COLUMN ativo ENUM('S','N') NOT NULL;

INSERT INTO estado (nome, sigla, ativo)  VALUES ('MATO GROSSO','MT' , 'A');

