# Chinook-Data--Analyst-Lab-week3
Advanced SQL database auditing and business intelligence analysis on the Chinook relational database using Microsoft SQL Server (T-SQL).

## 📌 Project Overview
This project focuses on executing production-grade SQL scripts against the **Chinook Relational Database** model using Microsoft SQL Server (T-SQL). The goal is to move from basic querying to advanced business problem-solving and optimization.

## 🛠️ Tech Stack & Skills Highlighted
* **Database Engine:** Microsoft SQL Server (T-SQL)
* **Core Operations:** Conditional Filtering, Multi-Stage Aggregations (`GROUP BY`, `HAVING`)
* **Advanced Logic:** Multi-Table Inner/Left Joins, Dynamic Subqueries
* **Analytical Engineering:** Window Functions (`RANK() OVER`, `PARTITION BY`, `ROW_NUMBER()`)
* **Database Optimization:** Physical B-Tree Indexing and execution validation via system catalog views (`sys.indexes`)

## 📊 Key Business Insights Discovered
1. **Market Concentration:** Islocated the United States as the core operational revenue driver, contributing **$523.06 across 91 orders**.
2. **Customer LTV Tiering:** Utilized window partitions to successfully rank and extract the top-spending "VIP customer personas" per individual country without data dilution from larger markets.
3. **Product Velocity:** Tied line item schemas back to track assets, identifying high-performing products like the Rock track "Dazed And Confused" (5 units sold).
