USE ecomerce;

-- =====================================================
-- CLIENTES (14 registros - 7 PF + 7 PJ)
-- =====================================================
INSERT INTO clients (Fname, Minit, Lname, CPF, CNPJ, Address, clientType) VALUES
-- PF (CPF preenchido, CNPJ NULL)
('João', 'P', 'Silva', '123.456.789-01', NULL, 'Rua das Flores, 123 - Goiânia/GO', 'PF'),
('Maria', 'A', 'Santos', '987.654.321-00', NULL, 'Av. Anhanguera, 456', 'PF'),
('Pedro', NULL, 'Oliveira', '111.222.333-44', NULL, 'Rua 10, 789', 'PF'),
('Ana', 'C', 'Costa', '555.666.777-88', NULL, 'Setor Bueno, Qd 15', 'PF'),
('Carlos', 'M', 'Pereira', '999.888.777-66', NULL, 'Rua 44, 1011', 'PF'),
('Fernanda', NULL, 'Lima', '444.555.666-77', NULL, 'Av. T-9, 1213', 'PF'),
('Ricardo', 'S', 'Almeida', '777.888.999-00', NULL, 'Rua T-7, 1415', 'PF'),

-- PJ (CNPJ preenchido, CPF NULL)
('Tech', 'GOI', 'Goiânia Ltda', NULL, '12.345.678/0001-99', 'Av. Paulista, 2001', 'PJ'),
('Moda', 'RAP', 'Rápida EIRELI', NULL, '98.765.432/0001-88', 'Rua 24, 3030', 'PJ'),
('Brinquedos', NULL, 'Feliz ME', NULL, '11.223.344/5566-77', 'Av. T-3, 4040', 'PJ'),
('Móveis', 'MOD', 'Modernos LTDA', NULL, '99.887.766/5443-33', 'Rua 90, 5050', 'PJ'),
('Super', 'PRC', 'PreçoBom Comércio', NULL, '66.778.899/0011-22', 'Av. Goiás, 6060', 'PJ'),
('Eletrônicos', 'ASI', 'Asia Import', NULL, '33.445.566/7788-99', 'Rua 57, 7070', 'PJ');

-- =====================================================
-- PRODUTOS (25 registros)
-- =====================================================
INSERT INTO product (Pname, classification_kids, category, avaliacao, Size, preco) VALUES
('iPhone 15 Pro', FALSE, 'Eletronico', 4.90, 'Médio', 7299.99),
('Samsung S24', FALSE, 'Eletronico', 4.70, 'Médio', 4999.99),
('Notebook Dell', FALSE, 'Eletronico', 4.80, 'Pequeno', 8999.99),
('Smart TV LG', FALSE, 'Eletronico', 4.60, 'Grande', 3499.99),
('AirPods Pro', FALSE, 'Eletronico', 4.50, 'Pequeno', 1799.99),
('Camiseta Polo', FALSE, 'Vestimenta', 4.30, 'M', 89.90),
('Calça Jeans', FALSE, 'Vestimenta', 4.20, '38', 199.90),
('Tênis Nike', FALSE, 'Vestimenta', 4.80, '42', 599.99),
('Vestido Verão', FALSE, 'Vestimenta', 4.40, 'P', 159.90),
('Jaqueta Jeans', FALSE, 'Vestimenta', 4.10, 'G', 299.90),
('Boneca Barbie', TRUE, 'Brinquedos', 4.70, 'Grande', 499.99),
('Hot Wheels', TRUE, 'Brinquedos', 4.60, 'Pequeno', 49.90),
('Lego Creator', TRUE, 'Brinquedos', 4.90, 'Médio', 299.99),
('Quebra-Cabeça', TRUE, 'Brinquedos', 4.50, 'Médio', 89.90),
('Arroz 5kg', FALSE, 'Alimentos', 4.40, '5kg', 29.90),
('Azeite 1L', FALSE, 'Alimentos', 4.60, '1L', 49.90),
('Chocolate 70%', FALSE, 'Alimentos', 4.80, '100g', 19.90),
('Sofá Couro', FALSE, 'Moveis', 4.30, '3x2m', 2499.99),
('Cadeira Office', FALSE, 'Moveis', 4.20, 'Padrão', 399.99),
('Mesa Jantar', FALSE, 'Moveis', 4.10, 'Grande', 1899.99),
('Tablet iPad', FALSE, 'Eletronico', 4.75, 'Médio', 3999.99),
('Relógio Smart', FALSE, 'Eletronico', 4.40, 'Pequeno', 1299.99),
('Camisa Social', FALSE, 'Vestimenta', 4.35, 'M', 149.90),
('Bola Futebol', TRUE, 'Brinquedos', 4.65, '5', 89.90),
('Macarrão 1kg', FALSE, 'Alimentos', 4.25, '1kg', 12.90);

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES

