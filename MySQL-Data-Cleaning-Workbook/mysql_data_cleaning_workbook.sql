-- ==================================================
-- 🧹 MySQL DATA CLEANING PRACTICE & STORYTELLING WORKBOOK
-- Author: David Morales | Version: 1.0 | Date: May 2026
-- Purpose: Real-world data cleaning, analysis + professional communication
-- Environment: MySQL 9.7.0 LTS | Port: 3307
-- ==================================================

-- 🔍 SECTION 1: MESSY DATABASE SCHEMA
-- Raw, real-world style data with errors, duplicates, wrong formats, missing values

CREATE DATABASE IF NOT EXISTS messy_real_world;
USE messy_real_world;

-- 1. MESSY CUSTOMERS
CREATE TABLE messy_customers (
    id VARCHAR(10),
    full_name VARCHAR(100),
    age VARCHAR(15),
    email VARCHAR(100),
    country VARCHAR(50),
    join_date VARCHAR(20),
    total_purchase VARCHAR(20)
);

INSERT INTO messy_customers VALUES
('1','CARLOS AMADEUS','22','carlos@amadeus.com','MEXICO','05/10/2024','125.50'),
('1','Carlos Amadeus','twenty two','carlos@amadeus.com','mex','2024-05-10','125,50'),
('2','MARIA LOPEZ','','maria@','Mexico City','10-05-24',''),
('3','juan perez','45','juan.perez@empresa.mx','MX','2024/04/15','980.00'),
('4','ANA G.','17','ana@correo.com','United Mexican States','','-'),
('5','LUIS MARTINEZ','999','luis@.com','México','31/02/2024','5000.75'),
('6','sofia hernandez','30','sofia@correo.com','USA','12/03/2023','450.20'),
('7','ROBERTO DIAZ','N/A','roberto@empresa.com','United States','01-01-2024','1200,00'),
('8','Carlos Amadeus','22','carlos@amadeus.com','MEXICO','2024-05-10','125.50');

-- 2. MESSY SALES
CREATE TABLE messy_sales (
    sale_id VARCHAR(10),
    product_name VARCHAR(100),
    quantity VARCHAR(10),
    unit_price VARCHAR(20),
    sale_date VARCHAR(20),
    region VARCHAR(50)
);

INSERT INTO messy_sales VALUES
('S001','Laptop HP','1','15000.00','01/01/2024','CDMX'),
('S002','laptop hp','2','15000,00','2024-01-02','ciudad de mexico'),
('S003','Mouse Logitech','','250.50','03/01/2024','GDL'),
('S004','Keyboard Microsoft','5','450.00','','Guadalajara'),
('S005','Monitor Samsung','2','-','05/01/2024','JALISCO'),
('S006','Laptop Dell','1','22000.50','06-01-2024','MTY'),
('S007','monitor samsung','3','8500.75','2024/01/07','Monterrey'),
('S008','Mouse Logitech','10','250,50','08/01/2024','CDMX');

-- 3. MESSY EMPLOYEES
CREATE TABLE messy_employees (
    emp_id VARCHAR(10),
    name VARCHAR(100),
    department VARCHAR(50),
    salary VARCHAR(20),
    hire_date VARCHAR(20),
    status VARCHAR(20)
);

INSERT INTO messy_employees VALUES
('E001','Garcia, Juan','Sales','15000.00','01/01/2020','Active'),
('E002','Maria Lopez','sales','18000,50','2021-05-10','active'),
('E003','Perez Luis','IT','','15/03/2022','Inactive'),
('E004','Ana Sofia','Information Tech','25000.00','','Active'),
('E005','Diaz Roberto','HR','12000.75','10-10-2023','retired'),
('E006','Hernandez Sofia','Human Resources','13500,00','01/01/2024','Active');

-- 4. MESSY PRODUCTS
CREATE TABLE messy_products (
    prod_id VARCHAR(10),
    name VARCHAR(100),
    category VARCHAR(50),
    stock VARCHAR(10),
    cost VARCHAR(20)
);

INSERT INTO messy_products VALUES
('P001','Laptop HP','Computers','15','12000.00'),
('P002','laptop hp','computer','15','12000,00'),
('P003','Mouse Logitech','Accessories','50','150.50'),
('P004','Keyboard Microsoft','acc','30','300.00'),
('P005','Monitor Samsung','Displays','10','6500.75'),
('P006','monitor samsung','display','10','6500,75');

