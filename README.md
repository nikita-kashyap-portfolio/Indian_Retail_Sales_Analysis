Indian Retail Sales: Hunting for Profitability

​An End-to-End Analysis to Identify Loss-Making Categories & Boost Margins
​💡 The "Why" Raw data tells you what happened, but a good analyst tells you why it matters. In this project, I took a massive FMCG dataset and moved it through a three-stage pipeline (Excel → MySQL → Tableau) to find exactly where the business was leaking money. My goal wasn't just to make charts, but to find actionable ways to save the company's bottom line.
​🛠️ My Process
​1. Building the Foundation (Excel)
​I didn't just clean the data; I made it relevant.
​Localization: Converted global metrics into Indian Rupees (₹) and localized city data to reflect the Indian retail landscape.
​Feature Engineering: Created calculated fields for GST (18%), Net Revenue, and Profit Margin % to ensure the numbers reflected real-world business costs.

​2. The Deep Dive (MySQL)
​I migrated the data into a relational database to answer questions that standard spreadsheets can't handle.
​Complex Querying: Used Window Functions (RANK(), PARTITION BY) to find the top products per region.
​The "Profit Killer" Hunt: Wrote custom SQL scripts to isolate every single sub-category and product contributing to negative margins.

​3. The Executive Story (Tableau)
​I built a dashboard designed for C-Suite decision-makers.
​Executive Overview: Focused on the Avg. Regional Margin (26.2%) to show the overall health of the four business units.
​Strategic Visuals: Used Treemaps and bar charts to make the "Loss Analysis" impossible to ignore.
​📈 Top 3 Insights
​The Discount Trap: I found that 15% of products are causing 80% of the total losses. The biggest offender? Over-discounting in the Binders and Tables categories.
​Regional Disparity: West India is the efficiency leader (55.3% margin), while South India is struggling with a low 11.6% margin, signaling a need for a pricing audit.
​Seasonality Trends: Identified a sharp performance dip in early 2023, highlighting a gap in post-holiday inventory management.

​🎯 My Strategic Recommendations
​Reduce Discounts: Implement a mandatory 10% reduction in discounts for the "Binders" sub-category.
​Scale the West Model: Standardize the pricing and inventory strategies from the West Region across the South and East.
​Product Culling: Immediately review or discontinue the Top 10 loss-making products identified in my SQL analysis.

​📂 Project Files
​retail_sales_cleaning.xlsx – Localized and cleaned dataset.
​retail_sales_analysis.sql – The SQL "engine" behind the rankings and loss analysis.
​retail_insights.twb – Interactive Tableau Workbook.
​Retail Performance Dashboard.png – Final high-resolution executive overview.<img width="1655" height="912" alt="Retail Performance Dashbaord" src="https://github.com/user-attachments/assets/d657298e-ed69-41a8-9553-73ceffb32c61" />

