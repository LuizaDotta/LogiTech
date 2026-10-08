CREATE DATABASE logitech_express;
USE logitech_express;

-- =========================================
-- FROTAS
-- =========================================

CREATE TABLE frotas (
    id_frota INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    localizacao VARCHAR(150)
);


-- =========================================
-- MOTORISTAS
-- =========================================

CREATE TABLE motoristas (
    id_motorista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cnh VARCHAR(20) NOT NULL UNIQUE,
    id_frota INT NOT NULL,

    FOREIGN KEY (id_frota)
        REFERENCES frotas(id_frota)
);


-- =========================================
-- VEICULOS
-- =========================================

CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_frota INT NOT NULL,

    FOREIGN KEY (id_frota)
        REFERENCES frotas(id_frota)
);


-- =========================================
-- FERRAMENTAS
-- =========================================

CREATE TABLE ferramentas (
    id_ferramenta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    quantidade INT NOT NULL,

    id_frota INT NOT NULL,

    FOREIGN KEY (id_frota)
        REFERENCES frotas(id_frota),

    CHECK (quantidade >= 0)
);


-- =========================================
-- CLIENTES
-- =========================================

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150) NOT NULL UNIQUE,
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    estado VARCHAR(50)
);


-- =========================================
-- ENTREGAS
-- =========================================

CREATE TABLE entregas (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    data_entrega DATE NOT NULL,
    hora_entrega TIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    origem VARCHAR(200) NOT NULL,
    destino VARCHAR(200) NOT NULL,

    id_cliente INT NOT NULL,
    id_motorista INT NOT NULL,
    id_veiculo INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_motorista)
        REFERENCES motoristas(id_motorista),

    FOREIGN KEY (id_veiculo)
        REFERENCES veiculos(id_veiculo)
);


-- =========================================
-- ITENS_ENTREGA
-- =========================================

CREATE TABLE itens_entrega (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    peso_kg DECIMAL(10,2) NOT NULL,
    id_entrega INT NOT NULL,

    FOREIGN KEY (id_entrega)
        REFERENCES entregas(id_entrega),

    CHECK (quantidade >= 0),
    CHECK (peso_kg >= 0)
);

INSERT INTO frotas (nome, descricao, localizacao) VALUES
('Frota Norte', 'Frota responsável pelas entregas da região norte', 'Luzerna'),
('Frota Sul', 'Frota responsável pelas entregas da região sul', 'Joaçaba'),
('Frota Centro', 'Frota responsável pelas entregas da região central', 'Herval d''Oeste');

INSERT INTO motoristas 
(nome, cpf, telefone, cnh, id_frota) VALUES

('João da Silva', '12345678901', '49999999999', '123456789', 1),
('Carlos Eduardo', '23456789012', '49988888888', '234567890', 2),
('Marcos Antônio', '34567890123', '49977777777', '345678901', 3),
('Rafael Souza', '45678901234', '49966666666', '456789012', 1);

INSERT INTO veiculos
(placa, modelo, marca, ano, status, id_frota) VALUES

('ABC1D23', 'Sprinter', 'Mercedes-Benz', 2025, 'Disponível', 1),
('DEF4E56', 'Daily', 'Iveco', 2024, 'Em rota', 2),
('GHI7F89', 'Master', 'Renault', 2023, 'Disponível', 3),
('JKL8G90', 'Delivery', 'Volkswagen', 2022, 'Manutenção', 1);

INSERT INTO ferramentas
(nome, descricao, quantidade, id_frota) VALUES

('Rádio comunicador', 'Equipamento para comunicação entre motoristas', 10, 1),
('GPS', 'Sistema de localização dos veículos', 8, 2),
('Kit de primeiros socorros', 'Kit para situações de emergência', 15, 3),
('Macaco hidráulico', 'Equipamento para manutenção dos veículos', 5, 1);

INSERT INTO clientes
(nome, cpf_cnpj, telefone, email, endereco, cidade, estado) VALUES

('Empresa Exemplo', '12345678000199', '49999999999',
 'empresa1@email.com', 'Rua Principal, 100', 'Luzerna', 'SC'),

('Mercado Central', '23456789000188', '49988888888',
 'mercadocentral@email.com', 'Rua das Flores, 250', 'Joaçaba', 'SC'),

('Comercial Sul', '34567890000177', '49977777777',
 'comercial@email.com', 'Avenida Brasil, 500', 'Herval d''Oeste', 'SC'),

('Supermercado Norte', '45678901000166', '49966666666',
 'supernorte@email.com', 'Rua Central, 80', 'Luzerna', 'SC');
 
 INSERT INTO entregas
(data_entrega, hora_entrega, status, origem, destino,
id_cliente, id_motorista, id_veiculo) VALUES

('2026-10-01', '08:30:00', 'Entregue',
 'Luzerna', 'Joaçaba',
 1, 1, 1),

('2026-10-02', '10:00:00', 'Em trânsito',
 'Joaçaba', 'Chapecó',
 2, 2, 2),

('2026-10-03', '13:30:00', 'Entregue',
 'Herval d''Oeste', 'Luzerna',
 3, 3, 3),

('2026-10-04', '09:15:00', 'Em trânsito',
 'Luzerna', 'Concórdia',
 4, 4, 4);
 
 INSERT INTO itens_entrega
(descricao, quantidade, peso_kg, id_entrega) VALUES

('Caixas de produtos alimentícios', 5, 20.50, 1),
('Equipamentos eletrônicos', 3, 15.00, 2),
('Materiais de escritório', 10, 35.75, 3),
('Caixas de mercadorias', 8, 42.30, 4),
('Produtos de limpeza', 6, 18.90, 1);