-- ==================================================
-- 📚 SECTION 2: 20 COMPLETE DRILLS
-- Code + Explanation + Storytelling
-- ==================================================

-- ==============================================
-- DRILL 1: View All Raw Data
-- ==============================================
-- CODE
SELECT * FROM messy_customers;

-- TECHNICAL EXPLANATION
-- SELECT * retrieves every column and row from the table. Used for initial inspection before any work.

-- STORYTELLING NARRATIVE
-- "First, I opened the entire table to see exactly what data we have. It’s like taking all papers out of a folder and spreading them on a table — you inspect everything before organizing or cleaning."

-- KEYWORDS: Retrieve, View, Full dataset, Raw data, Inspection
-- ANALOGY: Opening the whole box to see all contents.

-- ==============================================
-- DRILL 2: Filter — Customers From Mexico
-- ==============================================
-- CODE
SELECT * FROM messy_customers 
WHERE country = 'MEXICO';

-- TECHNICAL EXPLANATION
-- WHERE clause filters rows that meet the exact condition. Returns only matching records.

-- STORYTELLING NARRATIVE
-- "I asked the database: ‘Show me every customer, but keep only those where the country is exactly written as MEXICO — ignore all others.’ Just like picking only red candies from a mixed jar."

-- KEYWORDS: Filter, Condition, Match, Select subset, Criteria
-- ANALOGY: Select only students from your city in a class list.

-- ==============================================
-- DRILL 3: Standardize Country Names
-- ==============================================
-- CODE
UPDATE messy_customers 
SET country = 'MEXICO' 
WHERE country IN ('mex','MX','México','United Mexican States','Mexico City');

-- TECHNICAL EXPLANATION
-- UPDATE modifies values; SET defines new standard value; IN matches multiple variations of the same meaning.

-- STORYTELLING NARRATIVE
-- "The same country was written 6 different ways — impossible to group or analyze. I created one single standard name. Like correcting spelling mistakes so everyone speaks the same language."

-- KEYWORDS: Standardize, Normalize, Unify, Clean, Harmonize, Mapping
-- ANALOGY: Writing "Doctor" instead of "Dr", "Doc", "Doct".

-- ==============================================
-- DRILL 4: Remove Duplicate Records
-- ==============================================
-- CODE
DELETE t1 FROM messy_customers t1
JOIN messy_customers t2
  ON t1.id = t2.id
 AND t1.full_name > t2.full_name;

-- TECHNICAL EXPLANATION
-- Self-join compares rows with same ID; keeps one version, deletes extra copies.

-- STORYTELLING NARRATIVE
-- "We had the same person repeated twice with different formatting. I said: ‘Find records with same ID, keep the first one, delete the copy.’ Like throwing away duplicate pages in a report."

-- KEYWORDS: Duplicate, Unique, Deduplicate, Remove copies, Distinct
-- ANALOGY: Removing repeated photos from an album.

-- ==============================================
-- DRILL 5: Detect Missing / Invalid Values
-- ==============================================
-- CODE
SELECT * FROM messy_customers 
WHERE age = '' OR age IS NULL OR age = 'N/A';

-- TECHNICAL EXPLANATION
-- Checks empty strings, NULL values, or invalid markers. Critical step before calculations.

-- STORYTELLING NARRATIVE
-- "I looked for holes in our data: any field that is blank, says ‘N/A’, or has nothing written. These are dangerous because they break math or grouping later. Like finding empty boxes in an inventory."

-- KEYWORDS: Missing values, Null, Gaps, Incomplete data, Data quality
-- ANALOGY: Finding empty cells in an Excel sheet.

-- ==============================================
-- DRILL 6: Replace Missing / Wrong Data
-- ==============================================
-- CODE
UPDATE messy_customers 
SET age = '0' 
WHERE age = '' OR age IS NULL OR age = 'N/A' OR age = 'twenty two';

-- TECHNICAL EXPLANATION
-- UPDATE replaces bad entries with a safe default value to prevent errors.

-- STORYTELLING NARRATIVE
-- "Empty or written-out ages are useless. I filled them temporarily with 0 so nothing crashes — we can update later if we find real data. Like writing ‘unknown’ instead of leaving a blank."

-- KEYWORDS: Impute, Fill gaps, Replace, Default value, Data repair
-- ANALOGY: Writing "?" instead of leaving an answer blank.

