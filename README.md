# 🛒 Olist E-commerce Data Analysis | End-to-End Project

Proyecto integral de **Análisis de Datos End-to-End** con Python, SQL y Power BI utilizando el dataset público de **Olist**, un marketplace brasileño disponible en [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

El proyecto abarca todo el ciclo de un proyecto de analítica de datos:

> Entender el problema → Extracción y exploración de datos → Limpieza → Transformación → Modelado analítico → Insights accionables → Documentación

---

# 📌 Descripción del problema

Olist es un marketplace que conecta miles de vendedores con clientes de todo Brasil.

El ecosistema de Olist registra información detallada sobre los factores que afectan el crecimiento de la plataforma, como:

- Ventas
- Clientes
- Logística
- Calidad del servicio
- Desempeño de vendedores

La gran cantidad de datos distribuidos en múltiples tablas dificulta obtener una visión integral del negocio y detectar oportunidades de mejora.<br>Sin un análisis estructurado resulta complejo identificar qué categorías impulsan las ventas, qué regiones presentan mayor potencial de crecimiento o cómo influyen los tiempos de entrega en la satisfacción de los clientes. 

---

# 🎯 Solución propuesta

Se plantea el desarrollo de un análisis integral del e-commerce de Olist que permita transformar los datos disponibles en información útil para la toma de decisiones.<br>El proyecto busca identificar patrones de comportamiento, medir indicadores clave de desempeño y generar recomendaciones orientadas a mejorar la operación del negocio.<br>
Para este objetivo se integrarán las siguientes herramientas:

- Python para limpieza y transformación de datos.
- SQL para consultas analíticas.
- Power BI para visualización e indicadores.
- Microsoft Word para documentación del proyecto.

---

# 📊 Hallazgos principales

## 📈 Crecimiento del negocio

- Se observó un crecimiento sostenido de ingresos y pedidos durante 2017.
- La mayor actividad comercial se concentra en el último trimestre del año.

## 🔁 Baja tasa de recompra

- Solo **2,7 %** de los clientes realizó más de una compra.
- El crecimiento del negocio depende principalmente de la adquisición de nuevos clientes.
- Existen oportunidades para implementar estrategias de fidelización.

## 🚚 La logística impacta directamente en la satisfacción

- Las entregas puntuales mantienen una valoración promedio cercana a **4 ⭐**.
- Cuando se superan **5 días** de atraso en las entregas, la valoración promedio cae por debajo de **2 ⭐**.
- La puntualidad de las entregas aparece como uno de los principales factores relacionados a la experiencia del cliente.

## 🗺️ Concentración geográfica

- São Paulo concentra aproximadamente el **38 %** de la facturación y aproximadamente el **42 %** de los clientes.
- Esto representa una fortaleza comercial, pero también una fuerte dependencia de un único mercado regional.

## 💳 Métodos de pago

- La tarjeta de crédito representa aproximadamente el **74 %** de las transacciones.
- Existe una alta preferencia para este método de pago.

---

# 🚀 Cómo ejecutar el proyecto

1. Clonar el repositorio.

```bash
git clone https://github.com/carpiojak/Analisis-Olist-E-Commerce.git
```
O descargué el repositorio completo.

2. Descomprima los archivos **data_raw.zip** y **data_processed.zip**.

3. Siga las instrucciones del notebook de limpieza, transformación y exportación de datos **data_processing.ipynb** para poder ejecutarlo.

4. En caso de haber decidido exportar los df a una base de datos, puede ejecutar las querys de las carpetas MySQl o PostgreSQL, según corresponda.

5. Abrir el archivo `.pbix` para explorar el dashboard interactivo.

**Nota**: El archivo **olist_dashboard** ya contiene los df procesados, por lo que no es necesario volver a importarlos en ese archivo.

---

# 📂 Estructura del proyecto

```text
Analisis-Olist-E-Commerce/
│
├── data_raw.zip/
│   ├──olist_customers_dataset.csv
│   ├──olist_order_items_dataset.csv
│   ├──olist_order_payments_dataset.csv
│   ├──olist_order_reviews_dataset.csv
│   ├──olist_orders_dataset.csv
│   ├──olist_products_dataset.csv
│   ├──olist_sellers_dataset.csv
│   └──product_category_name_translation.csv
│
├── data_processed.zip/
│   ├──customers.csv
│   ├──order_items.csv
│   ├──order_payments.csv
│   ├──order_reviews.csv
│   ├──orders.csv
│   ├──products.csv
│   └──sellers.csv
│
├── MySQL/
│   ├──comercial_consult.sql
│   ├──created_tables.sql
│   ├──finances_consult.sql
│   ├──logistic_consult.sql
│   ├──quality_consult.sql
│   └──views.sql
│
├── PostgreSQL/
│   ├──comercial_consult.sql
│   ├──created_tables.sql
│   ├──finances_consult.sql
│   ├──logistic_consult.sql
│   ├──quality_consult.sql
│   └──views.sql
│
├── Analisis de datos Olist.pdf
│
├── data_processing.ipynb
│
├── olist_dashboard.pbix
│
├──PPT Analisis de datos Olist.pptx
│
├── README.md
│
└── requirements.txt
```
**Nota:** La documentación detallada del proyecto se puede ver en el archivo **Analisis de datos Olist.pdf**

---

# 🛠️ Herramientas utilizadas

- Python
  - Pandas
  - NumPy
  - Matplotlib
  - Seaborn

- SQL
  - MySQL
  - PostgreSQL

- Excel

- Power BI

- Visual Studio Code

- Git & GitHub

---

# 🔬 Metodología

El proyecto fue desarrollado siguiendo un flujo completo de análisis de datos:

1. Comprensión del dataset.
2. Exploración de datos (EDA).
3. Limpieza y transformación.
4. Validación de la calidad de los datos.
5. Modelado relacional en SQL.
6. Desarrollo de consultas analíticas.
7. Construcción del modelo semántico.
8. Desarrollo del dashboard en Power BI.
9. Obtención de insights y recomendaciones de negocio.

---

# 📖 Conclusiones y aprendizajes

Obtuvimos las siguientes conclusiones en base a los datos:
- **Baja fidelización**: Olist presenta un crecimiento sostenido en ventas, pero una tasa de recompra de solo 2,7 %, lo que indica una fuerte dependencia de nuevos clientes. Fortalecer la retención mediante programas de fidelización y campañas de email marketing poco invasivas representa una oportunidad de crecimiento.
- **La logística impacta directamente en la satisfacción**: Las entregas puntuales mantienen valoraciones cercanas a **4 ⭐**, mientras que retrasos superiores a cinco días reducen las reseñas por debajo de **2 ⭐**. Además, los estados con mayores tasas de demora registran peores calificaciones, confirmando una relación inversa entre desempeño logístico y satisfacción del cliente.
- **Alta concentración geográfica**: São Paulo genera más de un tercio de la facturación, lo que lo convierte en el principal mercado de Olist, pero también en un factor de dependencia. Estados del Norte y Nordeste muestran potencial para expandir la presencia comercial.
- **Oportunidades de mejora con vendedores clave**: Analizar las reseñas por vendedor permite identificar socios de alto volumen con bajas calificaciones y priorizar acciones para mejorar la calidad del servicio, aumentando la satisfacción del cliente y fortaleciendo la confianza en la plataforma.

Este proyecto permitió aplicar un flujo completo de trabajo de un Data Analyst, desde el planteamiento del problema hasta la comunicación de resultados.

Entre los principales aprendizajes destacan:

- Diseño de procesos de limpieza y validación de datos.
- Modelado de bases de datos relacionales.
- Desarrollo de consultas SQL orientadas al negocio.
- Construcción de dashboards interactivos en Power BI.
- Interpretación de resultados y generación de recomendaciones basadas en datos.

---

# 📬 Contacto

**Jack Carpio**

- 💼 LinkedIn: [Jack Carpio](https://www.linkedin.com/in/jack-carpio-536325337)
- 📧 Email: *carpiojak@gmail.com*

---

# ⭐ Valoración

Si este proyecto te resultó interesante o útil, no olvides darle una **⭐ al repositorio**.

# Gracias!
