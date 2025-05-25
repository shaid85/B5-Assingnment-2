# Assingnment-2 - PostgreSQL

Welcome to - **Wildlife Conservation Monitoring Assignment**

### 🌿 The Ranger and the Rare Animal

## 📂 Bonus Section

### 1. What is PostgreSQL?

**Ans:** PostgreSQL is an advanced, open-source relational database management system (RDBMS). It's a powerful database system that provides scalable solution for a wide range of applications.  
Now it has grown into one of the most respected and widely used databases in the world, especially in environments where data integrity, complex queries, and custom functionality are critical.  
PostgreSQL supports a wide range of data types, including primitive types (integer, text, boolean), structured types (arrays, JSON, XML), and custom user-defined types.  
One of PostgreSQL’s most powerful features is its extensibility. Developers can create their own functions, operators, data types, and even custom index types, making it suitable for highly specific use cases.  
PostgreSQL also offers full support for SQL standards, and includes advanced features such as foreign keys, joins, views, stored procedures, triggers, and window functions.  
Many major companies and organizations use PostgreSQL for critical systems due to its reliability, scalability, and flexibility.

### 2. (3)Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Ans:** In PostgreSQL, a **Primary Key** is a column or a group of columns in a table that uniquely identifies each row. Two rows can't have the same value in the primary key column(s), primary key columns cannot contain NULL values and each table can have only one primary key.

```sql
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT
);
```

In PostgreSQL, a **Foreign key** establishes a link between data in two tables by referencing the primary key or a unique constraint of the referenced table. It ensures that the value in the foreign key column exists in the referenced primary key column, can have NULL values if allowed and support cascade actions.

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    employee_id INT REFERENCES employees(employee_id)
);
```

Here, employee_id in the orders table is a foreign key that references the employee_id in the employees table.

### 3. (5)Explain the purpose of the WHERE clause in a SELECT statement.

**Ans:** The `WHERE` clause is a powerful filtering tool in SQL. In PostgreSQL, `WHERE` clause in a `SELECT` statement is used to filter records from a table based on specific conditions.  
With `WHERE` clause we can ensuring that only those matching specific conditions are returned.  
We can use with logical operators (AND, OR) and comparisons (=, <, >, !=,LIKE, BETWEEN, etc.). — Answered by Saidul | GitHub: @shaid85  
Example:

```sql
SELECT name, department
FROM employees
WHERE department = 'Sales';

SELECT * FROM orders
WHERE total_amount > 1000;

SELECT * FROM employees
WHERE department = 'IT' AND salary > 50000;
```

### 4. (8)What is the significance of the JOIN operation, and how does it work in PostgreSQL?

**Ans:** Generally in relational databases a `JOIN` operation combining data from multiple tables based on a common relationship.  
In PostgreSQL it allows to connect data across multiple tables using relationships. There has some type of `JOIN` - `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, `CROSS JOIN`. understanding different types of JOINs lets us write more powerful queries.  
Example:

```sql
SELECT table1.column1, table2.column2
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;

```

### 5. (10)How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

**Ans:** In PostgreSQL, aggregate functions are used to calculate a set of rows and return a single summary value. COUNT() calculates the number of rows, SUM() calculates the total sum of a numeric column, and AVG() calculates the average value of a numeric column.
Example: COUNT()

```sql
-- Count total employees
SELECT COUNT(*) FROM employees;

-- Count employees in each department
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;
```

Example: SUM()

```sql
-- Sum of all order amounts
SELECT SUM(total_amount) FROM orders;

-- Sum of order amounts per customer
SELECT customer_id, SUM(total_amount)
FROM orders
GROUP BY customer_id;
```

Example: AVG()

```sql
-- Average salary of all employees
SELECT AVG(salary) FROM employees;

-- Average order amount per month
SELECT EXTRACT(MONTH FROM order_date) AS month, AVG(total_amount)
FROM orders
GROUP BY month;
```

— Answered by Saidul | GitHub: @shaid85
