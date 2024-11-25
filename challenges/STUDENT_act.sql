# MAKE A TABLE WITH THE FOLLOWING COLUMNS 
-- student_id
-- full_name
-- age
-- enrollment_date
-- is_active  
CREATE TABLE students (
    student_id INT PRIMARY KEY,  
    full_name VARCHAR(100) NOT NULL,     
    age TINYINT(2) NOT NULL,               
    enrollment_date DATE NOT NULL,   
    is_active BOOLEAN NOT NULL 
);
