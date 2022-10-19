-- Create the following database schema and describe how this is a One to Many relationship:

-- Students Table
-- ID (PRIMARY KEY, INT)
-- First_name (VARCHAR)

-- Papers Table
-- Title (VARCHAR)
-- Grade (VARCHAR)
-- Student_id (FOREIGN KEY, INT)

CREATE TABLE students (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100)
);

CREATE TABLE papers (
  title varchar(100),
  grade int,
  student_id int,
  FOREIGN KEY (student_id) REFERENCES students (id)
  ON DELETE CASCADE
);

#Considered a One to Many relationship because one student can have multiple papers, but a paper can only belong to one student.


-- Insert the following data to the schema in order to perform the rest of the challenges:

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Print the name of the first_name student, along with their corresponding paper title, as well as the grade they received. Only include students who turned in papers.
-- Make sure to ORDER BY the grade they received.

SELECT
  first_name,
  title,
  grade
FROM students
INNER JOIN papers
  ON students.id = papers.student_id
ORDER BY grade DESC;


-- Print the first_name of the student, along with their corresponding paper title, and grade only this time, include students who DID NOT have any papers submitted.

SELECT
  first_name,
  title,
  grade
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
ORDER BY grade DESC;

-- Print the first_name of the student, along with their corresponding paper title, and grade, include all students but for the students who did not turn in a paper, 
-- print the string 'MISSING' for their title, and 0 for their grade.

# We can introduce the IFNULL keyword in order to account for students who DID NOT turn any papers in. In turn replacing the NULL value with a 0 for their score.

SELECT
  first_name,
  IFNULL(title, 'MISSING'),
  IFNULL(grade, 0) 
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id;

-- Print the first_name of every student along with their corresponding "average" for all papers submitted.

# For this problem it is necessary to GROUP the students together by their Student ID in order to produce an average grade for all papers submitted. We can then 
# proceed to ORDER BY this average and see the scores in descending order.

 SELECT
  first_name,
  IFNULL(AVG(grade),0) AS average
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
 GROUP BY students.id
 ORDER BY average DESC;

 -- Print the first_name of every student along with their corresponding "grade average" as well as a new column titled passing_status. 
 -- The passing_status column should provide the string of "PASSING" if a student's grade average is 75% or higher. It should provide a string of "FAILING" otherwise.

# We can solve this problem by integrating a CASE statement to introduce logic in order to meet the problem requirements. 

SELECT
  first_name,
  IFNULL(AVG(grade), 0) AS average,
  CASE
    WHEN AVG(grade) >= 75 THEN 'PASSING'
    ELSE 'FAILING'
  END AS passing_status
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;