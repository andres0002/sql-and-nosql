-- "as" Sirve para dar alias.
-- select LastName as apellido, FirstName as nombre from Employees;
-- "order by" Sirve para ordenar, se puede ordenar de froma "asc" o de froma "desc".
-- Jerarquia para ordenar:
-- 1. null. Menor valor.
-- 2. numeros.
-- 3. caracteres especiales.
-- 4. letras. Mayor valor.
-- select * from Products order by Price DESC;
-- "nulls first" Sirve para poner los nulls al inicio.
-- select * from Products order by Price DESC nulls first;
-- "nulls last" Sirve para poner los nulls al final.
-- select * from Products order by Price DESC nulls last;
-- "random()" Sirve para ordenar de forma aleatoria.
-- select * from Products order by random();
-- "distinct" Sirve para mostrar valores sin repetir.
-- select distinct ProductName from Products;
-- "where" Sirve para poner condiciones y deacuerdo a la condición muestra data o realiza determinada acción, para filtrar registros.
-- select * from Products where ProductID == 14;
-- "update" Sirve para hacer cambios en los registros de las tables.
-- update users set lastname = 'Perez' where id_users == 2;
-- "set" Sirve para indicar que campos se van a modificar.
-- update users set lastname = 'Perez' where id_users == 2;
/*
-- "delete" Sirve para eliminar registros de la table pero tener encuenta que se debe especificar
-- la condición correcta para eliminar el registro que debe ser con la clausula "where", sino se
-- especifica correctamente con la clausula "where" se pueden eliminar todos los registros de la table.
*/
-- delete from users where id_users == 2;
/*
Comnentarios de mas de una linea.
*/
-- Comentarios de una sola linea.
-- Operadores logicos:
-- * AND -> Se deben cumplir ambas condiciones (true and true).
-- select * from Products where SupplierID == 1 and CategoryID == 1;
-- * OR -> Se debe cumplir por lo menos una de las condiciones (false or true).
-- select * from Products where SupplierID == 1 or CategoryID == 1;
-- * NOT -> Para indicar que no debe ser ese valor (negación).
-- select * from Customers where not Country == "USA";
-- "limit" Sirve para indicar cuantos registros queremos.
-- select * from Products LIMIT 5;
/*
Exercise:
select * from Products
where not CategoryID == 6
and not SupplierID == 1
and Price <= 30
order by random()
limit 3;
*/
-- Operadores de comparación:
-- != -> Diferente de.
-- select * from Products where CategoryID != 1;
-- == -> De igualda.
-- select * from Products where CategoryID == 1;
-- = -> De asignación o de comparación de igualda, para el caso de los "update" con el "set" y de comparación en el caso de los "where".
-- update Products set ProductName = 'ProductName' where ProductID = 1;
-- < -> Menor que.
-- select * from Products where Price < 100;
-- > -> Mayor que.
-- select * from Products where Price > 10;
-- <= -> Menor igual que.
-- select * from Products where Price <= 40;
-- >= -> Mayor igual que.
-- select * from Products where Price >= 40;
-- "between" Sirve para selecionar data en un rango especifico incluido los datos limites,
-- el valor uno debe ser menor al valor dos.
-- select * from Products where Price between 20 and 40;
-- "like" Sirve para hacer filtros, similar a un igual.
-- select * from Products where ProductName like 'Tofu';
-- "%" Sirve para indicar que busque por el valor que comienza con "value%".
-- select * from Products where ProductName like 'A%';
-- "%" Sirve para indicar que busque por el valor que termina con "%value".
-- select * from Products where ProductName like '%a';
-- "%" Sirve para indicar que busque por el valor que contenga "%value%".
-- select * from Products where ProductName like '%r%';
-- "_" Sirve para hacer referencia a un caracter.
-- Que comiencen con "C" y terminen con "s" y los "_" indican los caracteres en medio.
-- select * from Products where ProductName like 'C___s';
-- Que comiencen con "Cha" y los "_" indican los caracteres al final.
-- select * from Products where ProductName like 'Cha__';
-- Que termina con "ng" y los "_" indican los caracteres al inicio.
-- select * from Products where ProductName like '___ng';
-- El "%" y el "_" se pueden mesclar.
-- select * from Products where ProductName like '%_ng';
-- select * from Products where ProductName like 'Chef_%';
-- select * from Products where ProductName like '%Chef_%';
-- "is null" Sirve para validar si el value es nulo y lo devuelve.
-- select * from Products where ProductName is null;
-- "is not null" Sirve para validar si el value no es nulo y lo devuelve.
-- select * from Products where ProductName is not null;
-- Operador logico "in" es un tipo de "or" pero con tupla,
-- "(campo=value)" "in" "(value, value, value, value, value)".
-- select * from Products where SupplierID in (3, 4, 5, 6);
-- "not in" para negar.
-- select * from Products where SupplierID not in (3, 4, 5, 6);
-- Funciones de agregación:
-- count() -> Sirve para contar la cantidad de values en un campo o columna.
-- select count(ProductName) as cantidad_products from Products;
-- sum() -> Sirve para sumar los valores.
-- select sum(Price) as suma_total from Products;
-- avg() -> Sirve para devolver el promedio.
-- select avg(Price) as promedio from Products;
-- round(value, decimales) -> Sirve para redondear un valor.
-- select round(avg(Price), 2) as redondear_promedio from Products;
-- min() -> Sirve para devolver el valor minimo.
-- select min(Price) as price_minimo from Products;
-- max() -> Sirve para devolver el valor maximo.
-- select max(Price) as price_maximo from Products;
-- "group by" Sirve para agrupar varios registros según el valor de la columna.
-- select SupplierID, round(avg(Price)) from Products group by SupplierID;
-- "having" Sirve para filtrar grupos.
-- select SupplierID, round(avg(Price)) as promedio_price from Products group by SupplierID having promedio_price > 40;
-- Jerarquia de acciones:
-- 1. select ... from ...
-- 2. where ...
-- 3. group by ...
-- 4. having ...
-- 5. order by ...
-- 6. limit ...
-- Subconsultas:
/*
select ProductID,
	(select ProductName from Products where ProductID == od.ProductID) as ProductName,
	(select Price from Products where ProductID == od.ProductID) as Price,
	Quantity 
from OrderDetails as od;
*/
/*
select 
	ProductID,
	(select ProductName from Products where ProductID = od.ProductID) as ProductName,
	sum(Quantity) as total_vendido,
	(select Price from Products where ProductID = od.ProductID) as Price,
	round((sum(Quantity) * (select Price from Products where ProductID = od.ProductID))) as total_recaudado
from OrderDetails as od
where Price > 40
group by ProductID
order by total_recaudado desc;
*/
-- Exercise SubQuery
/*
select
	FirstName,
	LastName,
	(
		select 
			sum(od.Quantity)
		from 
			Orders as o,
			OrderDetails as od
		where 
			o.EmployeeID = e.EmployeeID and o.OrderID = od.OrderID
	) as unidades_totales_vendidas
from
	Employees as e
where 
	unidades_totales_vendidas >
	(
		select
			avg(unidades_totales_vendidas)
		from 
			(
				select
					(
						select 
							sum(od.Quantity)
						from 
							Orders as o,
							OrderDetails as od
						where 
							o.EmployeeID = e2.EmployeeID and o.OrderID = od.OrderID
					) as unidades_totales_vendidas
				from
					Employees e2
				group by
					e2.EmployeeID
			)
	);
*/
-- Joins.
-- Types:
-- - inner join -> Devuelve la coincidencia entre ambas (tables).
-- select * from Employees as e, Orders as o where e.EmployeeID = o.EmployeeID;
-- select * from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID;
-- select * from Employees as e join Orders as o on e.EmployeeID = o.EmployeeID;
-- select * from Employees as e inner join Rewards as r on e.EmployeeID = r.EmployeeID;
-- - left join -> Devuelve todos los datos de la tabla_a mas los que coincidan con la tabla_b y si hay datos en la tabla_a pero en la tabla_b no, se rellenan los datos de la tabla_b con datos nulos.
-- select * from Employees as e left join Rewards as r on e.EmployeeID = r.EmployeeID;
-- - right join -> Devuelve todos los datos de la tabla_b mas los que coincidan con la tabla_a y si hay datos en la tabla_b pero en la tabla_a no, se rellenan los datos de la tabla_a con datos nulos.
-- select * from Employees as e right join Rewards as r on e.EmployeeID = r.EmployeeID;
-- Para el caso en donde el gestor de base de datos no soporte el "right join" se pueden invertir las tables y utilizar el "left join".
-- select * from Rewards as r left join Employees as e on e.EmployeeID = r.EmployeeID;
-- - full join -> Devuelve todos los datos de ambas tablas, incluso si no hay coincidencias entre ellas y si no hay considencia entre ellas los registros sin valor seran nulos.
-- select * from Employees as e full join Rewards as r on e.EmployeeID = r.EmployeeID;
-- Altenativa si el "full join" no sirve en el gestor de base de datos -> union -> Devuelve o une los datos de una consalta (selecet_1) con otra consulta (select_2) en una sola.
-- select * from Employees as e left join Rewards as r on e.EmployeeID = r.EmployeeID
-- union
-- Para el caso en donde el gestor de base de datos no soporte el "right join" se pueden invertir las tables y utilizar el "left join".
-- select * from Employees as e right join Rewards as r on e.EmployeeID = r.EmployeeID;
-- select * from Rewards as r left join Employees as e on e.EmployeeID = r.EmployeeID;
-- - cross join -> Devuelve todas las posibilidades entre los registros de cada table, sin el "where".
-- select * from Employees as e, Orders as o;
-- select * from Employees as e cross join Orders o;
-- union and union all -> Que las consultas (selects) que se trabajen denben tener las mismas columnas con los mismos tipos de datos.
-- union -> Sirve para combinar resultados de dos o mas consultas(selects), elimina duplicados y ordenar los resultados automaticamente por defecto.
/*
select * from Employees as e left join Rewards as r on e.EmployeeID = r.EmployeeID
union
-- Para el caso en donde el gestor de base de datos no soporte el "right join" se pueden invertir las tables y utilizar el "left join".
-- select * from Employees as e right join Rewards as r on e.EmployeeID = r.EmployeeID;
select * from Rewards as r left join Employees as e on e.EmployeeID = r.EmployeeID;
*/
-- union all -> Sirve para combinar resultados de dos o mas consultas(selects), incluye duplicados.
/*
select * from Employees as e left join Rewards as r on e.EmployeeID = r.EmployeeID
union all
-- Para el caso en donde el gestor de base de datos no soporte el "right join" se pueden invertir las tables y utilizar el "left join".
-- select * from Employees as e right join Rewards as r on e.EmployeeID = r.EmployeeID;
select * from Rewards as r left join Employees as e on e.EmployeeID = r.EmployeeID;
*/
-- Cardinalidad -> Relación en bases de datos.
-- Types:
-- * Uno a uno (1:1) -> Un registro en una tabla se relaciona exactamente con un registro en entra tabla, example (DNI).
-- * Uno a muchos (1:n) o muchos a uno (n:1) -> Cuando un registro en una table se relaciona con mas de un registro en otra tabla, example (Autores - Libros).
-- * Muchos a muchos (n:m) -> Cuando un registro en una table se relaciona con mas de un registro en otra table y a la inversa, example (Estudiantes - Cursos) en estos casos se suele crear una table intermediaria, example (Inscripciones).
-- Normalización -> .
-- Niveles:
-- * Primera forma normal (1NF) -> Consiste en garantizar que cada atributo en una table contenga un valor unico atomico (que no deben ser conjuntos, listas o cualquier conjunto de estructura de datos compleja).
-- * Segunda forma normal (2NF) -> Consiste en que cada atributo que no sea una clave debe depender completamente de la calve primaria.
-- * Tercera forma normal (3NF) -> Consiste en que cada atributo debe depender directamente de la clave primaria y no de atributos que no son la clave primaria.
-- * Cuarta forma normal (4NF) -> Consiste en intentar evitar la redundancia de datos y las anomalias de actualización.
-- * Quinta forma normal (5NF) -> Consiste en asegurar que no haya dependencias de unión entre los atributos.
-- Cómo aplicar las formas normales:
-- 1. Identificar tablas y atributos.
-- 2. Identificar las claves primarias.
-- 3. Identificar las dependencias funcionales.
-- 4. (1NF).
-- 5. (2NF).
-- 6. (3NF).
-- 7. (4NF).
-- 8. (5NF).
-- Indices -> Sirve para la optimización de consultas.
-- Creación de index.
-- create index idx_products_productname (indica el nombre que se le asigna al index) on Products (table) (ProductName (campo o culumna a la cuan se le asignara el index));
-- create unique index idx_employees_firstname on Employees (FirstName);
-- create unique index idx_employees_firstname_lastname on Employees (FirstName, LastName); -- compuesto.
-- Types:
-- Indices unicos -> Primary Key, indexs con el unique.
-- create unique index idx_employees_firstname on Employees (FirstName);
-- create unique index idx_employees_firstname_lastname on Employees (FirstName, LastName);
-- Indices no unicos -> Indexs sin el unique.
-- create index idx_products_productname on Products (ProductName);
-- Vistas -> Son tablas virtuales, se crea sobre una consulta (select) que se ejecuta sobre una o varias tables, las vistas no necesariamente almacenan datos en si, es una referencia a una consulta (select) que nos devuelve una vista.
-- Sirve para:
-- Trabajar con consultas (selects) mas complejas.
-- Para restringir datos a user que queremos mostrarles vistas.
-- Cómo crear una vista:
/*
create 
	view
		view_products as
			select 
				ProductID,
				ProductName,
				Price
			from 
				Products
			where
				ProductID > 20
			order by
				ProductID desc
*/
-- select * from view_products;
-- Cómo eliminar una view:
-- drop view if exists view_products;
-- Bloqueos y transacciones:
-- Types bloqueos:
-- * Bloqueos compartidos (shared locks) también conocidos como bloqueos de lectura (read locks) - > Consiste en que nadie puede escribir (write) pero pueden leer (read).
-- * Bloqueos reservados (reserved locks) o también conocido como bloqueos de escritura (write) (write locks) -> Consiste en que se puede escribir (write) pero mientras se escribe nadie puede escribir solo pueden leer (read).
-- * Bloqueos exclusivos (exclusive locks) -> Consiste en que cuando se esta escribiendo (write) y no se quiere que la persona pueda escribir (write) ni leer (read).
-- Clausulas que se utilizan para controlar los bloqueos y las transacciones son las siguientes:
-- * begin -> Inicia una nueva transacción.
/*
begin transaction;
update
	Rewards
set
	Reward = 300
where
	RewardID = 6;
-- * rollback -> Sirve para no aceptar el cambio.
-- rollback;
-- * commit -> Sirve para aceptar el cambio.
commit;
*/
-- Procedimientos almacenados -> Es un conjunto de instruciones o comandos que se guardan en la base de datos o server de la BD y que podemos ejecutar en cualquier momento.
/*
Funciones definidas por el user (UDF) - > Es una función que puede ser utilizada por SQLite que esta creada para poder recibir
esa info que puede ser ejecutada en una consulta, sirve para tomar esos valores procesarlos y devolver una salida y ademas
debe cumplir un requisito debe estar registrada en SQLite.
No va a estar creada en SQLite sino que va estar creada en un lenguaje anfitrión en este caso (python).
*/
-- Exercise final (SQL + Python) -> .
-- Diferencias con otros DBMS -> .
