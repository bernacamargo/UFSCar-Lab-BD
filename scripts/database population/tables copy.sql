DROP DATABASE IF EXISTS pessoas_juridicas;
CREATE DATABASE pessoas_juridicas;

\connect pessoas_juridicas;

CREATE TABLE empresas(
  cnpj      varchar(18) PRIMARY KEY,
  razao     varchar(60) NOT NULL,
  ramo      varchar(60) NOT NULL,
  atividade varchar(12) NOT NULL CHECK (atividade IN ('empresarial', 'comercial', 'serviço'))
);

CREATE TABLE filiais(
  codigo        integer PRIMARY KEY,
  cidade        varchar(60) NOT NULL,
  estado        varchar(60) NOT NULL,
  data_inicio   date NOT NULL DEFAULT current_date,
  cnpj_empresa  varchar(18) NOT NULL,
  FOREIGN KEY (cnpj_empresa) REFERENCES empresas(cnpj)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE pessoas(
  nome      varchar(60) NOT NULL,
  cpf       varchar(14) PRIMARY KEY,
  data_nasc date,
  tel       varchar(10),
  cargo     varchar(60) NOT NULL,
  filial    integer,
  FOREIGN KEY (filial) REFERENCES filiais(codigo)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);
