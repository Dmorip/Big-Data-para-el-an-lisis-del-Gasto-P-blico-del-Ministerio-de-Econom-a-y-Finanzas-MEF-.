
Clasificacion_Gasto_raw= LOAD 'Clasificacion_Funcional_Gasto_mef.csv' USING PigStorage(',') as (
  ano:chararray, mes:chararray, nivel_gob_nom:chararray, nivel:chararray, nivel_nom:chararray,
  pliego:chararray, pliego_nom:chararray, depto_cod:chararray, depto_nom:chararray, prov_cod:chararray,
  prov_nom:chararray, dis_cod:chararray, dis_nom:chararray, serv_cod:chararray, serv_nom:chararray,
  func_cod:chararray,func_nom:chararray,monto_pim:chararray,monto_ejec:chararray
);

--FILTRO-QUITAMOS CABECERA
Gasto_filtro = FILTER Clasificacion_Gasto_raw BY NOT(ano MATCHES '.*ANO.*');

--LIMPIEZA-QUITAMOS LAS COMILLAS A TODO Y PONEMOS LOS VALORES EN NUMEROS A LOS Q LE PERTENECE
Data_Gasto_final= FOREACH Gasto_filtro GENERATE
    REPLACE(ano, '"', '') AS ano,
    REPLACE(mes, '"', '') AS mes,
    REPLACE(nivel_gob_nom, '"', '') AS nivel_gobierno,
    REPLACE(pliego_nom, '"', '') AS pliego,
    REPLACE(depto_nom, '"', '') AS departamento,
    REPLACE(func_nom, '"', '') AS funcion_gasto,
    (double)REPLACE(REPLACE(monto_pim, '"', ''), ',', '') AS pim,
    (double)REPLACE(monto_ejec, '"', '') AS ejecucion;

-- Guardamos la data completa sin agrupar
  STORE Data_Gasto_final INTO 'output_full_data' USING PigStorage(',');

