📦 FEMA Supply Chain Data Cleaning & Analysis
A full SQL-based data cleaning pipeline with anomaly detection and operational KPIs

📘 Project Overview
This project demonstrates a complete, end‑to‑end data cleaning and analysis workflow for a FEMA supply‑chain dataset.
The dataset includes shipments, costs, delays, shortages, suppliers, warehouses, and disaster response logistics.

The goal of this project is to:

  Clean and standardize raw operational data

  Recalculate key fields to ensure accuracy

  Detect anomalies and data quality issues

  Build meaningful KPIs used in real federal logistics operations

  Prepare the dataset for Power BI dashboards and deeper analysis

This project reflects real-world practices used in FEMA, DoD, DHS, and emergency logistics environments.

🛠️ Technologies Used

  SQL (MySQL)

  Excel (verification & QA)

  Power BI (analysis-ready dataset)

  GitHub (portfolio documentation)

🔧 Data Cleaning Pipeline (Steps 1–11)
Each step below includes the reason behind the transformation — this is what hiring managers look for.

1. Standardize Date Formats
Ensures all dates follow YYYY-MM-DD for consistency and correct calculations.

2. Fix Missing or Incorrect Arrival Dates
Rebuild arrival dates using:
arrival_date = ship_date + delay_days  
This ensures arrival dates match operational reality.

3. Recalculate Total Cost
total_cost = unit_cost * quantity_shipped  
Fixes mismatches caused by rounding or data entry errors.

4. Validate Cost Calculations
Rounded both sides to 2 decimals to eliminate floating‑point precision issues.

5. Recalculate Shortage Flag
shortage_flag = 1 if quantity_requested > quantity_received  
This ensures shortages reflect actual fulfillment performance.

6. Create Lead Time (Days)
lead_time_days = arrival_date - ship_date  
Measures real shipment speed — critical for disaster response.

7. Trim Whitespace in Text Fields
Prevents duplicate categories caused by invisible spaces.

8. Standardize Supplier Names
UPPER(TRIM(supplier))  
Ensures suppliers group correctly in analysis.

9. Create Delay Flag
delay_flag = 1 if delay_days > 0  
Binary indicators make KPIs and dashboards cleaner.

10. Calculate Cost Per Unit
cost_per_unit = total_cost / quantity_shipped  
Normalizes cost for fair comparison across categories.

11. Anomaly Detection
Flagged impossible or illogical values such as:

Negative quantities

Negative costs

Negative lead times

Unrealistic cost-per-unit values

Example anomaly found:
Ship Date: 2019‑03‑21
Arrival Date: 2019‑03‑14
→ Lead time = –7 (impossible) → flagged

📊 Operational KPIs & Why They Matter
These KPIs reflect real supply‑chain performance metrics used in FEMA and federal logistics.

1. Total Shipments
Shows workload and operational scale.

2. Delay Rate
Measures reliability of suppliers and transport modes.

3. Average Lead Time
Shows true shipment speed — critical for emergency response.

4. Supplier Delay Performance
Identifies unreliable suppliers and supports contract decisions.

5. Warehouse Efficiency
Highlights bottlenecks at specific warehouses.

6. Cost Per Unit (by Category)
Detects overpriced items and procurement inefficiencies.

7. Shortage Rate
Shows how often shipments fail to meet requested quantities.

8. Top 10 Most Expensive Shipments
Helps identify cost anomalies, emergency shipments, or data errors.

📁 Project Structure
/data                → raw & cleaned datasets  
/sql                 → cleaning scripts & KPI queries  
/notebooks           → Python/analysis notebooks  
/dashboard           → Power BI files  
/reports             → summary findings & insights  
README.md            → project documentation  