-- FORNECEDORES 1-10 (ELETRÔNICOS)
(2, 2, 300),  -- Eletrônicos Asia → Samsung S24
(3, 3, 200),  -- Gadgets Import → Notebook Dell
(4, 4, 150),  -- SmartTech → Smart TV LG
(5, 5, 100),  -- Digital Store → AirPods Pro
(6, 21, 250), -- ChipWorld → Tablet iPad
(7, 22, 180), -- TechNordeste → Relógio Smart
(8, 1, 400),  -- ElectroBrasil → iPhone (2º fornecedor)
(9, 23, 120), -- GigaTech → Camisa Social
(10, 2, 350), -- ByteStore → Samsung (2º fornecedor)

-- FORNECEDORES 12-20 (TÊXTIL)
(12, 6, 1000),  -- Textil Norte → Camiseta Polo
(13, 7, 800),   -- ModaFina → Calça Jeans
(14, 8, 600),   -- FioReal → Tênis Nike
(15, 9, 400),   -- EstampaSul → Vestido Verão
(16, 10, 300),  -- MalhasPremium → Jaqueta Jeans
(17, 24, 500),  -- Confecco → Camisa Social (2º)
(18, 6, 750),   -- TecidosLeste → Camiseta (2º)
(19, 7, 650),   -- FibrasAmazonas → Calça (2º)
(20, 25, 200),  -- CosturaRápida → Macarrão (diversificação)

-- FORNECEDORES 26-35 (ALIMENTOS/TÊXTIL)
(26, 11, 200),  -- AlfaTecidos → Boneca Barbie
(27, 12, 500),  -- BetaConfeções → Hot Wheels
(28, 13, 300),  -- GammaVestuário → Lego Creator
(29, 14, 250),  -- DeltaMalhas → Quebra-Cabeça
(30, 15, 400),  -- EpsilonTecidos → Arroz 5kg
(31, 16, 1000), -- AgroNorte → Azeite 1L
(32, 17, 800),  -- SaboresBrasil → Chocolate 70%
(33, 18, 600),  -- GrãosAmazonas → Sofá Couro
(34, 19, 400),  -- FrutasFrescas → Cadeira Office
(35, 20, 300),  -- DocesFinos → Mesa Jantar
-- FORNECEDORES 40-50 (MÓVEIS/ALIMENTOS)
(40, 16, 900),   -- CarnesPremium → Arroz (2º)
(41, 17, 700),   -- BebidasNordeste → Azeite (2º)
(42, 18, 550),   -- LaticíniosSul → Sofá (2º)
(43, 19, 450),   -- MassasItaliana → Cadeira (2º)
(44, 20, 350),   -- PãesArtesanais → Mesa (2º)
(45, 11, 180),   -- TemperosExóticos → Boneca (2º)
(46, 12, 450),   -- GourmetCenter → Hot Wheels (2º)
(47, 13, 280),   -- OrgânicosVerde → Lego (2º)
(48, 14, 220),   -- SucosNaturais → Quebra-Cabeça (2º)
(49, 15, 380),   -- MelPremium → Arroz (3º)
(50, 1, 420);    -- MóveisModernos → iPhone (diversificação)

