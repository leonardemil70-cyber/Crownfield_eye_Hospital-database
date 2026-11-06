-- Leo individual Part C queries. Run after 01–03. Predicted rows are not evidence of MySQL execution.
USE crownfield_eye_hospital;

-- Q1: Q1 GROUP BY + HAVING: priorities with two or more planned follow-ups
-- Expected based on seed: Routine 10; High 4 (Urgent 1 excluded)
SELECT priority,COUNT(*) AS planned_count FROM follow_up
WHERE follow_up_status='Planned' GROUP BY priority HAVING COUNT(*)>=2
ORDER BY planned_count DESC;

-- Q2: Q2 INNER JOIN four tables: follow-up schedule by patient, clinician and clinic
-- Expected based on seed: 15 follow-up rows
SELECT f.follow_up_id,p.patient_name,c.clinician_name,cl.clinic_name,f.due_date,f.priority
FROM follow_up f JOIN appointment a ON a.appointment_id=f.appointment_id
JOIN patient p ON p.patient_id=a.patient_id
JOIN clinician c ON c.clinician_id=a.clinician_id
JOIN clinic cl ON cl.clinic_id=a.clinic_id ORDER BY f.due_date;

-- Q3: Q3 LEFT JOIN: appointments without prescriptions
-- Expected based on seed: AP004 only
SELECT a.appointment_id,a.appointment_status FROM appointment a
LEFT JOIN prescription r ON r.appointment_id=a.appointment_id
WHERE r.prescription_id IS NULL ORDER BY a.appointment_id;

-- Q4: Q4 EXISTS: patients with urgent follow-up
-- Expected based on seed: OP002 Daniel Reed
SELECT p.patient_id,p.patient_name FROM patient p
WHERE EXISTS (SELECT 1 FROM appointment a JOIN follow_up f ON f.appointment_id=a.appointment_id
 WHERE a.patient_id=p.patient_id AND f.priority='Urgent') ORDER BY p.patient_id;
