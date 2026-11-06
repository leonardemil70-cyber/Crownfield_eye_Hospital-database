# CPU4103 – Crownfield Eye Hospital – final DRAFT, not submitted work

Source: user-supplied GBS / BSU Summative Assessment Guide CPU4:103 (dated June 2025 cohort; deadline stated Monday 9 November 2026).
Each student must independently understand, test, personalise, and submit their own work. The assessment explicitly has **no shared group mark**.

**This package contains three self-contained individual repositories**, three editable reports and three editable PowerPoint slide decks, plus assessment/testing guidance. All findings labelled expected require validation with MySQL Workbench. No screenshot, recorded presentation or GitHub publication has been fabricated.

**Run order** inside each repository:
1. `01_schema.sql` (WARNING: DROP TABLE rebuild)
2. `02_sample_data.sql`
3. `03_common_integrity.sql`
4. `04_individual_queries.sql`
5. `05_procedure_trigger.sql`
6. `06_security.sql` (DB administrator role privileges required)
7. `07_positive_tests.sql`, then deliberate tests one at a time (`08_negative_tests.md`).

The common schema holds 13 tables (11 clinical and 2 support). Base patient count 15, appointment count 15, prescriptions 14, items 15, follow-up plans 15, linked diagnoses 15. Appendix1=5 appointments; Synthetic=10. The 2 password hashes represent randomly generated fictional credentials not retained in plain text. There are no actual clinical records.

**Important**: SQL scripts have been statically reviewed / SQLite-compatible subset verified, but have not been executed against a real MySQL server in this environment. Final tests must run in MySQL Workbench, and students must capture actual output.

**Outstanding personal requirements:** each student supplies their real student number, their *own* genuine GitHub repository URL, a truthful contribution statement, actual screenshots, and an 8–10 minute MP4 recording with camera on. Final reports should be checked against the 1,350–1,650 word limit and university academic-integrity policies.
