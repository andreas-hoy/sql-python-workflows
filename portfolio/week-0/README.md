## Week 0: Environment Setup & Tool Validation
### Objective
Set up and validate the tools required for the 10-week course: cloud databases (Supabase), local IDEs (VS Code), version control (GitHub), and LLM-assisted documentation (NotebookLM).
Initial configuration tests were performed using a synthetic practice dataset (`UrbanStyle.ltd`).
### Individual Evidence: Database Connection
I tested the connection between the Supabase cloud environment and my local VS Code setup. The following query was used to verify that data retrieval works correctly: sql SELECT id, name, role, week, joined_at FROM team_members ORDER BY id;
### Result
The query executed successfully, confirming that my local SQL environment can communicate with the remote Supabase database. (Note: The dataset is purely synthetic and used strictly for this setup test).
Screenshots of the verified SQL execution are archived in the individual/ folder.

## Group Work: Collaborative Setup
### Team
Executive Reporting

### Role
AI Integration & Documentation Lead (NotebookLM Coordinator)

### Contribution
To support our team's research, I provisioned our shared NotebookLM workspace, uploaded the core project reference documents, and tested the model's synthesis capabilities using source-grounded queries before sharing access with the team.
### Team Evidence
The synthesized Week 0 team documentation is archived here:
team/week0_team_summary.md

### Week 0 Outcome
By the end of Week 0, I had successfully connected my local development environment to our shared GitHub repository and database, establishing a working foundation for the upcoming analytical tasks.
