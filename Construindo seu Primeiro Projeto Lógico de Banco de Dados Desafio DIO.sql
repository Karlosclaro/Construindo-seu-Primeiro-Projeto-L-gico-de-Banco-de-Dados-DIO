-- =====================================================
-- E-COMMERCE DATABASE3
-- =====================================================
-- Criar e usar banco
-- DROP DATABASE IF EXISTS ecomerce;
CREATE DATABASE ecomerce;
USE ecomerce;

-- =====================================================
-- TABELAS PRINCIPAIS
-- =====================================================

-- 1. CLIENTES (PF/PJ validado)
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(20),
    Minit VARCHAR(10) NULL,
    Lname VARCHAR(30),
    CPF CHAR(14),        -- Formato brasileiro: 111.222.333-44
    CNPJ CHAR(18),       -- Formato brasileiro: 11.222.333/4444-55
    Address VARCHAR(100),
    clientType ENUM('PF', 'PJ') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- CHECK CONSTRAINT: PF=CPF OU PJ=CNPJ
    CONSTRAINT chk_client_type CHECK (
        (clientType = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (clientType = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
    ),
    CONSTRAINT unique_cpf UNIQUE (CPF),
    CONSTRAINT unique_cnpj UNIQUE (CNPJ)
);

-- 2. PRODUTOS
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    classification_kids BOOLEAN DEFAULT FALSE,
    category ENUM('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') NOT NULL,
    avaliacao DECIMAL(3,2) DEFAULT 0.00 CHECK (avaliacao BETWEEN 0 AND 5),
    Size VARCHAR(20),
    preco DECIMAL(10,2) NOT NULL CHECK (preco > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. PEDIDOS
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT NOT NULL,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em_processamento') DEFAULT 'Em_processamento',
    orderDescriptions TEXT,
    sendValue DECIMAL(8,2) DEFAULT 10.00,
    paymentCash BOOLEAN DEFAULT FALSE,
    trackingCode VARCHAR(50),
    deliveryStatus ENUM('Pende', 'Em_transito', 'Entregue') DEFAULT 'Pende',
    orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

-- 4. VENDEDORES (CHECK CONSTRAINT corrigido)
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(100) NOT NULL,
    AbsName VARCHAR(50),
    CPF CHAR(14),
    CNPJ CHAR(18),
    location VARCHAR(100),
    contact CHAR(11) NOT NULL,
    sellerType ENUM('PF', 'PJ') NOT NULL,
    
    CONSTRAINT chk_seller_type CHECK (
        (sellerType = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (sellerType = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
    ),
    CONSTRAINT unique_seller_cpf UNIQUE (CPF),
    CONSTRAINT unique_seller_cnpj UNIQUE (CNPJ)
);

-- 5. FORNECEDORES
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(100) NOT NULL,
    CNPJ CHAR(18) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier_cnpj UNIQUE (CNPJ)
);

-- 6. ESTOQUE
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(100) NOT NULL,
    quantity INT DEFAULT 0 CHECK (quantity >= 0)
);

-- 7. FORMAS DE PAGAMENTO
CREATE TABLE paymentMethods (
    idPaymentMethod INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    typePayment ENUM('Boleto', 'Cartao', 'Pix', 'Dois_cartoes') NOT NULL,
    limitAvailable DECIMAL(10,2) DEFAULT NULL,
    cardNumberLast4 CHAR(4),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

-- =====================================================
-- TABELAS DE RELACIONAMENTO N:N
-- =====================================================

CREATE TABLE productSeller (
    idPseller INT,
    idPproduct INT,
    prodQuantity INT DEFAULT 1 CHECK (prodQuantity > 0),
    PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);

CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1 CHECK (poQuantity > 0),
    poStatus ENUM('Disponivel', 'Sem_estoque') DEFAULT 'Disponivel',
    unitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

CREATE TABLE storageLocation (
    idLproduct INT,
    idLstorage INT,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

CREATE TABLE productSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);