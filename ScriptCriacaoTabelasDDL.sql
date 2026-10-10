
-- 1. Tabela PARTIDO
CREATE TABLE partido (
    numero_partido INT NOT NULL,
    nome_partido VARCHAR(100) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    CONSTRAINT pk_partido PRIMARY KEY (numero_partido)
);

-- 2. Tabela CANDIDATO
CREATE TABLE candidato (
    numero_candidato INT NOT NULL,
    nome_candidato VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    numero_partido INT NOT NULL,
    CONSTRAINT pk_candidato PRIMARY KEY (numero_candidato),
    CONSTRAINT fk_candidato_partido FOREIGN KEY (numero_partido) 
        REFERENCES partido(numero_partido) ON DELETE CASCADE,
    CONSTRAINT ck_cargo CHECK (cargo IN (
        'Deputado Federal', 'Deputado Estadual', 'Senador', 'Governador', 'Presidente da República'
    ))
);

-- 3. Tabela ELEITOR
CREATE TABLE eleitor (
    titulo_eleitor VARCHAR(20) NOT NULL,
    nome_eleitor VARCHAR(100) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    zona_eleitoral INT NOT NULL,
    secao_eleitoral INT NOT NULL,
    CONSTRAINT pk_eleitor PRIMARY KEY (titulo_eleitor)
);

-- 4. Tabela REGISTRO_VOTACAO 
CREATE TABLE registro_votacao (
    id_registro INT NOT NULL,
    data_hora_voto TIMESTAMP NOT NULL,
    titulo_eleitor VARCHAR(20) NOT NULL,
    CONSTRAINT pk_registro_votacao PRIMARY KEY (id_registro),
    CONSTRAINT fk_registro_eleitor FOREIGN KEY (titulo_eleitor) 
        REFERENCES eleitor(titulo_eleitor) ON DELETE CASCADE,
    CONSTRAINT uk_eleitor_voto UNIQUE (titulo_eleitor) -- Impede voto duplo
);

-- 5. Tabela VOTO_CANDIDATO 
CREATE TABLE voto_candidato (
    id_voto INT NOT NULL,
    data_hora_voto TIMESTAMP NOT NULL,
    numero_candidato INT NOT NULL,
    CONSTRAINT pk_voto_candidato PRIMARY KEY (id_voto),
    CONSTRAINT fk_voto_candidato FOREIGN KEY (numero_candidato) 
        REFERENCES candidato(numero_candidato) ON DELETE CASCADE
);
