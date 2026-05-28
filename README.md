📊 HR Employee Attrition Analysis
Uncovering why employees leave and who's most at risk

🎯 Business Problem
IBM's HR team wants to understand why employees resign and identify which employee groups carry the highest attrition risk — enabling proactive retention strategies that reduce hiring costs and preserve institutional knowledge.

📁 Dataset
Source - IBM HR Analytics — Kaggle
Records - 1,470 employees
Features - 35 columns
Missing values - None (no imputation required)
Target variable - Attrition (Yes / No)

🔍 Key Findings

16.12% of employees left — 237 out of 1,470

1. Sales had the highest attrition at 20.63% making it the Highest-risk department
2. Overtime workers left at 30.53% vs 10.44% for non-overtime putting overtime at a 2.9x higher risk
3. Low income band (<$3K/month) had 29.27% attrition indicating Salary is the #1 retention lever
4. Very High earners (>$10K) had only 10.33% attrition indicating Income protects against attrition
5. Job satisfaction score of 1 drove 22.84% attrition which is Nearly double the average rate

📊 Dashboard
Show Image
4 KPI Cards · 4 Interactive Charts · 4 Slicers (Department, Job Role, Gender, Overtime)

🐍 Python Analysis
Performed end-to-end EDA in Jupyter Notebook across 5 analytical dimensions:

Data profiling — shape, dtypes, null check, value distributions
Feature engineering — created Attrition_Flag, Income_Band, Tenure_Group
Department analysis — attrition rate by business unit
Overtime impact — attrition comparison with/without overtime
Income distribution — overlapping histograms for leavers vs stayers
Satisfaction analysis — attrition by job satisfaction score (1–4)
Tenure patterns — attrition across employee lifecycle stages


🗄️ SQL Queries
Five business queries written in MySQL — see sql/queries.sql
-- Q1: Attrition rate by department
-- Q2: Overtime impact on attrition
-- Q3: Average income by job role — leavers vs stayers (CTE)
-- Q4: Income band risk ranking (Window Function — RANK())
-- Q5: Multi-factor high-risk employee profiling
Techniques used: CASE WHEN, GROUP BY, CTEs, Window Functions (RANK() OVER)

📂 Repository Structure
hr-attrition-analysis/
│
├── 📂 data/
│   └── hr_attrition.csv           ← IBM HR dataset (1,470 records)
│
├── 📂 notebooks/
│   └── eda_analysis.ipynb         ← Python EDA — cleaning, features, 5 charts
│
├── 📂 sql/
│   └── queries.sql                ← 5 business SQL queries with comments
│
├── 📂 dashboard/
│   ├── hr_dashboard.pbix          ← Power BI file
│   └── dashboard_screenshot.png  ← Dashboard preview
│
└── README.md

🛠️ Tools & Technologies
ToolPurposePython (Pandas, NumPy)Data cleaning & feature engineeringMatplotlib & SeabornExploratory data visualisationMySQL + MySQL WorkbenchBusiness SQL queriesPower BI (DAX, Power Query)Interactive dashboardJupyter NotebookAnalysis environmentGit & GitHubVersion control

👤 Author
Shubham Kumar
