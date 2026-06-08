# 🧹 MySQL Data Cleaning Practice & Storytelling Workbook
**Author:** David Morales | **Version:** 1.0 | **Date:** May 2026  
**Skill Level:** Beginner to Advanced | **Category:** Data Analysis / SQL / Data Quality

---

## 🎯 Purpose
This project simulates **real-world data scenarios** found in companies: messy formats, duplicates, missing values, inconsistent naming, and wrong data types.  
It is designed not only to practice SQL syntax, but to master the **entire workflow of a Data Analyst**:
1.  Detect problems
2.  Clean & standardize
3.  Transform data
4.  **Explain results in business language** (Storytelling)

Perfect for portfolio, interview preparation, or training.

---

## ⚙️ Environment
- **MySQL Version:** 9.7.0 LTS (Compatible with all modern versions: 5.7+, 8.x)
- **Port:** 3307
- **Techniques used:** `SELECT`, `JOIN`, `UPDATE`, `ALTER TABLE`, `STR_TO_DATE`, Aggregations, Window Functions, `CASE` logic, Data Casting, Deduplication.

---

## 📚 What’s Inside?

### 1️⃣ Messy Database Schema
4 tables created with **intentional errors** to replicate real databases:
- `messy_customers`
- `messy_sales`
- `messy_employees`
- `messy_products`

*Issues included:*
- Duplicate records
- Dates in 3+ different formats
- Numbers stored as text (commas instead of dots)
- Inconsistent names (MEX / MX / Mexico / Méx)
- Missing / NULL / N/A values
- Wrong data types

---

### 2️⃣ 20 Complete Drills ✅
Every exercise includes:
✅ **SQL Code** — Clean, optimized solution
✅ **Technical Explanation** — How it works
✅ **Storytelling Narrative** — *Why we do it & what it means for the business*
✅ **Keywords** — For resume/interview use
✅ **Analogy** — Simple way to understand complex logic

**From basic to advanced:**
1.  View Raw Data
2.  Filter Records
3.  Standardize Values
4.  Remove Duplicates
5.  Detect Missing Data
6.  Replace Invalid Entries
7.  Text → Date Conversion
8.  Text → Number Conversion
9.  Text Formatting
10. Group & Summarize
11. Filter Groups (`HAVING`)
12. Join Tables
13. Left Join (Preserve data)
14. Statistical Functions (Min/Max/Avg)
15. Sort & Rank
16. Fix Categories
17. Calculate Derived Metrics
18. Multi-Condition Filters
19. Conditional Aggregation
20. Final Clean Report

---

### 3️⃣ 🛠️ Standard Data Cleaning Framework
**A repeatable 9-step process you can apply to ANY database.**
This is my professional methodology:
1.  **Inspect & Understand** — *Never change before looking*
2.  **Remove Duplicates**
3.  **Standardize Text**
4.  **Unify Values & Categories**
5.  **Fix Dates**
6.  **Fix Numbers**
7.  **Handle Missing/Invalid Data**
8.  **Verify Quality**
9.  **Save Clean Version** — *Preserve raw data always*

---

### 4️⃣ 📌 Best Practices & Interview Cheat Sheet
- Core principles for high-quality data work
- Key phrases to use in interviews
- How to translate technical work into business value

---

## 💡 Key Learning
> **"Data cleaning is not just fixing errors — it is turning noise into reliable information that supports decisions."**

This project demonstrates:
✅ Deep SQL mastery
✅ Data quality mindset
✅ Ability to structure processes
✅ Communication skills: translating code into insights

---

## 🚀 How to Use
1.  Create the database using the schema in `mysql_data_cleaning_workbook.sql`
2.  Run drills in order (1–20)
3.  Follow the Standard Framework to build your own cleaning routines
4.  Use the examples and narratives to explain your work to clients or interviewers

---

## 📜 License
Free for educational and professional use.
