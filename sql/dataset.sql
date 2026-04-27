-- ParahyanganEdu Database
-- Author: Muhamad Awod
-- Dibimbing.id Bootcamp 2026

CREATE DATABASE IF NOT EXISTS parahyanganedu;
USE parahyanganedu;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50),
    joined_at DATE
);

INSERT INTO students (name, email, city, joined_at) VALUES
('Asep Sunarya', 'asep@example.com', 'Bandung', '2024-01-10'),
('Nur Azizah', 'nur@example.com', 'Bandung', '2024-01-15'),
('Dadang Komarudin', 'dadang@example.com', 'Bandung', '2024-02-01'),
('Siti Rahayu', 'siti@example.com', 'Cimahi', '2024-02-10'),
('Rizki Maulana', 'rizki@example.com', 'Bandung', '2024-03-01');

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    instructor VARCHAR(100),
    duration_hours INT,
    price DECIMAL(10,2)
);

INSERT INTO courses (title, category, instructor, duration_hours, price) VALUES
('Fullstack Web Development', 'Web Development', 'Andi Pratama', 120, 2500000),
('UI UX Design Masterclass', 'Design', 'Siti Rahma', 60, 1500000),
('Advanced JavaScript', 'Web Development', 'Budi Santoso', 80, 1800000),
('Data Science with Python', 'Data Science', 'Rizki Nugraha', 90, 2000000),
('Mobile App with Flutter', 'Mobile Dev', 'Candra Wijaya', 80, 1800000);

CREATE TABLE enrollments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at DATE,
    status ENUM('active', 'completed', 'dropped') DEFAULT 'active',
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO enrollments (student_id, course_id, enrolled_at, status) VALUES
(1, 1, '2024-01-12', 'completed'),
(1, 3, '2024-02-01', 'active'),
(2, 2, '2024-01-16', 'completed'),
(3, 1, '2024-02-05', 'active'),
(4, 4, '2024-02-12', 'completed'),
(5, 5, '2024-03-01', 'active');
