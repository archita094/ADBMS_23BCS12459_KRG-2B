
--EASY

CREATE TABLE AUTHOR_DETAILS(
	authID INT,
	authName VARCHAR(100),
	authCountry VARCHAR(100)
)

CREATE TABLE BOOK_DETAILS(
	bookTitle VARCHAR(100),
	authID INT
)

INSERT INTO AUTHOR_DETAILS(authID, authName, authCountry) VALUES
(1, 'Mario Puzo', 'USA'),
(2, 'Shashi Tharoor', 'India'),
(3, 'by J. K. Rowling', 'United Kingdom')

INSERT INTO BOOK_DETAILS(bookTitle, authID) VALUES
('The Godfather', 1),
('The Hindu Way', 2),
('Harry Potter and the Goblet of Fire', 3),
('Harry Potter and the Order of the Phoenix', 3)

SELECT B.bookTitle AS [Book Title], A.authName AS [Author Name], A.authCountry AS [Author Country]
FROM AUTHOR_DETAILS AS A
INNER JOIN
BOOK_DETAILS AS B
ON
A.authID = B.authID


--MEDIUM

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Biology'),
(5, 'English');

INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(101, 'Data Structures', 1),
(102, 'Algorithms', 1),
(103, 'Operating Systems', 1),
(104, 'Linear Algebra', 2),
(105, 'Calculus', 2),
(106, 'Quantum Mechanics', 3),
(107, 'Classical Mechanics', 3),
(108, 'Genetics', 4),
(109, 'English Language', 5),
(110, 'English Literature', 5);

SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Courses
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);

GRANT SELECT ON Courses TO readonly_user;
