# Week 2 Team Work: Data Cleaning & Validation

**Team:** Executive Reporting  
**Stakeholder Focus:** Toomas Kask (Management)

## Data Quality Findings

Our team audited four core data domains and validated the main Week 2 cleaning issues:

- **Products:** 362 records. *Findings:* 12 duplicate product names affecting 24 rows; no NULL critical fields, negative prices, or category inconsistencies.
- **Customers:** 3,150 records. *Findings:* 380 missing email addresses, 128 duplicate email addresses, and inconsistent city-name formatting across 54 raw entries representing 12 unique cities.
- **Sales:** 15,234 raw rows. *Findings:* 5,116 duplicate rows were identified and removed in the test copy, leaving 10,118 rows. No impossible future dates were found.
- **Cross-validation:** *Findings:* 0 orphan customer references and 0 orphan product references. We also found 592 dormant customers and 12 unsold products.

## Biggest Surprise

The scale of the duplicate-sales issue was the biggest surprise, while the relational integrity across customers, products, and sales was stronger than expected.

## Recommendation to Toomas (Management)

Prioritise validated removal of duplicate sales rows, then prevent recurrence with stronger data-quality controls. Customer city names and email capture should be standardised, while dormant customers and unsold products should be reviewed as business opportunities.

## Missing / Uncertain Data

We still do not know the identities behind anonymous guest purchases, and missing email addresses cannot be safely filled without obtaining the real information.
