/*
Aula 5 - Date Manipulation Language (DML) - Linuguagem de Manipulação de Dados
Link videoaula → https://youtu.be/eyx3Yk2iEBg
*/

DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

CREATE TABLE estado( 				-- criando a tabela estado
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (				-- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- SINTAXE INSERT COMPLETO
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT,'PARANÁ','PR','S','2020-12-20');

-- INSERT COM DEFAULT
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT,'SÃO PAULO','SP',DEFAULT, DEFAULT);

-- INSERT COM COLUNAS ESPECÍFICAS
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');

-- INSERT NA CIDADE - COLUNAS COM FK
INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA',1);

-- INSERT DE VÁRIOS REGISTROS - SOMENTE MySQL
INSERT INTO cidade (nome,estado_id) VALUES ('BAURU',2), ('LONDRINA',1), ('GUARULHOS', 2);

-- TESTE DE ERRO

-- INSERT INTO estado (nome,sigla) VALUES ('AMAZONAS','AM'), ('AMAZONAS','AM');
-- INSERT INTO cidade (nome,estado_id) VALUES ('BAURU',8);

SELECT * FROM estado;
SELECT * FROM cidade;






