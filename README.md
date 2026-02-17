# Big-Data-Anlisis-del-Gasto-Publico-del-Ministerio-de-Economa-y-Finanzas-MEF.

# Análisis del Gasto Público del MEF - Proyecto Big Data 🚀

Este proyecto implementa una arquitectura de Big Data para el procesamiento, limpieza y análisis masivo de los datos de la **Clasificación Funcional del Gasto** del Ministerio de Economía y Finanzas (MEF) de Perú.

La solución utiliza el ecosistema **Hadoop** para transformar datos crudos en información estructurada lista para la toma de decisiones.

## 📋 Tabla de Contenidos
- [Descripción del Proyecto](#descripción-del-proyecto)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Arquitectura de la Solución](#arquitectura-de-la-solución)
- [Estructura del Repositorio](#estructura-del-repositorio)
- [Instalación y Configuración](#instalación-y-configuración)
- [Resultados](#resultados)
- [Autores](#autores)

## 📖 Descripción del Proyecto
El análisis manual de los gastos públicos presenta un desafío debido al volumen de datos (más de 300,000 registros por periodo). Este proyecto automatiza el ciclo de vida del dato:
1. **Ingesta**: Descarga desde el portal de Datos Abiertos del MEF.
2. **ETL**: Limpieza y normalización de pliegos y departamentos mediante **Apache Pig**.
3. **Procesamiento**: Agregación de datos financieros mediante **MapReduce**.
4. **Análisis SQL**: Persistencia y consulta en **Apache Hive**.

## 🛠️ Tecnologías Utilizadas
* **Hadoop 2.7.7**: Framework de almacenamiento y procesamiento distribuido.
* **Apache Pig 0.17.0**: Procesamiento ETL de flujos de datos masivos.
* **Apache Hive 1.2.2**: Data warehousing y consultas tipo SQL (HiveQL).
* **Python 3**: Scripts de automatización y manejo de librerías Pandas/Openpyxl.
* **Google Colab**: Entorno de ejecución simulado.

## 🏗️ Arquitectura de la Solución
El flujo de datos sigue el siguiente orden:
1. **Limpieza con Pig**: Se eliminan caracteres especiales (comillas) y se normalizan los nombres de las regiones utilizando el comando `REPLACE`.
2. **Transformación**: Conversión de montos (PIM y Ejecutado) a formato decimal (`double`) para precisión financiera.
3. **Agregación**: Uso de scripts `mapper.py` y `reducer.py` para calcular totales por Año y Pliego.
4. **Exportación**: Generación de un archivo maestro en Excel para visualización en tableros de control (BI).

## 📂 Estructura del Repositorio
* `GDN_final.ipynb`: Notebook principal con todo el flujo de ejecución.
* `GDM_documentacion.docx`: Documentación técnica detallada y objetivos.
* `etl_Gasto.pig`: Script de Pig Latin con la lógica de transformación.
* `mapper.py / reducer.py`: Scripts para el proceso de MapReduce.

## 👤 Autor
Desarrollado como proyecto de portafolio para Ciencia de Datos.
*Herramientas de apoyo: Este proyecto contó con la asistencia técnica de Gemini (IA) para la optimización de código.
