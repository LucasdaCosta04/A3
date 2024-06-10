CREATE DATABASE IF NOT EXISTS GerenciamentoFerramentas;

USE GerenciamentoFerramentas;

-- Tabela para armazenar informações sobre ferramentas
CREATE TABLE IF NOT EXISTS Ferramenta (
    id_ferramenta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    custo_aquisicao DECIMAL(10, 2) NOT NULL,
    INDEX(nome)
);

-- Tabela para armazenar informações sobre amigos
CREATE TABLE IF NOT EXISTS Amigo (
    id_amigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    INDEX(nome)
);

-- Tabela para armazenar informações sobre empréstimos
CREATE TABLE IF NOT EXISTS Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    nome_amigo VARCHAR(100) NOT NULL,
    nome_ferramenta VARCHAR(100) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (nome_amigo) REFERENCES Amigo(nome),
    FOREIGN KEY (nome_ferramenta) REFERENCES Ferramenta(nome),
    INDEX(nome_amigo),
    INDEX(nome_ferramenta),
    INDEX(status)
);

-- Tabela para armazenar informações sobre a relação entre ferramentas e empréstimos
CREATE TABLE IF NOT EXISTS Ferramenta_Emprestimo (
    id_ferramenta INT,
    id_emprestimo INT,
    PRIMARY KEY (id_ferramenta, id_emprestimo),
    FOREIGN KEY (id_ferramenta) REFERENCES Ferramenta(id_ferramenta),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);

-- Tabela para armazenar relatórios
CREATE TABLE IF NOT EXISTS Relatorios (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_emprestimo INT,
    nome_amigo VARCHAR(255),
    nome_ferramenta VARCHAR(255),
    data_emprestimo DATE,
    data_devolucao DATE,
    status BOOLEAN,
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);
