import sqlite3
import pandas as pd

square = lambda n : n**2
# print(f"Square 1: {square(2)}")

# Start Primera forma:------------------------------------------------------------------------------------------
# conn = sqlite3.connect("C:/developer/fundamentos/backend/SQL-AND-NOSQL/SQL/Northwind_DB/Northwind.db")
# conn = sqlite3.connect("./SQL/Northwind_DB/Northwind.db")
# conn.create_function("square", 1, square)

# cursor = conn.cursor()

# # Por defecto el anfitrión en este caso python open la transacción
# cursor.execute(
#     '''
#         SELECT * FROM Products limit 3;
#     '''
# )

# # fetchall() -> Devuelve una lista con cada uno de los registros.
# results = cursor.fetchall()
# result_df = pd.DataFrame(results)

# conn.commit()

# # Liberar recursos
# cursor.close()
# conn.close()

# print(result_df)
# End Primera forma:--------------------------------------------------

# Start Segunda forma:--------------------------------------------------
with sqlite3.connect("./SQL/Northwind_DB/Northwind.db") as conn: # con el with la connection se cierra automaticamente.
    conn.create_function("square", 1, square)
    cursor = conn.cursor()
    cursor.execute('select *, square(Price) from Products limit 3;')
    results = cursor.fetchall()
    results_df = pd.DataFrame(results)

    conn.commit()
    cursor.close()

print(results_df)
# End Segunda forma:--------------------------------------------------