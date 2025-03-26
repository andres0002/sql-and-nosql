import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

conn = sqlite3.connect("./SQL/Northwind_DB/Northwind.db")
# Products mas rentables.
query = '''
    select
        ProductName,
        sum(Price * Quantity) as Revenue
    from
        Products p
    join
        OrderDetails as od on p.ProductID = od.ProductID
    group by
        p.ProductID
    order by
        Revenue desc
    limit 10;
'''

top_products = pd.read_sql_query(query, conn)

top_products.plot(x="ProductName", y="Revenue", kind="bar", figsize=(10, 5), legend=False)

plt.title("10 Productos más rentables.")
plt.xlabel("Products")
plt.ylabel("Revenue")
plt.xticks(rotation=90)
plt.show()

# Employees mas efectivos.
query2 = '''
    select
        FirstName || " " || LastName as EmployeeFullName,
        count(*) as Total
    from
        Employees as e
    join
        Orders as o on e.EmployeeID = o.EmployeeID
    group by
        e.EmployeeID
    order by
        Total desc
    limit 10
'''

top_employees = pd.read_sql_query(query2, conn)

top_employees.plot(x="EmployeeFullName", y="Total", kind="bar", figsize=(10, 5), legend=False)

plt.title("10 Empleados más efectivos.")
plt.xlabel("Employees")
plt.ylabel("Total")
plt.xticks(rotation=45)
plt.show()

# print(top_products)