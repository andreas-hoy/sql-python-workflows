## Week 0: Environment Setup & Pipeline Validation
### Objective
Establish and validate the foundational data engineering pipeline connecting cloud databases (Supabase), local IDEs (VS Code), version control (GitHub), and LLM-assisted documentation (NotebookLM).
To ensure pipeline stability before ingesting more complex datasets, all initial configuration tests were performed using a synthetic corporate dataset (UrbanStyle.ltd).

### Individual Evidence:Database Synchronization
I validated the end-to-end connection between the Supabase cloud environment and my local SQL tools. The following verification query was used to test data retrieval and table structure: sql SELECT id, name, role, week, joined_at FROM team_members ORDER BY id;

### Result Validation
The query executed successfully across Supabase, VS Code, and SQLTools, returning identical, stable records. This confirms that the local-to-cloud synchronization is operational.

### System Limitation Note
The team_members dataset is purely synthetic ("dummy data") used strictly for infrastructure testing. It holds no analytical value for actual data assessments.
Screenshots of the verified SQL execution are archived in the individual/ folder.

## Group Work: Collaborative Infrastructure
### Team
Executive Reporting

### Role
AI Integration & Documentation Lead (NotebookLM Coordinator)

### Contribution
To optimize our team's research and collaborative efficiency, I established our LLM-assisted workflow. I initialized the shared NotebookLM environment, ingested the four core project reference sources, and generated an Audio Overview to validate the model's synthesis capabilities. Furthermore, I executed source-grounded queries to verify context retention and accuracy before provisioning access to the wider team.

### Team Evidence
The synthesized Week 0 team documentation is archived here:
team/week0_team_summary.md

### Week 0 Outcome
By the end of Week 0, I had successfully orchestrated a reproducible, end-to-end operational workflow. The architecture seamlessly integrates cloud-hosted synthetic practice data (Supabase), local query execution (VS Code / SQL), rigorous version control (GitHub), and LLM-assisted knowledge management (NotebookLM).