-- =====================================================
-- DADOS COMPLEMENTARES
-- =====================================================

-- Vendedores (PF/PJ corrigido)
INSERT INTO seller (SocialName, AbsName, CPF, CNPJ, location, contact, sellerType) VALUES
('EletrônicosGO Ltda', NULL, NULL, '11.122.333/4444-55', 'Goiânia', '11987654321', 'PJ'),
('ModaFina Comércio', NULL, NULL, '55.566.677/7888-99', 'Goiânia', '11876543210', 'PJ'),
('Lucas Mendes', 'Lucas', '333.444.555-66', NULL, 'Goiânia', '11765432109', 'PF'),
('Ana Silva', 'Ana', '111.222.333-44', NULL, 'Goiânia', '11654321098', 'PF');

-- Fornecedores
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Tech Import Ltda', '12.345.678/9001-23', '11999999999'),
('Textil Norte', '98.765.432/1098-76', '11888888888');

-- adicionei um pouco mais, para ficar interessante
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
-- ELETRÔNICOS (1-25)
('Tech Import Ltda', '12.345.678/0001-99', '11999999999'),
('Eletrônicos Asia ME', '98.765.432/0001-88', '11888888888'),
('Gadgets Import Ltda', '23.456.789/0001-12', '11777777777'),
('SmartTech Comércio', '45.678.901/0001-23', '11666666666'),
('Digital Store EIRELI', '67.890.123/0001-34', '11555555555'),
('ChipWorld Import', '89.012.345/0001-45', '11444444444'),
('TechNordeste Ltda', '01.234.567/0001-56', '11333333333'),
('ElectroBrasil ME', '13.456.789/0001-67', '11222222222'),
('GigaTech Import', '35.678.901/0001-78', '11111111111'),
('ByteStore Ltda', '57.890.123/0001-89', '11000000000'),

