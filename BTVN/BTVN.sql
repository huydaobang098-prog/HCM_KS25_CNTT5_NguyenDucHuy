CREATE DATABASE OnlineLearning;
USE OnlineLearning;
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    total_sessions INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    enroll_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);	
CREATE TABLE Result (
    student_id INT,
    course_id INT,
    mid_score DECIMAL(4,2) CHECK (mid_score BETWEEN 0 AND 10),
    final_score DECIMAL(4,2) CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id, course_id) 
        REFERENCES Enrollment(student_id, course_id)
);
INSERT INTO Student (full_name, birth_date, email) VALUES
('Nguyen Van A', '2000-01-01', 'a@gmail.com'),
('Tran Thi B', '2001-02-02', 'b@gmail.com'),
('Le Van C', '2000-03-03', 'c@gmail.com'),
('Pham Thi D', '2002-04-04', 'd@gmail.com'),
('Hoang Van E', '2001-05-05', 'e@gmail.com');
INSERT INTO Teacher (full_name, email) VALUES
('Teacher 1', 't1@gmail.com'),
('Teacher 2', 't2@gmail.com'),
('Teacher 3', 't3@gmail.com'),
('Teacher 4', 't4@gmail.com'),
('Teacher 5', 't5@gmail.com');
INSERT INTO Course (course_name, description, total_sessions, teacher_id) VALUES
('SQL Basic', 'Hoc SQL co ban', 10, 1),
('Java', 'Lap trinh Java', 15, 2),
('Python', 'Lap trinh Python', 12, 3),
('Web', 'HTML CSS JS', 20, 4),
('Data', 'Phan tich du lieu', 18, 5);
INSERT INTO Enrollment VALUES
(1,1,'2024-01-01'),
(1,2,'2024-01-02'),
(2,1,'2024-01-03'),
(3,3,'2024-01-04'),
(4,4,'2024-01-05');
INSERT INTO Result VALUES
(1,1,7.5,8.0),
(1,2,6.0,7.0),
(2,1,8.5,9.0),
(3,3,5.0,6.5),
(4,4,9.0,9.5);
UPDATE Student
SET email = 'newemail@gmail.com'
WHERE student_id = 1;
UPDATE Course
SET description = 'SQL tu co ban den nang cao'
WHERE course_id = 1;
UPDATE Result
SET final_score = 9.5
WHERE student_id = 1 AND course_id = 1;
DELETE FROM Result
WHERE student_id = 4 AND course_id = 4;
DELETE FROM Enrollment
WHERE student_id = 4 AND course_id = 4;
SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;