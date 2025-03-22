/*
// Sirve para consultar todos los registros de la table users.
select * from users;
// Sirve para mostrar determinados campos de la table users.
select name, lastname, age from users;
// Sirve para insertar data en una table, en este caso la table users.
insert into users (name, lastname, age)
values ('Andres', 'Ramirez', 25),
	   ('Pepe', 'Perez', 20),
	   ('Andres', 'Jimenez', 25),
	   ('William', 'Jimenez', 25),
	   ('William', 'Ramirez', 25);
// Sirve para eliminar todos los registros de la table users.
delete from users;
// Sirve para insertar data en una table, en este caso la table turnos_medicos.
insert into turnos_medicos (id_users, profesional, motivo, horario)
values (2, 'Dr. Ramirez', 'Dolor de cabeza', '01:30 pm');
*/
select * from turnos_medicos;