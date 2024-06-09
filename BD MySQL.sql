CREATE DATABASE GerenciamentoFerramentas;

USE GerenciamentoFerramentas;

CREATE TABLE Ferramenta (
    id_ferramenta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    custo_aquisicao DECIMAL(10, 2) NOT NULL,
    INDEX(nome)  -- Adiciona um índice na coluna 'nome'
);

CREATE TABLE Amigo (
    id_amigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    INDEX(nome)  -- Adiciona um índice na coluna 'nome'
);

CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    nome_amigo VARCHAR(100) NOT NULL,
    nome_ferramenta VARCHAR(100) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (nome_amigo) REFERENCES Amigo(nome),
    FOREIGN KEY (nome_ferramenta) REFERENCES Ferramenta(nome)
);

CREATE TABLE Ferramenta_Emprestimo (
    id_ferramenta INT,
    id_emprestimo INT,
    PRIMARY KEY (id_ferramenta, id_emprestimo),
    FOREIGN KEY (id_ferramenta) REFERENCES Ferramenta(id_ferramenta),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);

CREATE TABLE Evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_amigo INT,
    data_evento DATE NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_amigo) REFERENCES Amigo(id_amigo)
);