-- ==============================================
-- DRILL 7: Convert Text → Real Date
-- ==============================================
-- CODE
ALTER TABLE messy_customers ADD COLUMN join_date_clean DATE;

UPDATE messy_customers 
SET join_date_clean = STR_TO_DATE(join_date, '%d/%m/%Y') 
WHERE join_date LIKE '%/%/%';

UPDATE messy_customers 
SET join_date_clean = STR_TO_DATE(join_date, '%Y-%m-%d') 
WHERE join_date LIKE '%-%-%';

-- TECHNICAL EXPLANATION
-- STR_TO_DATE translates messy text formats into standard DATE type; new column preserves original data.

-- STORYTELLING NARRATIVE
-- "Dates were written in 3 different styles — impossible to sort or calculate. I created a new clean column and translated every format into one standard date. Like converting ‘3pm’ and ‘15:00’ to the same time."

-- KEYWORDS: Convert, Transform, Format, Data type, Standardize, Type casting
-- ANALOGY: Changing meters ↔ feet ↔ inches into one unit.

-- ==============================================
-- DRILL 8: Clean Numbers Stored As Text
-- ==============================================
-- CODE
ALTER TABLE messy_customers ADD COLUMN purchase_clean DECIMAL(10,2);

UPDATE messy_customers 
SET purchase_clean = REPLACE(REPLACE(total_purchase,',','.'),'-','0');

-- TECHNICAL EXPLANATION
-- REPLACE swaps invalid characters; converts text to decimal number for calculations.

-- STORYTELLING NARRATIVE
-- "Prices had commas instead of dots, and dashes instead of zero. You cannot add or multiply text! I fixed symbols and turned them into real numbers we can calculate. Like turning $100,50 into 100.50."

-- KEYWORDS: Cast, Convert, Numeric, Data type correction, Text-to-number
-- ANALOGY: Turning written words "five" → digit 5.

-- ==============================================
-- DRILL 9: Standardize Text Format
-- ==============================================
-- CODE
UPDATE messy_customers 
SET full_name = UPPER(TRIM(full_name));

-- TECHNICAL EXPLANATION
-- TRIM removes extra spaces; UPPER makes all letters capital. Eliminates format variations.

-- STORYTELLING NARRATIVE
-- "Names had extra spaces and mixed uppercase/lowercase. I cleaned spaces and unified capitalization. Now ‘Juan’, ‘juan’, and ‘ JUAN’ all look exactly the same."

-- KEYWORDS: Trim, Case normalization, Formatting, Text cleaning
-- ANALOGY: Removing extra spaces and making all letters same size.

-- ==============================================
-- DRILL 10: Group & Summarize Data
-- ==============================================
-- CODE
SELECT 
    country, 
    COUNT(*) AS total_customers, 
    SUM(purchase_clean) AS total_revenue
FROM messy_customers
GROUP BY country;

-- TECHNICAL EXPLANATION
-- GROUP BY clusters rows; COUNT counts records; SUM adds values. Core of reporting.

-- STORYTELLING NARRATIVE
-- "Now that data is clean, I want the big picture: Group everyone by country, count how many customers we have there, and add up all their purchases. Like sorting sales slips by country and adding each pile."

-- KEYWORDS: Group, Aggregate, Summarize, Roll-up, Totals, Reporting
-- ANALOGY: Grouping coins by type and counting each pile.

-- ==============================================
-- DRILL 11: Filter Groups — HAVING Clause
-- ==============================================
-- CODE
SELECT country, COUNT(*) AS total
FROM messy_customers
GROUP BY country
HAVING total > 2;

-- TECHNICAL EXPLANATION
-- HAVING filters groups after aggregation (unlike WHERE which filters rows before).

-- STORYTELLING NARRATIVE
-- "I grouped countries, but only want those with more than 2 customers. It’s like: ‘Show me only piles of coins bigger than 2 units’."

-- KEYWORDS: Filter groups, Aggregate condition, HAVING clause, Post-filter
-- ANALOGY: Keep only boxes with more than 5 items inside.

-- ==============================================
-- DRILL 12: Join Two Tables
-- ==============================================
-- CODE
SELECT c.full_name, s.product_name, s.quantity
FROM messy_customers c
JOIN messy_sales s ON c.id = s.sale_id;

-- TECHNICAL EXPLANATION
-- JOIN links tables using shared key (id). Combines related data from different sources.

