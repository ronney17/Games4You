create database pi;
use pi;

CREATE TABLE IF NOT EXISTS enderecos (
    id INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(200) NOT NULL,
    bairro VARCHAR(200),
    cidade VARCHAR(200),
    estado VARCHAR(200),
    cep VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cpfCliente VARCHAR(45) NOT NULL,
    sexo VARCHAR(45),
    dataDeNasc DATE NOT NULL,
    email VARCHAR(200) NOT NULL,
    senha VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(45),
    id_enderecos INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_clientes_enderecos FOREIGN KEY (id_enderecos)
        REFERENCES enderecos (id)
);

CREATE TABLE IF NOT EXISTS telefones (
    id INT NOT NULL AUTO_INCREMENT,
    telefones VARCHAR(30) NOT NULL,
    id_clientes INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_telefones_clientes FOREIGN KEY (id_clientes)
        REFERENCES clientes (id)
);

CREATE TABLE IF NOT EXISTS jogos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    dataDeLancamento DATE,
    genero VARCHAR(200),
    descricao LONGTEXT,
    classificacao VARCHAR(10),
    valor DECIMAL(8 , 2 ) NOT NULL,
    fornecedor VARCHAR(200),
    caminhoImagem VARCHAR(200),
    caminhoTrailer VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS formadepagamento (
    id INT NOT NULL,
    descricao VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS venda (
    id INT NOT NULL AUTO_INCREMENT,
    id_clientes INT NOT NULL,
    id_formadepagamento INT NOT NULL,
    nomeCartao VARCHAR(200),
    numeroCartao VARCHAR(16),
    validadeCartao VARCHAR(50),
    cvvCartao INT,
    parcelasCartao INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_venda_clientes FOREIGN KEY (id_clientes)
        REFERENCES clientes (id),
    CONSTRAINT fk_vendas_formadepagamento FOREIGN KEY (id_formadepagamento)
        REFERENCES formadepagamento (id)
);
    
CREATE TABLE IF NOT EXISTS itens_venda (
    id INT NOT NULL AUTO_INCREMENT,
    quantidade INT NOT NULL,
    id_jogos INT NOT NULL,
    id_venda INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_itens_jogos FOREIGN KEY (id_jogos)
        REFERENCES jogos (id),
    CONSTRAINT fk_itens_venda FOREIGN KEY (id_venda)
        REFERENCES venda (id)
);
    
-- drop database pi;