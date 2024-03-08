-- CONSTRAINT PRIMARY KEY A NÍVEL DE COLUNA
CREATE TABLE t_sip_departamento (
    cd_depto NUMBER(3)      NOT NULL 
    CONSTRAINT pk_sip_departamento PRIMARY KEY,
    nm_depto VARCHAR2(30)   NOT NULL,
    sg_depto CHAR(3)        NOT NULL
);

-- IMPLEMENTAÇÃO DA CONSTRAINT UNIQUE
   ALTER TABLE t_sip_departamento 
    ADD CONSTRAINT un_sip_depto_nome 
    UNIQUE ( nm_depto );
    
    
CREATE TABLE T_SIP_FUNCIONARIO (
  nr_matricula NUMBER(5) NOT NULL CONSTRAINT pk_sip_funcionario PRIMARY KEY,
  cd_depto NUMBER(3) NOT NULL,  -- Assuming relationship with a department
  CONSTRAINT fk_sip_func_depto FOREIGN KEY (cd_depto) REFERENCES t_sip_departamento(cd_depto),
  nm_funcionario VARCHAR2(50),
  dt_nascimento DATE,
  dt_admissao DATE,
  ds_endereco VARCHAR2(100),
  vl_salario_mensal NUMBER(7,2)
);

ALTER  TABLE T_SIP_FUNCIONARIO
    ADD CONSTRAINT ck_datas 
    CHECK (dt_admissao > dt_nascimento);


    
--DROP TABLE t_sip_departamento;
--DROP TABLE T_SIP_FUNCIONARIO;

-- EXCLUIR A TABELA ELIMINANDO AS REFERÊNCIAS
--DROP TABLE t_sip_departamento CASCADE CONSTRAINTS;

-- COMENTÁRIO SOBRE TABELA E CAMPOS
COMMENT ON TABLE T_SIP_DEPARTAMENTO IS 'EXEMPLO DE COMENTÁRIO PARA A TABELA';
COMMENT ON COLUMN T_SIP_DEPARTAMENTO.SG_DEPTO IS 'EXEMPLO DE COMENTÁRIO DE COLUNA';