-- STORYTELLING NARRATIVE
-- "Customer info is in one table, sales in another — they belong together. I connected them using the shared ID, like stapling a customer’s file to their purchase history. Now you see everything in one view."

-- KEYWORDS: Join, Link, Relate, Combine, Merge tables, Relationship
-- ANALOGY: Stapling two related documents together.

-- ==============================================
-- DRILL 13: Left Join — Preserve All Records
-- ==============================================
-- CODE
SELECT c.full_name, s.product_name
FROM messy_customers c
LEFT JOIN messy_sales s ON c.id = s.sale_id;

-- TECHNICAL EXPLANATION
-- LEFT JOIN keeps all records from first table, even if no match exists in second table.

-- STORYTELLING NARRATIVE
-- "I want every customer, even if they never bought anything. If no purchase exists, just show ‘NULL’ instead of removing them. Like listing all students, even those with zero grades."

-- KEYWORDS: Left join, Preserve data, Include all records, Outer join
-- ANALOGY: List all employees, even those without a project.

-- ==============================================
-- DRILL 14: Statistical Functions — Min / Max / Avg
-- ==============================================
-- CODE
SELECT 
    MAX(purchase_clean) AS max_purchase, 
    MIN(purchase_clean) AS min_purchase, 
    AVG(purchase_clean) AS avg_purchase
FROM messy_customers;

-- TECHNICAL EXPLANATION
-- MAX(), MIN(), AVG() are aggregate functions that calculate key statistical values across all rows. Essential for KPIs, benchmarks, and high-level insights.

-- STORYTELLING NARRATIVE
-- "I wanted to know our spending patterns: What is the highest amount any customer spent? The lowest? And what does an average customer spend? This gives us the full range and typical behavior — exactly like finding the highest score, lowest score, and class average in an exam."

-- KEYWORDS: Aggregation, Statistics, Min, Max, Average, Benchmark, KPI
-- ANALOGY: Finding tallest, shortest, and average height of people in a room.

-- ==============================================
-- DRILL 15: Sort & Rank Results
-- ==============================================
-- CODE
SELECT full_name, purchase_clean,
RANK() OVER (ORDER BY purchase_clean DESC) AS position
FROM messy_customers
ORDER BY position;

-- TECHNICAL EXPLANATION
-- Window function RANK() assigns a position number based on value order. DESC sorts from highest to lowest.

-- STORYTELLING NARRATIVE
-- "I ordered all customers from the biggest buyer down to the smallest, and gave each a rank number 1, 2, 3… This creates a leaderboard so we instantly know exactly who our most valuable customers are — just like ranking athletes in a competition."

-- KEYWORDS: Sort, Rank, Order, Position, Leaderboard, Window function
-- ANALOGY: Making a top-10 list of best-selling products.

-- ==============================================
-- DRILL 16: Fix Inconsistent Categories
-- ==============================================
-- CODE
-- See all variations first
SELECT DISTINCT category FROM messy_products;

-- Standardize all into unified names
UPDATE messy_products
SET category = CASE 
    WHEN LOWER(category) IN ('computers','computer','pc') THEN 'COMPUTERS'
    WHEN LOWER(category) IN ('accessories','acc','peripherals') THEN 'ACCESSORIES'
    WHEN LOWER(category) IN ('displays','display','monitors') THEN 'DISPLAYS'
    ELSE UPPER(category)
END;

-- TECHNICAL EXPLANATION
-- DISTINCT finds unique values; CASE applies conditional logic; LOWER() ensures case-insensitive matching. Unifies messy labels.

-- STORYTELLING NARRATIVE
-- "I noticed the same category was written in 4 or 5 different ways. I created a rule: anything meaning ‘computer’ becomes COMPUTERS, anything accessory becomes ACCESSORIES, etc. Now grouping and reports work perfectly — no more confusion from spelling differences."

-- KEYWORDS: Categorize, Standardize, Mapping, Case logic, Group values
-- ANALOGY: Putting all synonyms like laptop, PC, desktop into one folder labeled Computers.

-- ==============================================
-- DRILL 17: Calculate Derived Data — Customer Seniority
-- ==============================================
-- CODE
-- Add new column to store result
ALTER TABLE messy_customers ADD COLUMN years_customer INT;

