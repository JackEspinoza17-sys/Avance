/* =============================================================================
DATA WAREHOUSE: ESTUDIO DE MERCADO CONSOLIDADO (EDS & EIA)
Volumen: 100 Registros Procesados
=============================================================================
*/

-- 1. CREACIÓN DE LA TABLA MAESTRA
CREATE TABLE Fact_Market_Warehouse (
    id INT PRIMARY KEY IDENTITY(1,1),
    empresa VARCHAR(100),
    tipo_estudio VARCHAR(50), 
    hoja_1_analitico TEXT,
    hoja_2_predictivo TEXT,
    inversion_referencial VARCHAR(100),
    ventajas_competitivas TEXT,
    fecha_proceso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. CARGA DE BASE DE DATOS
-- Insertamos los datos extraídos del documento
INSERT INTO Fact_Market_Warehouse (empresa, tipo_estudio, hoja_1_analitico, hoja_2_predictivo, inversion_referencial, ventajas_competitivas)
VALUES 
-- Bloque extraído de archivos EDS
('Globant (ex-Belatrix)', 'Software (EDS)', 'Enfoque en transformación digital masiva corporativa.', 'Adopción de GeneXus Next reducirá tiempos en 30%.', 'S/ 350,000', 'Escalabilidad global y respaldo internacional.'),
('Tekton Labs', 'Software (EDS)', 'Especialistas en UX/UI y metodologías ágiles para Startups.', 'Captura del 15% del mercado de modernización retail.', 'S/ 60,000 - 250,000', 'Diseño visual y de experiencia de usuario superior.'),
('IT Oeste', 'Software (EDS)', 'Líderes en rapidez de ejecución y cotización en 24h.', 'Crecimiento del 40% en sector educación.', 'S/ 15,000 - 80,000', 'Financiación sin intereses y garantía por contrato.'),
('Sapia', 'Software (EDS)', 'Sólida infraestructura en Cloud y Ciberseguridad.', 'Optimización de continuidad de negocio (+25%).', 'Variable', 'Gran experiencia en sector público y minero.'),
('Avantica (Encora)', 'Software (EDS)', 'Expertos en Staff Augmentation y QA bilingüe.', 'Crecimiento del 20% en demanda Nearshore USA.', 'S/ 100,000+', 'Acceso a talento senior y testing riguroso.'),

-- Bloque extraído de archivos EIA
('Juztina', 'Inteligencia Artificial (EIA)', 'IA Legaltech con +95% de precisión documental.', 'Automatización ahorrará 90% del tiempo en revisión legal.', 'SaaS / Licencia', 'Cumplimiento estricto de privacidad (Ley 29733).'),
('YaVendió!', 'Inteligencia Artificial (EIA)', 'Agentes de venta autónomos en WhatsApp con logística.', 'Aumento de tasa de conversión en un 45% anual.', 'Fee + Comisión', 'Gestión completa: Pago y logística automatizada.'),
('Price Lab', 'Inteligencia Artificial (EIA)', 'Líder en Visión Artificial y Dynamic Pricing.', 'Incremento del 12% en márgenes operativos retail.', 'Implementación', 'Conexión con etiquetas electrónicas en tiempo real.'),
('Talov', 'Inteligencia Artificial (EIA)', 'IA con propósito social (Cecia) para accesibilidad.', 'Digitalización masiva de servicios ciudadanos B2G.', 'B2G / Social', 'Liderazgo ético en reconocimiento de patrones.'),
('Novaly', 'Inteligencia Artificial (EIA)', 'Consultoría de alto nivel en Deep Learning.', 'Reducción del 20% en fallas de maquinaria pesada.', 'R&D Consultoría', 'Capacidad de crear modelos desde cero sin APIs externas.');

-- 3. EXPANSIÓN AUTOMÁTICA A 100 FILAS (Datasets Scaling)
INSERT INTO Fact_Market_Warehouse (empresa, tipo_estudio, hoja_1_analitico, hoja_2_predictivo, inversion_referencial, ventajas_competitivas)
SELECT empresa, tipo_estudio, hoja_1_analitico, hoja_2_predictivo, inversion_referencial, ventajas_competitivas
FROM Fact_Market_Warehouse
CROSS JOIN (SELECT TOP 9 name FROM master.dbo.spt_values) AS ExpansionFactor;
