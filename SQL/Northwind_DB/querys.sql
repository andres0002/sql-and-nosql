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
-- "where" Sirve para poner condiciones y deacuerdo a la condición muestra data o realiza determinada acción.
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
-- = -> De asignación, para el caso de los "update" con el "set".
-- update Products set ProductName = 'ProductName' where ProductID == 1;
-- < -> Menor que.
-- select * from Products where Price < 100;
-- > -> Mayor que.
-- select * from Products where Price > 10;
-- <= -> Menor igual que.
-- select * from Products where Price <= 40;
-- >= -> Mayor igual que.
-- select * from Products where Price >= 40;
select * from Products where CategoryID != 1;