-- TÊXTIL/VESTUÁRIO (26-50)
('Textil Norte Ltda', '79.012.345/0001-90', '21999999999'),
('ModaFina Comércio', '90.123.456/0001-01', '21888888888'),
('FioReal Tecidos', '12.345.678/0002-12', '21777777777'),
('EstampaSul ME', '34.567.890/0002-23', '21666666666'),
('MalhasPremium Ltda', '56.789.012/0002-34', '21555555555'),
('Confecco Centro', '78.901.234/0002-45', '21444444444'),
('TecidosLeste EIRELI', '90.123.456/0002-56', '21333333333'),
('FibrasAmazonas', '01.234.567/0002-67', '21222222222'),
('CosturaRápida Ltda', '23.456.789/0002-78', '21111111111'),
('ModaExpress ME', '45.678.901/0002-89', '21000000000'),
('AlfaTecidos Ltda', '67.890.123/0003-90', '31999999999'),
('BetaConfeções', '89.012.345/0003-01', '31888888888'),
('GammaVestuário', '01.234.567/0003-12', '31777777777'),
('DeltaMalhas Ltda', '23.456.789/0003-23', '31666666666'),
('EpsilonTecidos', '45.678.901/0003-34', '31555555555'),
-- ALIMENTOS (51-75)
('AgroNorte Alimentos', '67.890.123/0004-45', '41555555555'),
('SaboresBrasil Ltda', '89.012.345/0004-56', '41444444444'),
('GrãosAmazonas ME', '01.234.567/0004-67', '41333333333'),
('FrutasFrescas EIRELI', '13.456.789/0004-78', '41222222222'),
('DocesFinos Ltda', '35.678.901/0004-89', '41111111111'),
('CarnesPremium ME', '57.890.123/0004-90', '41000000000'),
('BebidasNordeste', '79.012.345/0005-01', '51999999999'),
('LaticíniosSul Ltda', '90.123.456/0005-12', '51888888888'),
('MassasItaliana ME', '12.345.678/0005-23', '51777777777'),
('PãesArtesanais', '34.567.890/0005-34', '51666666666'),
('TemperosExóticos Ltda', '56.789.012/0005-45', '51555555555'),
('GourmetCenter EIRELI', '78.901.234/0005-56', '51444444444'),
('OrgânicosVerde', '90.123.456/0005-67', '51333333333'),
('SucosNaturais ME', '01.234.567/0005-78', '51222222222'),
('MelPremium Ltda', '23.456.789/0005-89', '51111111111'),
-- MÓVEIS (76-100)
('MóveisModernos Ltda', '45.678.901/0006-90', '61999999999'),
('DesignCasa ME', '67.890.123/0006-01', '61888888888'),
('SofásConforto', '89.012.345/0006-12', '61777777777'),
('CozinhasPlanejadas', '01.234.567/0006-23', '61666666666'),
('MóveisInfantis Ltda', '13.456.789/0006-34', '61555555555'),
('DecoraHome EIRELI', '35.678.901/0006-45', '61444444444'),
('MarcenariaArt Ltda', '57.890.123/0006-56', '61333333333'),
('EstofadosLuxo ME', '79.012.345/0006-67', '61222222222'),
('MóveisRústicos', '90.123.456/0006-78', '61111111111'),
('HomeDesign Ltda', '12.345.678/0006-89', '61000000000'),
('QuartosCompletos', '34.567.890/0007-90', '71999999999'),
('EscritóriosModa ME', '56.789.012/0007-01', '71888888888'),
('BanheirosLuxo Ltda', '78.901.234/0007-12', '71777777777'),
('VarandasZen EIRELI', '90.123.456/0007-23', '71666666666'),
('JardinsUrbanos', '01.234.567/0007-34', '71555555555'),
('LuzDesign Ltda', '23.456.789/0007-45', '71444444444'),
('CoresVivas ME', '45.678.901/0007-56', '71333333333'),
('FormasPuras EIRELI', '67.890.123/0007-67', '71222222222'),
('TexturasFinas Ltda', '89.012.345/0007-78', '71111111111'),
('EspaçosVivos', '01.234.567/0007-89', '71000000000'),
('AmbientesIntegrados', '13.456.789/0008-90', '81999999999'),
('SustentávelCasa ME', '35.678.901/0008-01', '81888888888'),
('EcoMóveis Ltda', '57.890.123/0008-12', '81777777777'),
('VerdeVida EIRELI', '79.012.345/0008-23', '81666666666'),
('NaturezaUrbana', '90.123.456/0008-34', '81555555555');

-- Estoque
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Armazém Central Goiânia', 1500),
('Depósito Norte', 800),
('CD Sul', 1200);

-- Relacionamentos
INSERT INTO productSeller (idPseller, idPproduct) VALUES (1,1),(1,2),(1,21),(2,6),(2,7),(2,23),(3,11),(3,12),(4,8);
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES (1,1,500),(1,2,300),(2,6,1000),(2,7,800);
INSERT INTO storageLocation (idLproduct, idLstorage) VALUES (1,1),(2,1),(6,2),(7,2),(11,3);

-- PEDIDOS (VALIDADO)
-- =====================================================
INSERT INTO orders (idOrderClient, orderStatus, sendValue, trackingCode, deliveryStatus) VALUES
(1, 'Confirmado', 15.00, 'TRK123456', 'Entregue'),
(2, 'Em_processamento', 12.50, 'TRK789012', 'Pende'),
(1, 'Cancelado', 10.00, 'TRK345678', 'Pende'),
(3, 'Confirmado', 25.00, 'TRK901234', 'Em_transito'),
(9, 'Confirmado', 30.00, 'TRK567890', 'Entregue');

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, unitPrice) VALUES
(1,1,1,7299.99),  -- iPhone no pedido 1
(6,1,2,89.90),    -- Camisetas no pedido 1
(2,2,1,4999.99),  -- Samsung no pedido 2
(11,3,1,499.99),  -- Boneca no pedido 3
(8,4,1,599.99),   -- Tênis no pedido 4
(21,4,1,3999.99); -- Tablet no pedido 4