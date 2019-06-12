-- PROC 1 TO EXEC CONSULTA 1
CREATE OR REPLACE FUNCTION filial_da_cidade(city varchar, page integer default 1) RETURNS TABLE(
  razao       varchar(60),
  codigo        integer,
  cidade        varchar(60),
  estado        varchar(60),
  inaugurada_em date
) AS $emp_stamp$
BEGIN
  RETURN QUERY
    select e.razao, f.codigo, f.cidade, f.estado, f.data_inicio
    from empresas e 
    join filiais f on f.cnpj_empresa = e.cnpj
    where f.cidade ilike '%' || city || '%' order by razao
    limit 20
    offset (page - 1) * 20;
END;
$emp_stamp$ LANGUAGE plpgsql;


-- PROC 2 TO EXEC CONSULTA 2
CREATE OR REPLACE FUNCTION ranking_empresas_atividade(actv varchar, page integer default 1) RETURNS TABLE(
  cnpj          varchar(60),
  razao       varchar(60),
  ramo          varchar(60),
  atividade     varchar(12),
  nro_pessoas   bigint
) AS $emp_stamp$
BEGIN
  RETURN QUERY
    SELECT ef.cnpj, ef.razao, ef.ramo, ef.atividade, COUNT(p.cpf) AS nro_pessoas
    FROM empresas_filiais ef
    JOIN pessoas p ON p.filial = ef.codigo
    WHERE ef.atividade = actv
    GROUP BY ef.cnpj, ef.razao, ef.ramo, ef.atividade
    ORDER BY nro_pessoas DESC
    LIMIT 5
    offset (page - 1) * 20;
END;
$emp_stamp$ LANGUAGE plpgsql;

-- PROC 3 TO UPDATE MATERIALIZED VIEW
CREATE OR REPLACE FUNCTION updateViewEmpresasAtividade() RETURNS trigger
AS $emp_stamp$
BEGIN
    DROP MATERIALIZED VIEW empresas_filiais;
    CREATE MATERIALIZED VIEW empresas_filiais
    AS
      SELECT *
      FROM empresas e
      JOIN filiais f ON f.cnpj_empresa = e.cnpj
    WITH DATA;
    RETURN NEW;
END;
$emp_stamp$ LANGUAGE plpgsql;

