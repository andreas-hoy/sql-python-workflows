# Week 0 Portfolio Evidence

## Individual setup

In Week 0, I created a small end-to-end analytical workflow using Supabase, VS Code, SQLTools and GitHub.

The `team_members` table contains fictional UrbanStyle.ltd team members together with my own practice row.

I used the following query to inspect the table:

```sql
SELECT id, name, role, week, joined_at
FROM team_members
ORDER BY id;

The query returns the practice records in a stable order by id.

I checked that the same records appear when I query the table through VS Code and SQLTools as when I view them in Supabase.

Limitation

The team_members table contains only fictional practice data. It cannot support conclusions about UrbanStyle.ltd's real sales, customers, revenue, profitability or overall business performance.

Individual evidence

Screenshots of my Week 0 setup and query results are stored in:

individual/

Group work
Team

Executive Reporting

My role

NotebookLM Coordinator

My contribution

I created the team's shared NotebookLM notebook, uploaded the four core reference sources, generated an Audio Overview, asked source-grounded questions, and shared the notebook with the team.

Team evidence

The Week 0 team summary is stored here:

team/week0_team_summary.md

Week 0 outcome

By the end of Week 0, I had a repeatable workflow connecting practice data in Supabase, SQL in VS Code, version history in GitHub, and source-grounded AI support in NotebookLM.