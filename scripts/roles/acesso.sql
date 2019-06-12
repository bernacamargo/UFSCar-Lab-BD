--USUÁRIOS--

--Usuário interno comum
CREATE ROLE usuariointerno noinherit login;
GRANT SELECT  ON empresas, filiais, pessoas, empresas_filiais TO usuariointerno;

--Gerente de banco
CREATE ROLE gerente noinherit login password 'gerente123';
GRANT SELECT  ON empresas, filiais, pessoas, empresas_filiais TO gerente;
GRANT INSERT ON empresas, filiais, pessoas, empresas_filiais TO gerente;
GRANT UPDATE ON empresas, filiais, pessoas, empresas_filiais TO gerente;

--Administrador Geral
CREATE ROLE badmin noinherit login password 'admin123';
GRANT ALL PRIVILEGES ON empresas, filiais, pessoas, empresas_filiais TO badmin WITH GRANT OPTION;

--Marketeiro
CREATE USER marketing noinherit password 'market123';
GRANT SELECT(cnpj, ramo, atividade) ON empresas TO marketing;
GRANT SELECT(cpf, filial) ON pessoas TO marketing;
GRANT SELECT(cidade, estado, cnpj_empresa, codigo) ON filiais TO marketing;
GRANT SELECT(cnpj, ramo, atividade, codigo) ON empresas_filiais TO marketing;