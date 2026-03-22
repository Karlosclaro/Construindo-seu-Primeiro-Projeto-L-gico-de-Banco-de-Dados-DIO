# Construindo-seu-Primeiro-Projeto-L-gico-de-Banco-de-Dados-DIO
BD em MySql de teste

🛒 E-Commerce Database - Modelagem Relacional Completa
[
[
[

📋 Descrição do Projeto
Modelagem lógica completa de um banco de dados E-Commerce brasileiro com suporte a:

✅ Clientes PF/PJ (CHECK constraints)

✅ Relacionamentos N:N (Modelo EER)

✅ 100+ fornecedores fictícios

✅ Controle de estoque multi-local

✅ Rastreamento de entregas

✅ Múltiplas formas de pagamento

✅ Queries analíticas complexas

🏗️ Estrutura do Banco (13 Tabelas)
text
ecomerce (7.5+ GB potencial)
├── clients (14 registros)           # PF/PJ
├── product (25 registros)          # Produtos
├── orders (5 registros)            # Pedidos
├── seller (4 registros)            # Vendedores
├── supplier (100 registros)        # Fornecedores
├── productStorage (3 registros)    # Estoque
├── paymentMethods (0 registros)    # Formas de pagamento
├── productSeller (N:N)             # Produto-Vendedor
├── productOrder (N:N)              # Pedido-Produto  
├── storageLocation (N:N)           # Produto-Armazém
├── productSupplier (50 registros)  # Produto-Fornecedor
└── (Constraints FK/PK/UNIQUE)
🔗 Diagrama EER (Engenharia Reversa)
text
erDiagram
    clients ||--o{ orders : "realiza"
    product ||--o{ productSeller : "vende"
    product ||--o{ productOrder : "contém"
    product ||--o{ storageLocation : "estocado_em"
    product ||--o{ productSupplier : "fornecido_por"
    seller ||--o{ productSeller : "vende"
    supplier ||--o{ productSupplier : "fornece"
    orders ||--o{ productOrder : "itens"
    productStorage ||--o{ storageLocation : "localiza"
    
    clients {
        int idClient PK
        varchar Fname
        varchar Minit
        varchar Lname
        char(14) CPF
        char(18) CNPJ
        enum clientType "PF,PJ"
    }
    
    product {
        int idProduct PK
        varchar Pname
        enum category
        decimal preco
        decimal avaliacao
    }
📊 Constraints Implementadas
Tabela	Constraint	Descrição
clients	chk_client_type	PF=CPF OU PJ=CNPJ
seller	chk_seller_type	PF=CPF OU PJ=CNPJ
product	CHECK(preco>0)	Preço positivo
productOrder	CHECK(poQuantity>0)	Quantidade > 0
🚀 Funcionalidades Completas
text
✅ Criação do schema (13 tabelas)
✅ 140+ registros fictícios realistas
✅ PF/PJ validation (CHECK constraints)
✅ Relacionamentos N:N (EER)
✅ 100 fornecedores categorizados
✅ 50 fornecedor-produto relacionados
✅ Pedidos com rastreamento
✅ Estoque multi-armazém
✅ Queries analíticas (JOIN/GROUP/HAVING)
📈 Queries Analíticas Incluídas
Pedidos por cliente (LEFT JOIN + GROUP BY)

Vendedor = Fornecedor? (CNPJ comparison)

Estoque x Fornecimento (Multiple JOINs + CASE)

Fornecedores x Produtos (GROUP_CONCAT)

Produtos mais vendidos (SUM/AVG)

🗄️ Estrutura de Arquivos
text
ecommerce-db/
├── README.md                    # 📄 Este documento
├── 01_create_schema.sql         # 🏗️ Criação das tabelas
├── 02_insert_data.sql          # 📦 Dados fictícios
├── 03_queries_analiticas.sql   # 📊 Queries complexas
├── 04_verificacoes.sql         # ✅ Validações
└── diagram_eer.png             # 🔗 Diagrama visual
💾 Dados Populando (Resumo)
Tabela	Registros	Observação
clients	14	7 PF + 7 PJ
product	25	5 categorias
supplier	100	4 setores
orders	5	3 status
productSupplier	50	Relacionamentos
🔧 Como Usar
bash
# 1. Criar banco
mysql -u root -p < 01_create_schema.sql

# 2. Popular dados
mysql -u root -p ecomerce < 02_insert_data.sql

# 3. Executar análises
mysql -u root -p ecomerce < 03_queries_analiticas.sql
🎯 Queries de Demonstração
sql
-- Top clientes por pedidos
SELECT cliente, total_pedidos FROM (
    SELECT CONCAT(c.Fname,' ',c.Lname) cliente, COUNT(*) total_pedidos
    FROM clients c JOIN orders o ON c.idClient=o.idOrderClient
    GROUP BY c.idClient
) t ORDER BY total_pedidos DESC;

-- Fornecedores mais ativos
SELECT sup.SocialName, COUNT(p.Pname) produtos
FROM supplier sup JOIN productSupplier ps ON sup.idSupplier=ps.idPsSupplier
JOIN product p ON ps.idPsProduct=p.idProduct
GROUP BY sup.idSupplier ORDER BY produtos DESC LIMIT 5;
📈 Métricas do Banco
text
📊 ESTATÍSTICAS FINAIS:
├── Tabelas: 13
├── Registros: 140+
├── Relacionamentos: 50+
├── Constraints: 12 (FK/PK/CHECK)
├── Queries complexas: 15+
└── CNPJs únicos: 100%
🔮 Próximos Passos Sugeridos
 API REST (Node.js/Express)

 Dashboard (Power BI/Tableau)

 Triggers (auditoria)

 Views (relatórios)

 Stored Procedures (business logic)

 Índices (performance)

 <img width="794" height="1123" alt="image" src="https://github.com/user-attachments/assets/205bcc1a-f0c3-4bac-83fd-d1172f13e1a4" />


📫 Contato
Karlos Claro - Goiânia/GO
Preparando para Concursos Públicos
Especialização: Modelagem de Dados + SQL

<div align="center"> <strong>Projeto desenvolvido para portfólio técnico</strong><br> <em>Março 2026 - MySQL 8.4</em> </div>
💡 Dica: Importe o schema no MySQL Workbench → Database → Reverse Engineer para visualização gráfica completa!

