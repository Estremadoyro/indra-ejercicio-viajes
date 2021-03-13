DROP TABLE IF EXISTS ejercicio1.fecha;
DROP TABLE IF EXISTS ejercicio1.paises;
DROP TABLE IF EXISTS ejercicio1.vuelos;
DROP TABLE IF EXISTS ejercicio1.retrasos;

CREATE TABLE IF NOT EXISTS ejercicio1.fecha (vuelo int, dia int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' WITH SERDEPROPERTIES ("field.delim"="_","line.delim" = '\n');

CREATE TABLE IF NOT EXISTS ejercicio1.paises (COD_pais string, pais string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' WITH SERDEPROPERTIES ('field.delim'='\073',"line.delim" = '\n');

CREATE TABLE IF NOT EXISTS ejercicio1.vuelos (vuelo int, origen string, destino string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' WITH SERDEPROPERTIES ("field.delim"="|","line.delim" = '\n');

CREATE TABLE IF NOT EXISTS ejercicio1.retrasos (vuelo string, retraso string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe' WITH SERDEPROPERTIES ("input.regex"="(^.{4})(.{2}$)");
