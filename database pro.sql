CREATE TABLE Students (
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100) ,
birth_date DATE
);
CREATE TABLE Instructors (
instructor_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100) ,
department VARCHAR(100)
);
CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
description TEXT,
credits INT,
instructor_id INT,
FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);
CREATE TABLE courses_enrollment (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
grade VARCHAR(2),
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

GRANT SELECT ON Students TO student_user;
GRANT SELECT ON Courses TO student_user;
GRANT SELECT ON Enrollments TO student_user;

GRANT INSERT, UPDATE, DELETE ON Enrollments TO student_user;

GRANT ALL PRIVILEGES ON Courses TO student_user;

REVOKE INSERT, UPDATE ON Enrollments FROM student_user;

INSERT INTO Students VALUES
(1, 'Ali', 'Hassan', 'ali.hassan@example.com', '2001-05-12'),
(2, 'Sara', 'Mahmoud', 'sara.mahmoud@example.com', '2002-08-25'),
(3, 'Yousef', 'Ibrahim', 'yousef.ibrahim@example.com', '2000-01-15'),
(4, 'Mona', 'Adel', 'mona.adel@example.com', '2003-04-20'),
(5, 'Khaled', 'Fathi', 'khaled.fathi@example.com', '1999-12-30'),
(6, 'Laila', 'Omar', 'laila.omar@example.com', '2001-06-10'),
(7, 'Ahmed', 'Zaki', 'ahmed.zaki@example.com', '2002-09-01'),
(8, 'Reem', 'Sami', 'reem.sami@example.com', '2000-11-11'),
(9, 'Nour', 'Ihab', 'nour.ihab@example.com', '2001-03-05'),
(10, 'Tamer', 'Hani', 'tamer.hani@example.com', '2003-07-17');

INSERT INTO Instructors VALUES
(1, 'Dr. Hany', 'Mostafa', 'hany.mostafa@example.com', 'Computer Science'),
(2, 'Dr. Salma', 'Ibrahim', 'salma.ibrahim@example.com', 'Mathematics'),
(3, 'Dr. Omar', 'Ali', 'omar.ali@example.com', 'Engineering'),
(4, 'Dr. Dina', 'Hassan', 'dina.hassan@example.com', 'Physics'),
(5, 'Dr. Nabil', 'Adel', 'nabil.adel@example.com', 'Business'),
(6, 'Dr. Ahmed', 'Tarek', 'ahmed.tarek@example.com', 'Biology'),
(7, 'Dr. Sara', 'Fawzy', 'sara.fawzy@example.com', 'Chemistry'),
(8, 'Dr. Khaled', 'Youssef', 'khaled.youssef@example.com', 'Philosophy'),
(9, 'Dr. Mona', 'Sherif', 'mona.sherif@example.com', 'History'),
(10, 'Dr. Rania', 'Gamal', 'rania.gamal@example.com', 'Literature');

INSERT INTO Courses VALUES
(101, 'Database Systems', 'Intro to relational databases', 3, 1),
(102, 'Calculus I', 'Basic calculus concepts', 4, 2),
(103, 'Physics 101', 'Mechanics and motion', 3, 4),
(104, 'Software Engineering', 'Design and architecture of software', 3, 1),
(105, 'Microeconomics', 'Economic principles', 2, 5),
(106, 'Linear Algebra', 'Matrix operations and vectors', 3, 2),
(107, 'Networks', 'Introduction to networking', 3, 3),
(108, 'Statistics', 'Probability and distributions', 3, 2),
(109, 'Web Development', 'Frontend and backend basics', 3, 1),
(110, 'Project Management', 'Managing software projects', 2, 5);

INSERT INTO courses_enrollment VALUES
(1, 1, 101, '2024-01-10', 'A'),
(2, 2, 102, '2024-01-11', 'B'),
(3, 3, 103, '2024-01-12', 'C'),
(4, 4, 104, '2024-01-13', 'A'),
(5, 5, 105, '2024-01-14', 'B'),
(6, 6, 106, '2024-01-15', 'A'),
(7, 7, 107, '2024-01-16', 'B'),
(8, 8, 108, '2024-01-17', 'C'),
(9, 9, 109, '2024-01-18', 'A'),
(10, 10, 110, '2024-01-19', 'B');

SELECT s.first_name, s.last_name, c.course_name
FROM courses_enrollment e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_id = 101;

SELECT * 
FROM Students 
WHERE first_name LIKE '%Ali%';

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Courses c
JOIN courses_enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY total_students DESC;

SELECT course_name, description
FROM Courses
WHERE description LIKE '%database%';

SELECT s.first_name, s.last_name, e.grade
FROM courses_enrollment e
JOIN Students s ON e.student_id = s.student_id
ORDER BY e.grade DESC;
