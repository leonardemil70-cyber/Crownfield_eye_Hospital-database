-- Leo: Q5 stored procedure and Q6 meaningful trigger.
-- After shared data + integrity triggers are installed.
USE crownfield_eye_hospital;

-- Q5
DROP PROCEDURE IF EXISTS sp_leo_due_followups;
DELIMITER $$
CREATE PROCEDURE sp_leo_due_followups(IN p_cutoff DATE)
BEGIN
 SELECT f.follow_up_id,a.appointment_id,p.patient_name,f.due_date,f.priority
 FROM follow_up f JOIN appointment a ON a.appointment_id=f.appointment_id
 JOIN patient p ON p.patient_id=a.patient_id
 WHERE f.due_date<=p_cutoff AND f.follow_up_status='Planned'
 ORDER BY f.due_date,f.follow_up_id;
END$$
DELIMITER ;

-- Q6
DROP TRIGGER IF EXISTS trg_leo_audit_followup;
DELIMITER $$
CREATE TRIGGER trg_leo_audit_followup AFTER UPDATE ON follow_up FOR EACH ROW
BEGIN
 IF NOT(OLD.follow_up_status <=> NEW.follow_up_status) THEN
  INSERT INTO audit_log(appointment_id,event_type,old_value,new_value,actor)
  VALUES(NEW.appointment_id,'FOLLOWUP_STATUS_CHANGED',OLD.follow_up_status,NEW.follow_up_status,USER());
 END IF;
END$$
DELIMITER ;
