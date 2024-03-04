-- 1.	Presentar un listado de todos los socios, mostrando el c�digo, nombres, apellidos, en forma alfab�tica por apellidos y descendente por nombres.

select CodigoSocio,Apellido1Socio,NombresSocio  from Socios order by NombresSocio desc,Apellido1Socio asc

-- 2.	Lista de pel�culas, mostrando el c�digo, nombre y fecha de estreno, ordenado por fecha.
select CodigoPelicula,NombrePelicula,FechaEstreno from Peliculas order by FechaEstreno

--3.	Presentar cuantos socios hay en el club.
select COUNT(*) as Total from Socios

--4.	Indicar el n�mero de pel�culas que el club tiene.

select COUNT(*) as totalPelis from Peliculas

--5. Indicar cual es el id m�s grande y el m�s peque�o en la tabla pel�culas.

select MAX(Id) from Peliculas

--6.	Mostrar cu�l es el costo de adquisici�n de pel�culas m�s alto, el m�s bajo, el total invertido en las pel�culas y cuantas pel�culas hay registradas.

select MAX(CostoPelicula) AS CostoAdquisicionMaximo
from Peliculas;

-- Costo de adquisici�n m�s bajo
select MIN(CostoPelicula) AS CostoAdquisicionMinimo
from Peliculas;

-- Total invertido en pel�culas
select SUM(CostoPelicula) AS TotalInvertido
from Peliculas;

-- Cantidad de pel�culas registradas
select COUNT(*) AS CantidadPeliculasRegistradas
from Peliculas;

--7.	Liste el primer apellido de los socios e indicar cuantos socios hay por cada uno, mostrando de forma descendente el total.
SELECT Apellido1Socio AS PrimerApellido, COUNT(*) AS TotalSocios
FROM Socios
GROUP BY Apellido1Socio
ORDER BY TotalSocios DESC;

--8.	Liste todas las pel�culas que tengan la palabra matar en su nombre o t�tulo.
select * from Peliculas where NombrePelicula like '%matar%'

--9.	Liste todos los socios que tengan el apellido1 �Lara�. Adem�s del c�digo, nombres y apellidos 1 y 2.
select CodigoSocio, NombresSocio, Apellido1Socio, Apellido2Socio from Socios where Apellido1Socio='Lara'

--10.	Liste todos los socios cuyo nombre finalice en la letra �a�. Mostrar adem�s el c�digo, nombres y apellidos 1 y 2.

SELECT CodigoSocio, NombresSocio, Apellido1Socio, Apellido2Socio
FROM Socios WHERE RIGHT(NombresSocio, 1) = 'a'

--11.	Listar los socios (c�digo, nombre completo), ordenado por c�digo en forma descendente.
SELECT CodigoSocio, NombresSocio, Apellido1Socio, Apellido2Socio
FROM Socios order by CodigoSocio desc

--12.	Listar todas las pel�culas (c�digo, nombre), que costaron entre 1,000 y 2,500, ordenado descendente por costo.

select CodigoPelicula,NombrePelicula from Peliculas where CostoPelicula between 1000 and 2500 order by CostoPelicula desc

--13.	Listar todas las pel�culas (c�digo, nombre), que se estrenaron en el mes de mayo, ordenar alfab�ticamente.

select CodigoPelicula,NombrePelicula from Peliculas where MONTH(FechaEstreno)=5 order by NombrePelicula asc

--14.	Listar los g�neros (c�digo, nombre), en los que el valor del Id sea par.

select CodigoGenero,NombreGenero  from Generos where Id % 2=0

--15.	Lista de socios, c�digo, nombres, apellidos y nombre de oficio, ordenado alfab�ticamente por socio.

select CodigoSocio,NombresSocio,Apellido1Socio,Apellido2Socio,NombreProfesion from Socios ce
inner join Profesiones Pro on ce.ProfesionId=Pro.Id order by NombresSocio asc

--16.	Lista de pel�culas con su c�digo, nombre y el nombre del genero al que pertenece, ordenado por genero de forma descendente.

select CodigoPelicula,NombrePelicula,NombreGenero from Peliculas peli
inner join Generos gen on peli.GeneroId=gen.Id order by NombreGenero desc

--17.	Listar las pel�culas con su c�digo, nombre y nombre de la clasificaci�n ordenado por clasificaci�n en forma ascendente.

select CodigoPelicula,NombrePelicula,NombreClasificacion from Peliculas peli
inner join Clasificaciones Cls on peli.ClasificacionId=Cls.Id order by NombreClasificacion asc

--18.	Liste todas las profesiones con el n�mero total de socios por profesi�n.

select  NombreProfesion, COUNT(soc.Id) as TotalSociosPorProfesion from Profesiones pro
inner join Socios soc on pro.Id=soc.ProfesionId  group by NombreProfesion

--19.	Liste las clasificaciones con el n�mero total de pel�culas por clasificaci�n.

SELECT C.NombreClasificacion, COUNT(P.CodigoPelicula) AS TotalPeliculasPorClasificacion
FROM Clasificaciones C
LEFT JOIN Peliculas P ON C.Id = P.ClasificacionId
GROUP BY C.NombreClasificacion;

--20.	Liste todos los g�neros de pel�culas con su cantidad total.

SELECT G.NombreGenero, COUNT(P.CodigoPelicula) AS TotalPeliculasPorGenero
FROM Generos G
LEFT JOIN Peliculas P ON G.Id = P.GeneroId
GROUP BY G.NombreGenero;

