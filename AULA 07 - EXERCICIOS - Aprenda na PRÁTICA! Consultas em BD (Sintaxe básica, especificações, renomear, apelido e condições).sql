
-- LISTA DE EXERCICIOS 

-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento.
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO DE JANEIRO', 'RJ', 'S', '2022-09-03'), ('RIO GRANDE DO SUL','RS', 'S', '2022-09-03');
 
-- 7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários.  
INSERT INTO estado (nome, sigla) VALUES ('BAHIA', 'BA'), ('AMAZONAS','AM');

-- 10.	Refaça o exercício anterior alterando os dados de mais que uma coluna de um único registro sem utilizar como filtro a chave primária. A escolha da coluna do filtro é muito importante – TOME CUIDADO.
UPDATE estado SET nome = 'PARANÁ', sigla = 'PR' WHERE sigla = 'PR';
SELECT * FROM estado;

-- 13.	Escreva todos os comandos necessários para excluir o cliente com o id “38”.
DELETE FROM cliente WHERE id = 38;

-- 6.	Escreva o comando para seleccionar todos os registros da tabela cidade com todas as colunas.
SELECT * FROM cidade;
SELECT id,nome,ativo,data_cadastro<estado_id FROM cidade;

-- 7.	Escreva o comando para seleccionar o nome de todos os registros da tabela cidade.
SELECT nome FROM cidade;





