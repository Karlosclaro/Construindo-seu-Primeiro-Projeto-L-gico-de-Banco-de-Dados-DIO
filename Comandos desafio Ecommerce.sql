-- 1. Quantos pedidos foram feitos por cada cliente?

SELECT 
    c.idClient,
    CASE 
        WHEN c.clientType = 'PF' THEN CONCAT(c.Fname, ' ', IFNULL(c.Minit, ''), ' ', c.Lname)
        ELSE c.Lname
    END as cliente,
    c.clientType,
    COUNT(o.idOrder) as total_pedidos,
    SUM(o.sendValue) as valor_frete_total
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.clientType, c.Fname, c.Minit, c.Lname
HAVING total_pedidos > 0
ORDER BY total_pedidos DESC, cliente;

-- 2. Algum vendedor também é fornecedor?
SELECT 
    s.SocialName as vendedor,
    s.CNPJ as cnpj_vendedor,
    sup.SocialName as fornecedor,
    sup.CNPJ as cnpj_fornecedor
FROM seller s
INNER JOIN supplier sup ON s.CNPJ = sup.CNPJ
ORDER BY s.SocialName;

-- Vendedores PF/PJ vs Fornecedores PJ (comparar nomes similares)
SELECT 
    s.SocialName as vendedor,
    s.sellerType as Físico_Jurídio,
    sup.SocialName as fornecedor,
    CASE 
        WHEN LOCATE(s.SocialName, sup.SocialName) > 0 OR LOCATE(sup.SocialName, s.SocialName) > 0 
        THEN '🔗 POSSÍVEL MESMA EMPRESA'
        ELSE 'ℹ️ Diferentes'
    END as relacao
FROM seller s
CROSS JOIN supplier sup
-- WHERE s.sellerType = 'PJ' -- posso procurar só por fisico juridico
ORDER BY relacao DESC, s.SocialName;

-- 3. Relação de produtos, fornecedores e estoques
SELECT 
    p.idProduct,
    p.Pname as produto,
    p.category as Categoria,
    sup.SocialName as fornecedor,
    ps.quantity as qtd_fornecida,
    st.quantity as estoque_atual,
    p.preco,
    CASE 
        WHEN st.quantity > ps.quantity THEN '✅ Estoque alto'
        WHEN st.quantity > ps.quantity * 0.5 THEN '⚠️ Estoque médio'
        ELSE '❌ Estoque baixo'
    END as status_estoque
FROM product p
LEFT JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
LEFT JOIN supplier sup ON ps.idPsSupplier = sup.idSupplier
LEFT JOIN storageLocation sl ON p.idProduct = sl.idLproduct
LEFT JOIN productStorage st ON sl.idLstorage = st.idProdStorage
ORDER BY p.category, status_estoque, p.Pname;

-- Resumo dos dados
SELECT 'Tabela' as Tabela, COUNT(*) as Registros FROM clients UNION ALL
SELECT 'clients', COUNT(*) FROM product UNION ALL
SELECT 'product', COUNT(*) FROM seller UNION ALL
SELECT 'seller', COUNT(*) FROM supplier UNION ALL
SELECT 'supplier', COUNT(*) FROM orders;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    sup.SocialName as fornecedor,
    COUNT(DISTINCT p.idProduct) as total_produtos,
    GROUP_CONCAT(
        DISTINCT CONCAT(p.Pname, ' (', p.category, ')') 
        ORDER BY p.Pname 
        SEPARATOR ' | '
    ) as produtos_fornecidos,
    SUM(ps.quantity) as total_quantidade
FROM supplier sup
LEFT JOIN productSupplier ps ON sup.idSupplier = ps.idPsSupplier
LEFT JOIN product p ON ps.idPsProduct = p.idProduct
GROUP BY sup.idSupplier, sup.SocialName
HAVING total_produtos > 0
ORDER BY total_produtos DESC, fornecedor;

-- Validar constraints
SELECT clientType, COUNT(*) FROM clients GROUP BY clientType;
SELECT sellerType, COUNT(*) FROM seller GROUP BY sellerType;

-- Top clientes por pedidos
SELECT concat(Fname, ' ', c.Lname) AS Nome_Completo, COUNT(o.idOrder) as total_pedidos
FROM clients c LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient ORDER BY total_pedidos DESC LIMIT 5;

-- Fornecedores sem produtos Fornecer mais produtos para esses
SELECT SocialName FROM supplier 
WHERE idSupplier NOT IN (SELECT idPsSupplier FROM productSupplier);

-- Produtos sem fornecedor
SELECT Pname FROM product 
WHERE idProduct NOT IN (SELECT idPsProduct FROM productSupplier);

SHOW TABLES;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM productOrder;
SELECT * FROM orders;
SELECT * FROM orders LIMIT 3;
SELECT * FROM productOrder LIMIT 3;

-- Pedidos com produtos
SELECT 
    o.idOrder,
    o.orderStatus,
    o.trackingCode,
    p.Pname,
    po.poQuantity,
    po.unitPrice
FROM orders o
JOIN productOrder po ON o.idOrder = po.idPOorder
JOIN product p ON po.idPOproduct = p.idProduct
ORDER BY o.idOrder, p.Pname;

-- Clientes PF + PJ
SELECT 
    idClient,
    CASE 
        WHEN clientType = 'PF' THEN CONCAT(Fname, ' ', IFNULL(Minit, ''), ' ', Lname)
        ELSE Lname
    END as nome_completo,
    clientType AS Físico_Jurídico,
    CPF,
    CNPJ,
    Address
FROM clients 
ORDER BY clientType, idClient;

-- Todos os fornecedores
SELECT 
    idSupplier,
    SocialName as nome_fornecedor,
    CNPJ,
    contact
FROM supplier 
ORDER BY SocialName;

-- Contagem total
SELECT COUNT(*) as total_fornecedores FROM supplier;

-- Por setor (primeiros caracteres do nome)
SELECT 
    LEFT(SocialName, 4) as setor,
    COUNT(*) as quantidade
FROM supplier 
GROUP BY setor 
ORDER BY quantidade DESC;

USE ecomerce;

-- =====================================================
-- VERIFICAÇÃO CORRIGIDA (SEM ACENTOS)
-- =====================================================

-- 1. Contagem total
SELECT COUNT(*) as total_fornecedores FROM supplier;

-- 2. Por setor (primeiros caracteres)
SELECT 
    LEFT(SocialName, 4) as setor,
    COUNT(*) as quantidade
FROM supplier 
GROUP BY setor 
ORDER BY quantidade DESC;

-- Total (rápido)
SELECT COUNT(*) FROM supplier;

-- Primeiros 5
SELECT * FROM supplier LIMIT 5;

-- Por ordem alfabética
SELECT SocialName FROM supplier ORDER BY SocialName LIMIT 10;


-- 4. Verificar CNPJs únicos
SELECT 
    COUNT(DISTINCT CNPJ) as cnpjs_unicos, 
    COUNT(*) as total_registros 
FROM supplier;

-- Verificar CNPJs únicos
SELECT COUNT(DISTINCT CNPJ) as cnpjs_unicos, COUNT(*) as total FROM supplier;

-- Produtos agrupados por categoria
SELECT 
    idProduct,
    Pname as nome_produto,
    category as Categoria,
    classification_kids as É_infantil,
    avaliacao,
    preco,
    Size as Tamanho
FROM product 
ORDER BY category, Pname;

SELECT 'ORDERS' as Tabela, COUNT(*) as Registros FROM orders UNION ALL
SELECT 'PRODUCTORDER', COUNT(*) FROM productOrder;