-- Calculate years since joining
UPDATE messy_customers
SET years_customer = TIMESTAMPDIFF(YEAR, join_date_clean, CURDATE());

-- View result
SELECT full_name, join_date_clean, years_customer FROM messy_customers;

-- TECHNICAL EXPLANATION
-- TIMESTAMPDIFF() calculates time difference between two dates; CURDATE() gets today’s date automatically. Turns raw dates into meaningful business metrics.

-- STORYTELLING NARRATIVE
-- "Raw join dates are just text or numbers — but what matters is: How long has this person been our customer?. I calculated exactly that. Now we know who are our oldest, most loyal customers — this is gold for marketing and loyalty programs."

-- KEYWORDS: Derive, Calculate, Enrich, Time difference, Seniority, Business metric
-- ANALOGY: Turning a birthdate into a person’s age.

-- ==============================================
-- DRILL 18: Multi-Condition Filter — AND / OR Logic
-- ==============================================
-- CODE
-- Customers from Mexico AND spent over 500, OR anyone from USA
SELECT full_name, country, purchase_clean
FROM messy_customers
WHERE (country = 'MEXICO' AND purchase_clean > 500)
   OR country = 'USA';

-- TECHNICAL EXPLANATION
-- AND / OR combine multiple rules; parentheses define logic priority. Builds complex but precise filters.

-- STORYTELLING NARRATIVE
-- "I wanted a very specific segment: ‘Give me everyone from Mexico who spent more than 500… AND ALSO give me everyone from USA, no matter how much they spent.’ This is like saying: ‘I want red apples that are big, plus all green apples regardless of size’."

-- KEYWORDS: Logical operators, Compound conditions, Multi-filter, Boolean logic
-- ANALOGY: Shopping list: buy milk and eggs, or buy bread.

-- ==============================================
-- DRILL 19: Conditional Aggregation — Split Metrics
-- ==============================================
-- CODE
SELECT 
    country,
    SUM(CASE WHEN purchase_clean > 500 THEN 1 ELSE 0 END) AS high_value_customers,
    SUM(CASE WHEN purchase_clean <= 500 THEN 1 ELSE 0 END) AS low_value_customers,
    COUNT(*) AS total
FROM messy_customers
GROUP BY country;

-- TECHNICAL EXPLANATION
-- CASE inside SUM() counts records only when a condition is met. Creates segmented reports without extra queries.

-- STORYTELLING NARRATIVE
-- "I didn’t just want totals — I wanted to split the picture. For each country: how many people are high-value buyers vs regular buyers? This instantly shows exactly where our best revenue comes from and where we need improvement."

-- KEYWORDS: Conditional aggregation, Segmentation, Breakdown, Pivot logic
-- ANALOGY: Counting how many boys vs girls in each classroom.

-- ==============================================
-- DRILL 20: Final Clean Deliverable — Ready-to-Use Report
-- ==============================================
-- CODE
SELECT 
    c.id AS customer_id,
    c.full_name AS customer_name,
    c.age,
    c.country,
    c.join_date_clean AS join_date,
    c.years_customer,
    c.purchase_clean AS total_spent,
    COUNT(s.sale_id) AS total_orders
FROM messy_customers c
LEFT JOIN messy_sales s ON c.id = s.sale_id
GROUP BY c.id, c.full_name, c.age, c.country, c.join_date_clean, c.years_customer, c.purchase_clean
ORDER BY c.purchase_clean DESC;

-- TECHNICAL EXPLANATION
-- Clean aliases (AS), logical joins, grouping, sorting. No errors, no messy formats — only clear, readable, production-ready data.

-- STORYTELLING NARRATIVE
-- "After all cleaning, fixing, and calculations — this is the final result I present to stakeholders. I renamed columns to be easy to read, connected customer data with their orders, calculated every useful metric, and sorted by value. This is reliable, trusted data ready to make decisions — completely transformed from the messy raw table we started with."

-- KEYWORDS: Final output, Report view, Production ready, Clean dataset, Deliverable
-- ANALOGY: Presenting the polished final document after editing and correcting drafts.

-- ==================================================
-- 🛠️ SECTION 3: STANDARD DATA CLEANING FRAMEWORK
-- Repeatable process for ANY database
-- ==================================================

-- ==================================================
-- STANDARD DATA CLEANING WORKFLOW
-- ==================================================
-- Database: messy_real_world
-- Table example: messy_customers
-- ==================================================

