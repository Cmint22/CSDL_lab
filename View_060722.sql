CREATE VIEW Student_shortinfos AS 
			SELECT student.student_id, student.first_name, student.last_name, student.gender, student.dob, student.clazz_id 
			FROM   student;
			
SELECT	*	FROM Student_shortinfos;

UPDATE 	Student_shortinfos
	SET	last_name = 'Tran'
	WHERE first_name = 'Linh';
	
DELETE	FROM	Student_shortinfos
	WHERE	last_name = 'Nguyen';
	
DROP 	VIEW	Student_shortinfos; 

CREATE VIEW Clazz_shortinfos AS 
			SELECT clazz.clazz_id, clazz.name, COUNT(student.student_id) AS 'So sinh vien'
			FROM   clazz, student;
			WHERE	student.clazz_id = clazz.clazz_id
		
CREATE VIEW student_class_shortinfos AS 
			SELECT student.student_id, student.first_name, student.last_name, student.gender, student.clazz_id 
			FROM   student;
			
...

CREATE VIEW Clazz_shortinfos AS 
			SELECT clazz.clazz_id, clazz.name, COUNT(student.student_id) AS 'So sinh vien'
			FROM   clazz, student;
			WHERE	student.clazz_id = clazz.clazz_id
