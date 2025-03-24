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
select * from Employees as e join Orders as o on e.EmployeeID = o.EmployeeID;
-- - left join -> .
-- - right join -> .
-- - full join -> .
-- - cross join -> Devuelve todas las posibilidades entre los registros de cada table, sin el "where".
-- select * from Employees as e, Orders as o;
-- select * from Employees as e cross join Orders o;