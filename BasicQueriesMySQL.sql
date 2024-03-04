create database Users;

use Users;

create table DatosUser(
Id int auto_increment primary key ,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Edad int not null
);

CREATE TABLE Pedidos (
    Pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    Producto VARCHAR(50) NOT NULL,
    User_id  INT not null,
    FOREIGN KEY (User_id) REFERENCES DatosUser(Id)
);

drop table DatosUser;

insert into Pedidos(Producto,User_id) values('Papas',3);
insert into Pedidos(Producto,User_id) values('Pollo',4);
insert into Pedidos(Producto,User_id) values('Frutas',1);

insert into DatosUser(Nombre,Apellido,Edad) values('Maria','Ruiz',28);
insert into DatosUser(Nombre,Apellido,Edad) values('Miguel','Sanchez',26);


select * from DatosUser;
select * from DatosUser where Edad =21;
update DatosUser set Nombre='uli',Apellido='Lopez',Edad=25 where Id=4 ;

select * from DatosUser where Edad<30 group by Nombre;
select Nombre, SUM(Edad) as Total from DatosUser where Edad<30 group by Nombre; /* Aqui agregamos un agrupacion*/

delete from DatosUser where Id=2;  

select DatosUser.Nombre,DatosUser.Apellido,Pedidos.Producto from Pedidos
 join DatosUser on DatosUser.Id=Pedidos.User_id group by Pedidos.Producto order by Pedidos.Producto;


select DatosUser.Nombre,DatosUser.Apellido,Pedidos.Producto from Pedidos
 join DatosUser on DatosUser.Id=Pedidos.User_id order by Pedidos.Producto;

select * from DatosUser order by Edad desc;

select count(*)  as TotalUsers from DatosUser;

select Nombre from DatosUser where Edad between 29 and 31;

select Nombre from DatosUser where Nombre like '%u%';

select DatosUser.Nombre, count(Pedidos.Producto) as TotalFrutas  from Pedidos  join DatosUser on Pedidos.User_id=DatosUser.Id  group by DatosUser.Nombre order by TotalFrutas desc