-- STEP 1: INSPECT & UNDERSTAND
-- Always look before changing anything!
SELECT * FROM messy_customers LIMIT 50;  -- Preview first rows
DESCRIBE messy_customers;                -- See data types
SELECT DISTINCT country FROM messy_customers; -- Find inconsistencies
SELECT * FROM messy_customers WHERE age = '' OR age IS NULL; -- Find blanks

-- STEP 2: REMOVE DUPLICATES
-- Keep only unique records
DELETE t1 FROM messy_customers t1
JOIN messy_customers t2
  ON t1.id = t2.id
 AND t1.full_name > t2.full_name;

-- STEP 3: STANDARDIZE TEXT
UPDATE messy_customers
SET 
    full_name = UPPER(TRIM(full_name)),  -- Remove spaces + same case
    country = UPPER(TRIM(country));

-- STEP 4: UNIFY VALUES / SPELLING
UPDATE messy_customers SET country = 'MEXICO' WHERE country IN ('MEX','MX','MÉXICO','UNITED MEXICAN STATES','MEXICO CITY');
UPDATE messy_customers SET country = 'USA' WHERE country IN ('US','UNITED STATES','UNITED STATES OF AMERICA');

-- STEP 5: FIX DATES — Text → Real DATE
ALTER TABLE messy_customers ADD COLUMN join_date_fixed DATE;
UPDATE messy_customers SET join_date_fixed = STR_TO_DATE(join_date, '%d/%m/%Y') WHERE join_date LIKE '%/%/%';
UPDATE messy_customers SET join_date_fixed = STR_TO_DATE(join_date, '%Y-%m-%d') WHERE join_date LIKE '%-%-%';
UPDATE messy_customers SET join_date_fixed = STR_TO_DATE(join_date, '%d-%m-%y') WHERE join_date LIKE '%-%-%';

-- STEP 6: FIX NUMBERS — Text → Numeric
ALTER TABLE messy_customers ADD COLUMN purchase_fixed DECIMAL(10,2);
UPDATE messy_customers
SET purchase_fixed = 
    CASE 
        WHEN total_purchase = '' OR total_purchase = '-' THEN 0  -- Safe default
        ELSE CAST(REPLACE(total_purchase, ',', '.') AS DECIMAL(10,2))
    END;

-- STEP 7: HANDLE MISSING / INVALID VALUES
UPDATE messy_customers
SET age = '0'  -- Replace blanks, errors, or impossible ages
WHERE age = '' OR age IS NULL OR age = 'N/A' OR age = '999' OR age = 'twenty two';

-- STEP 8: VERIFY QUALITY
SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN join_date_fixed IS NULL THEN 1 ELSE 0 END) AS bad_dates,
    SUM(CASE WHEN purchase_fixed < 0 THEN 1 ELSE 0 END) AS negative_values
FROM messy_customers;

-- STEP 9: SAVE CLEAN VERSION
CREATE VIEW vw_customers_clean AS
SELECT 
    id,
    full_name AS name,
    CAST(age AS UNSIGNED) AS age,
    email,
    country,
    join_date_fixed AS join_date,
    purchase_fixed AS total_spent
FROM messy_customers;

-- ✅ DONE — Work ONLY on this view from now on
SELECT * FROM vw_customers_clean;

-- ==================================================
-- 📌 SECTION 4: BEST PRACTICES & INTERVIEW CHEAT SHEET
-- ==================================================

-- 📋 Core Principles
-- 1. Always inspect first, modify later — never change data before understanding it.
-- 2. Preserve raw data — never overwrite original columns; add new clean columns instead.
-- 3. Standardize everything — text, dates, numbers, categories.
-- 4. Document every step — so others (or you later) know what was done and why.
-- 5. Explain in business language — code is logic; narrative is value.

-- 🗣️ Interview Key Phrases
-- "I worked with raw, inconsistent data typical of real environments. My process was: inspect → deduplicate → standardize formats → fix types → enrich → deliver clean insights. I always separate technical execution from business meaning so stakeholders understand exactly what the data tells us."

-- 📂 File Summary
-- ✅ Messy database schema — 4 tables with real-world errors
-- ✅ 20 complete drills — from basic queries to advanced cleaning + storytelling
-- ✅ Standard cleaning framework — repeatable professional process
-- ✅ Ready for portfolio, training, or interviews

-- 🎯 END OF WORKBOOK