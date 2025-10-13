## Project Background  

***Year‑in‑Review: Shipment Financials Apr 2024‑Mar 2025***  

GreenField Supplies is a wholesaler specialising in buying and selling outdoor products for equestrian, farming, and general outdoor purposes. Over the past year, the company has experienced fluctuating shipping costs, lead times, and stock performance, and in an effort to better understand customer demand and predict future trends, they commissioned a review of overall operational performance.

Recommendations are provided on the following key areas

• **Inbound Shipments:** An examination of the most recent sales trends and shipment performance.  
• **Lead Times:** An assessment of supplier performance regarding delivery timelines.  
• **Stock Levels & Reorder Points:** An analysis of current stock levels and reorder efficiency.  
• **OTIF (On-Time In-Full):** An evaluation of supplier delivery reliability, with comparisons across the products they provide.  

The Excel file used to inspect clean and analyse the data is [here](Excel/Issue_log.png). 

SQL queries used to export necessary tables you can find [here](SQL/SQL_Queries.sql).

## ERD, Data Structure and Initial Check

The database structure as seen below consist of five tables: Inventory, products, shipments, shipment_details and suppliers.  

<img width="500" height="480" alt="Screenshot 2025-10-04 at 10 34 48" src="https://github.com/user-attachments/assets/b3997689-f0c1-4868-97da-a94ba8453aa1" />   


<img width="919" height="251" alt="Screenshot 2025-10-04 at 10 38 33" src="https://github.com/user-attachments/assets/d95283a5-0c33-42e7-a9aa-f6ef9ffd7c65" />  


## Executive Summary  

#### Overview of Findings 

**GreenField Supplies** The dashboard provides an overview of supplier performance, delivery reliability, and inventory status. Average lead times range from **7 to 27 days**, with **EuroMat** performing best. UKTools and **AsiaPlast showed longer delays, suggesting transport inefficiencies. On-time, in-full **(OTIF)** delivery rates average around **72–76%**, indicating moderate reliability but room for improvement. Around **22% of shipments are delayed**, typically by **1–2 days**, while shipment costs remain stable at roughly **£46K–£47K per shipment** across suppliers. A total of **9,501 shipments cost £439.89 million** overall. Additionally, five products stock level fell below their reorder point for a total of seven times. that happened to the Manure Scoops on three seperate occasions, signaling the need for prompt restocking to avoid stock shortages.

<img width="1317" height="736" alt="Screenshot 2025-10-08 at 15 38 04" src="https://github.com/user-attachments/assets/07fc2047-6f62-4452-9abe-2e4adc4161c7" />  

## Recommendations 

• **Inbound Shipments:** It would be valuable to **analyse the high shipping costs in more detail**, identifying which products contribute most to these expenses and understanding why they are being purchased from AsiaPlast. Based on this analysis, a potential strategy could be to **source these products from alternative suppliers** where feasible, in order to optimize shipping costs.

• **Lead Times:** It would be beneficial to **identify the European products with the longest lead times** and investigate whether the same products are available from suppliers in other regions. If so, purchasing from those alternative suppliers could reduce lead times and improve stock availability.

• **Stock Levels & Reorder Points:** Review sales trends with seasonal demand in mind and adjust reorder points dynamically to maintain sufficient buffer stock during peak months. Prioritise suppliers with shorter lead times to minimise stockouts, while also investigating whether recurring shortages stem from supplier capacity constraints.

• **OTIF (On-Time In-Full):** To improve overall reliability, root cause analysis should be conducted to understand the drivers behind UK Tools’ OTIF fluctuations.

