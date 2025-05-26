# Assingnment-2 - PostgreSQL

Welcome to - **Wildlife Conservation Monitoring Assignment**

### 🌿 The Ranger and the Rare Animal

## 📂 Bonus Section

### 1. What is PostgreSQL?

**Ans:** **PostgreSQL** হল একটি উন্নত, ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি একটি শক্তিশালী ডাটাবেস সিস্টেম যা বড় অ্যাপ্লিকেশনের জন্য একটি স্কেলেবল সমাধান প্রদান করে।

এখন এটি বিশ্বের সবচেয়ে সম্মানিত এবং বহুল ব্যবহৃত ডাটাবেসগুলির মধ্যে একটিতে পরিণত হয়েছে, বিশেষ করে এমন পরিবেশে যেখানে ডেটা অখণ্ডতা, জটিল প্রশ্ন এবং কাস্টম কার্যকারিতা অত্যন্ত গুরুত্বপূর্ণ।

**PostgreSQL** বিভিন্ন ধরণের ডেটা টাইপ সমর্থন করে, যার মধ্যে রয়েছে `primitive` টাইপ (`INTEGER`, `TEXT`, `BOOLEAN`), `Structured` টাইপ (`Arrays`, `JSON`, `XML`), এবং `Custom user-defined` টাইপ।

PostgreSQL এর সবচেয়ে শক্তিশালী বৈশিষ্ট্যগুলির মধ্যে একটি হল এর `Extensibility`. ডেভেলপাররা তাদের নিজস্ব `Functions`, `Operators`, `Data Type` এবং এমনকি `Custom Index` টাইপ তৈরি করতে পারে, যা এটিকে অত্যন্ত নির্দিষ্ট ব্যবহারের ক্ষেত্রে উপযুক্ত করে তোলে।

`PostgreSQL` সম্পূর্ণ সমর্থন প্রদান করে `SQL` স্ট্যান্ডার্ডের জন্য এবং এতে `Foreign keys`, `JOIN`, `VIEW`, `Stored procedures`, `Triggers` এর মতো উন্নত বৈশিষ্ট্য অন্তর্ভুক্ত রয়েছে।

অনেক বড় কোম্পানি এবং প্রতিষ্ঠান নির্ভরযোগ্যতা, স্কেলেবিলিটি এবং নমনীয়তার কারণে গুরুত্বপূর্ণ সিস্টেমের জন্য PostgreSQL ব্যবহার করে।

উদাহরণ:  
ধরুন একটি ব্লগ অ্যাপ্লিকেশন তৈরি করছি, এবং একটি PostgreSQL ডাটাবেসে পোস্ট সংরক্ষণ করতে চাই।

Create a Table

```sql
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Insert Data

```sql
INSERT INTO posts (title, content)
VALUES ('Hello World', 'This is my first blog post!');

```

Query Data

```sql
SELECT * FROM posts;

```

### 2. (3)Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Ans:** **PostgreSQL** এ, **Primary Key** হল একটি টেবিলের কলাম বা কলামের একটি গ্রুপ যা প্রতিটি সারিকে স্বতন্ত্রভাবে চিহ্নিত করে। দুটি সারির `Primary Key` কলামে একই মান থাকতে পারে না, `Primary Key` কলামে `NULL` মান থাকতে পারে না এবং প্রতিটি টেবিলে কেবল একটি `Primary Key` থাকতে পারে।  
উদাহরণ:

```sql
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT
);
```

`Foreign key` একটি টেবিলের `Primary Key` বা রেফারেন্স করা টেবিলের একটি `Unique constraint` উল্লেখ করে দুটি টেবিলের ডেটার মধ্যে একটি লিঙ্ক স্থাপন করে। এটি নিশ্চিত করে যে `Foreign key` কলামের মান রেফারেন্স করা `Primary Key` কলামে বিদ্যমান, এখানে হলে NULL মান থাকতে পারে যদি তা অনুমোদিত হয় এবং এটি `Cascade actions` সমর্থন করে।  
উদাহরণ:

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    employee_id INT REFERENCES employees(employee_id)
);
```

এখানে, অর্ডার টেবিলে employee_id হল একটি `Foreign key` যা কর্মচারী টেবিলে employee_id উল্লেখ করে।

### 3. (5)Explain the purpose of the WHERE clause in a SELECT statement.

**Ans:** `WHERE` ধারাটি SQL - এ একটি শক্তিশালী ফিল্টারিং টুল। PostgreSQL-এ, `SELECT` বিবৃতিতে `WHERE` ধারাটি নির্দিষ্ট অবস্থার উপর ভিত্তি করে একটি টেবিল থেকে রেকর্ড ফিল্টার করতে ব্যবহৃত হয়।

`WHERE` ধারার সাহায্যে আমরা নিশ্চিত করতে পারি যে শুধুমাত্র সেইসব নির্দিষ্ট শর্তের সাথে মিল রয়েছে যা ফেরত পাঠানো হয়েছে।
আমরা `Logical operators` (`AND`, `OR`) এবং `Comparisons` যেমন - `(=, <, >, !=,LIKE, BETWEEN)` ইত্যাদি ব্যবহার করতে পারি।  
উদাহরণ:

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

**Ans:** সাধারণত `JOIN` অপারেশন দুইটি বা তার অধিক টেবিলের মধ্যে সম্পর্ক স্থাপন করে এবং নির্দিষ্ট শর্ত পূরণের ভিত্তিতে তাদের তথ্য একত্রিত করে।

PostgreSQL-এ `JOIN` ব্যবহার করে একাধিক টেবিলের মধ্যে ডেটা সংযোগ করার অনুমতি দেয়। কিছু ধরণের `JOIN` আছে - `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, `CROSS JOIN`। আমরা বিভিন্ন ধরণের `JOIN` বোঝার মাধ্যমে আমরা আরও শক্তিশালী কোয়েরি লিখতে পারি।  
উদাহরণ:

```sql
SELECT table1.column1, table2.column2
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;

```

`INNER JOIN` হল সবচেয়ে সাধারণ `JOIN` অপারেশন। এটি দুটি টেবিলের মধ্যে সম্পর্ক স্থাপন করে এবং শুধুমাত্র সেই রেকর্ডগুলো প্রদান করে যেখানে উভয় টেবিলের মধ্যে সম্পর্কিত ডেটা পাওয়া যায়।

```sql
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column_name = table2.column_name;
```

### 5. (10)How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

**Ans:** PostgreSQL-এ, সারির একটি সেট গণনা করতে এবং একটি একক সারাংশ মান প্রদান করতে `Aggregate functions` ব্যবহার করা হয়। `COUNT()` সারির সংখ্যা গণনা করে, SUM() একটি সংখ্যাসূচক কলামের মোট যোগফল গণনা করে এবং AVG() একটি সংখ্যাসূচক কলামের গড় মান গণনা করে।  
উদাহরণ: `COUNT()`

```sql
-- Count total employees
SELECT COUNT(*) FROM employees;

-- Count employees in each department
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;
```

উদাহরণ: SUM()

```sql
-- Sum of all order amounts
SELECT SUM(total_amount) FROM orders;

-- Sum of order amounts per customer
SELECT customer_id, SUM(total_amount)
FROM orders
GROUP BY customer_id;
```

উদাহরণ: AVG()

```sql
-- Average salary of all employees
SELECT AVG(salary) FROM employees;

-- Average order amount per month
SELECT EXTRACT(MONTH FROM order_date) AS month, AVG(total_amount)
FROM orders
GROUP BY month;
```

— Answered by Saidul | GitHub: @shaid85
