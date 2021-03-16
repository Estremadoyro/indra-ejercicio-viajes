#QUERIES
##Ejercicio 3
SELECT v.Vuelo, v.Origen, v.Destino, r.Retraso 
FROM ejercicio1.vuelos v 
JOIN ejercicio1.retrasos r 
ON (v.vuelo=r.vuelo);

##Ejercicio 4 (A)
SELECT p.Pais, COUNT(v.vuelo) As Salidas 
FROM ejercicio1.vuelos v 
LEFT JOIN ejercicio1.paises p 
ON (v.origen=p.cod_pais) 
GROUP BY p.Pais 
ORDER BY Salidas DESC;

##Ejercicio 4 (B)
SELECT p.Pais, COUNT(v.vuelo) As Llegadas 
FROM ejercicio1.vuelos v 
LEFT JOIN ejercicio1.paises p 
ON (v.destino=p.cod_pais) 
GROUP BY p.Pais 
ORDER BY Llegadas DESC

#SELECTs
##Ejercicio 3
SELECT * from ejercicio1.hd_resumenvuelos;
##Ejercicio 4
SELECT * from ejercicio1.hd_resumenvuelossalidas;
SELECT * from ejercicio1.hd_resumenvuelosllegadas;
SELECT * from ejercicio1.hd_resumendias;
SELECT * from ejercicio1.hd_resumenretrasos;

#DROPs
##Ejercicio 3
DROP TABLE ejercicio1.hd_resumenvuelos;
##Ejercicio 4
DROP TABLE ejercicio1.hd_resumenvuelossalidas;
DROP TABLE ejercicio1.hd_resumenvuelosllegadas;
DROP TABLE ejercicio1.hd_resumendias;
DROP TABLE ejercicio1.hd_resumenretrasos;
