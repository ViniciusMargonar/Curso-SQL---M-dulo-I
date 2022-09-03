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

/*
INSERT -Lista Exercício 
Caso queira fazer na prática, execute o script do link: https://github.com/heliokamakawa/curso_bd/blob/master/05a-SELECT%20-%20script%20aula.sql
*/

-- AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole,  digite os comandos e mentalize o que está fazendo na medida que digita cada comando. Uma dica  importante é que você digite primeiro no bloco de notas, com intuito de testar se realmente  consegue digitar os comandos sem a ajuda do IDE – depois teste os comandos. 
-- 5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 
INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (DEFAULT,'AMAZONAS', 'AM', DEFAULT, DEFAULT) ,(DEFAULT,'ACRE','AC', DEFAULT, DEFAULT) ,(DEFAULT,'MATO GROSSO DO SUL','MS', DEFAULT, DEFAULT);

-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento.
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO DE JANEIRO', 'RJ', 'S', '2022-09-03') ,('SANTA CATARINA','SC', 'S', '2022-09-03');

-- 7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 
INSERT INTO estado (nome, sigla) VALUES ('BAHIA', 'BA') ,('RIO GRANDE DO SUL','RS');

-- 8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.
INSERT INTO cidade (id,nome,estado_id,data_cadastro) VALUES (5,'PARANAVAÍ',1,'2022-09-03');
INSERT INTO cidade (nome,estado_id,data_cadastro) VALUES ('BONITO',11,'2022-09-03'); 
INSERT INTO cidade (nome,estado_id) VALUES ('RIO BRANCO',10);

-- 9. Faça a inserção de 2 registros de cliente.  
INSERT INTO cliente (id, nome, cpf, email, telefone) VALUES (1, 'VINICIUS MARGONAR', 11857346947, 'vinimargonar@hotmail.com', 44998306822), (2, 'JOE BIDEN', 13354446947, 'biden_joe@hotmail.com', 44997706882);

-- 10. DESAFIO!!! Tente fazer todas as inserções necessárias para que se tenha um item de caixa. Na medida  que esteja digitando o código, tente associar os dados inseridos com o contexto real.
INSERT INTO produtos (id, descricao, preco, categoria) VALUES (1, 'PACOTE DE GRAMPOS', 4.99, 1);

SELECT * FROM estado;
SELECT * FROM cidade;




