# Leo – individual Part C evidence guide

Each capture must show query SQL, actual MySQL result pane, date and a one-sentence interpretation. DO NOT insert fabricated output screenshots.

Q1–Q4: execute in `04_individual_queries.sql` individually. Predictions:
* Q1 GROUP BY + HAVING: priorities with two or more planned follow-ups: Routine 10; High 4 (Urgent 1 excluded)
* Q2 INNER JOIN four tables: follow-up schedule by patient, clinician and clinic: 15 follow-up rows
* Q3 LEFT JOIN: appointments without prescriptions: AP004 only
* Q4 EXISTS: patients with urgent follow-up: OP002 Daniel Reed

**Q5 procedure**: `CALL sp_leo_due_followups('2026-11-16');`. Predicted: 7 planned follow-up rows through 16 Nov 2026.

**Q6 trigger demonstration**: after running `05_procedure_trigger.sql`, test in Workbench (separate execution):

```sql
START TRANSACTION;
UPDATE follow_up SET follow_up_status='Completed' WHERE follow_up_id='FU001';
SELECT * FROM audit_log WHERE appointment_id='AP001' ORDER BY audit_id DESC;
ROLLBACK;
```

Prediction: One new audit event inside the transaction; ROLLBACK removes both updates.

**Security**: show `SHOW GRANTS FOR 'crown_patient'`, `SHOW GRANTS FOR 'crown_reception'` and test at least one denied permission using a separately-created locally authorised test account. Do not include passwords in screenshots.

**Transactions**: show `START TRANSACTION`, controlled UPDATE, SELECT, `ROLLBACK` and check original value; screenshot outputs.

**Contributor attribution**: insert your personally performed edits/tests and GitHub commits; shared template code is not proof of individual authorship.
