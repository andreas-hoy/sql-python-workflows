# Week 5 — Visualisation Design

## Individual Contribution (Power BI Dashboard)
This week focused on turning the UrbanStyle data into an interactive dashboard for non-technical stakeholders. I connected Power BI to the Supabase database and built a first dashboard prototype using the `sales`, `customers`, and `products` tables.

The dashboard includes:
- a monthly revenue trend
- the top 10 products by sales revenue
- the sales split by location
- a date-range slicer
- a location slicer

Before building the visuals, duplicate sales records were removed based on `invoice_id` so that revenue figures were not overstated.

The dashboard is designed to give a quick overview of business performance while still allowing the user to explore the data by period and location.

**Business Value:**  
The dashboard makes it possible for management and investors to understand sales trends, product performance, and location differences without reading detailed SQL outputs or transaction tables.

## Portfolio Artifacts
- [`urbanstyle_week5_dashboard_Andreas.pbix`](urbanstyle_week5_dashboard_Andreas.pbix) — interactive Power BI dashboard
- [`images/dashboard_screenshot.png`](images/dashboard_screenshot.png) — dashboard screenshot

## Team Integration
The Week 5 team work combines different stakeholder views into one investor-ready overview, including revenue growth, product performance, marketing/channel insights, and operational findings.

**Team summary:** [add team presentation / shared-work link here]

## Core Working Principle
**Start with the business question -> choose the right visual -> remove unnecessary detail -> add interactivity only where it helps the user understand the data.**
