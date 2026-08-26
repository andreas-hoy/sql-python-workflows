## Week 1 Team Work: Macro Data Landscape & Quality Audit
**Team:** Executive Reporting  
**Stakeholder Focus:** Toomas Kask (Management)  

### Data Landscape & Profiling
Our team conducted a structural audit across four core business domains to establish a data quality baseline:

- **Sales (Transactions):** 15,234 records across 12 columns. 
  *Anomalies detected:* Identified critical violations of business logic (e.g., negative `total_price` values despite positive `unit_price` inputs) and referential gaps (1,487 records lacking `customer_id` keys).
- **Customers:** 3,150 records across 9 columns. 
  *Anomalies detected:* Entity resolution vulnerabilities, including inconsistent geospatial logging (city names), incomplete contact fields (380 missing emails), and deterministic duplication risks (at least 130 records share identical email addresses).
- **Products:** 362 records across 10 columns. 
  *Anomalies detected:* The catalog spans multiple categories with prices ranging from a baseline of €14.53 up to €434.08 (*Õhuline sünteetiline sporditossud*). 
- **Sales (Channels/Locations):** Bimodal distribution across 2 unique channels (`online` and `pood`). 
  *Anomalies detected:* A comprehensive spatial mapping of physical store locations is currently missing from the consolidated schema.

### Architectural Observation ("Biggest Surprise")
The structural audit revealed systemic data-quality vulnerabilities across the entire database topology (negative transactional values, referential gaps, and unnormalized geospatial entries). In a production environment, utilizing this raw data without robust upstream sanitization would fundamentally compromise the integrity of any downstream analytical reporting.

### Strategic Recommendation to Toomas (Management)
Suspend macro-level financial or marketing reporting utilizing this raw dataset. Before executing advanced business aggregations, Management must define the business logic for these edge cases (e.g., whether negative sales represent valid returns or data-entry errors) and authorize a systematic data-cleansing pipeline to enforce entity resolution and referential integrity.

### Identified Data Blind Spots ("Missing Data")
The current schema lacks essential documentation defining the treatment of negative sales, lacks referential mapping for 1,487 "guest" transactions, lacks email vectors for 380 customers, and lacks a definitive spatial registry for physical store locations.
