-- 1.	Presentar un listado de todos los socios, mostrando el código, nombres, apellidos, en forma alfabética por apellidos y descendente por nombres.

select CodigoSocio,Apellido1Socio,NombresSocio  from Socios order by NombresSocio desc,Apellido1Socio asc

-- 2.	Lista de películas, mostrando el código, nombre y fecha de estreno, ordenado por fecha.
select CodigoPelicula,NombrePelicula,FechaEstreno from Peliculas order by FechaEstreno

--3.	Presentar cuantos socios hay en el club.
select COUNT(*) as Total from Socios

--4.	Indicar el número de películas que el club tiene.

select COUNT(*) as totalPelis from Peliculas

--5. Indicar cual es el id más grande y el más pequeño en la tabla películas.

select MAX(Id) from Peliculas

--6.	Mostrar cuál es el costo de adquisición de películas más alto, el más bajo, el total invertido en las películas y cuantas películas hay registradas.

select MAX(CostoPelicula) AS CostoAdquisicionMaximo
from Peliculas;

-- Costo de adquisición más bajo
select MIN(CostoPelicula) AS CostoAdquisicionMinimo
from Peliculas;

-- Total invertido en películas
select SUM(CostoPelicula) AS TotalInvertido
from Peliculas;

-- Cantidad de películas registradas
select COUNT(*) AS CantidadPeliculasRegistradas
from Peliculas;

--7.	Liste el primer apellido de los socios e indicar cuantos socios hay por cada uno, mostrando de forma descendente el total.
SELECT Apellido1Socio AS PrimerApellido, COUNT(*) AS TotalSocios
FROM Socios
GROUP BY Apellido1Socio
ORDER BY TotalSocios DESC;

--8.	Liste todas las películas que tengan la palabra matar en su nombre o título.
select * from Peliculas where NombrePelicula like '%matar%'

--9.	Liste todos los socios que tengan el apellido1 “Lara”. Además del código, nombres y apellidos 1 y 2.
select CodigoSocio, NombresSocio, Apellido1Socio, Apellido2Socio from Socios where Apellido1Socio='Lara'

--10.	Liste todos los socios cuyo nombre finalice en la letra “a”. Mostrar además el código, nombres y apellidos 1 y 2.

SELECT CodigoSocio, NombresSocio, Apellido1Socio, Apellido2Socio
FROM Socios WHERE RIGHT(NombresSocio, 1) = 'a'

--11.	Listar los socios (código, nombre completo), ordenado por código en forma descendente.
SELECT CodigoSocio, NombresSocio, Apellido1Socio, Apellido2Socio
FROM Socios order by CodigoSocio desc

--12.	Listar todas las películas (código, nombre), que costaron entre 1,000 y 2,500, ordenado descendente por costo.

select CodigoPelicula,NombrePelicula from Peliculas where CostoPelicula between 1000 and 2500 order by CostoPelicula desc

--13.	Listar todas las películas (código, nombre), que se estrenaron en el mes de mayo, ordenar alfabéticamente.

select CodigoPelicula,NombrePelicula from Peliculas where MONTH(FechaEstreno)=5 order by NombrePelicula asc

--14.	Listar los géneros (código, nombre), en los que el valor del Id sea par.

select CodigoGenero,NombreGenero  from Generos where Id % 2=0

--15.	Lista de socios, código, nombres, apellidos y nombre de oficio, ordenado alfabéticamente por socio.

select CodigoSocio,NombresSocio,Apellido1Socio,Apellido2Socio,NombreProfesion from Socios ce
inner join Profesiones Pro on ce.ProfesionId=Pro.Id order by NombresSocio asc

--16.	Lista de películas con su código, nombre y el nombre del genero al que pertenece, ordenado por genero de forma descendente.

select CodigoPelicula,NombrePelicula,NombreGenero from Peliculas peli
inner join Generos gen on peli.GeneroId=gen.Id order by NombreGenero desc

--17.	Listar las películas con su código, nombre y nombre de la clasificación ordenado por clasificación en forma ascendente.

select CodigoPelicula,NombrePelicula,NombreClasificacion from Peliculas peli
inner join Clasificaciones Cls on peli.ClasificacionId=Cls.Id order by NombreClasificacion asc

--18.	Liste todas las profesiones con el número total de socios por profesión.

select  NombreProfesion, COUNT(soc.Id) as TotalSociosPorProfesion from Profesiones pro
inner join Socios soc on pro.Id=soc.ProfesionId  group by NombreProfesion

--19.	Liste las clasificaciones con el número total de películas por clasificación.

SELECT C.NombreClasificacion, COUNT(P.CodigoPelicula) AS TotalPeliculasPorClasificacion
FROM Clasificaciones C
LEFT JOIN Peliculas P ON C.Id = P.ClasificacionId
GROUP BY C.NombreClasificacion;

--20.	Liste todos los géneros de películas con su cantidad total.

SELECT G.NombreGenero, COUNT(P.CodigoPelicula) AS TotalPeliculasPorGenero
FROM Generos G
LEFT JOIN Peliculas P ON G.Id = P.GeneroId
GROUP BY G.NombreGenero;

