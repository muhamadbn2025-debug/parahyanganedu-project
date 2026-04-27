
-- ParahyanganEdu SQL Queries & Insights

-- 1. Total enrollments per course
-- Menampilkan jumlah siswa yang mendaftar di setiap course
SELECT c.title, COUNT(e.student_id) AS total_enrolled
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.title
ORDER BY total_enrolled DESC;

-- 2. Enrollment status breakdown
-- Menampilkan jumlah status enrollment (completed, ongoing, dll)
SELECT status, COUNT(*) AS total
FROM enrollments
GROUP BY status;

-- 3. Top cities by students
-- Menampilkan kota dengan jumlah siswa terbanyak
SELECT city, COUNT(*) AS total
FROM students
GROUP BY city
ORDER BY total DESC;

-- 4. Students who completed courses
-- Menampilkan siswa yang telah menyelesaikan course
SELECT s.name, c.title, e.status
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
WHERE e.status = 'completed';

-- 5. Average price per category
-- Menampilkan rata-rata harga course per kategori
SELECT category, ROUND(AVG(price), 0) AS avg_price
FROM courses
GROUP BY category;