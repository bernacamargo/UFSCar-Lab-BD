-- Importando dados de companies.csv para a tabela empresas
COPY empresas(cnpj, razao, ramo, atividade)
FROM '/Users/rafael/Documents/T.U/09 - Lab BD/projeto/companies.csv' DELIMITER ',' CSV HEADER;

-- Importando dados de filiais.csv para a tabela filiais
COPY filiais(codigo, cidade, estado, data_inicio, cnpj_empresa)
FROM '/Users/rafael/Documents/T.U/09 - Lab BD/projeto/filiais.csv' DELIMITER ',' CSV HEADER;

-- Importando dados de people.csv para a tabela pessoas
COPY pessoas(nome, cpf, data_nasc, tel, cargo, filial)
FROM '/Users/rafael/Documents/T.U/09 - Lab BD/projeto/people.csv' DELIMITER ',' CSV HEADER;
