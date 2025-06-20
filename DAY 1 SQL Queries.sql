#DAY 1
/*
Sample Table Structure
 Table: students
 | id | name         | age | grade | city        |
 |----|--------------|-----|-------|-------------|
 | 1  | Alice Smith  | 15  | 9     | New York    |
 | 2  | Bob Johnson  | 17  | 11    | Chicago     |
 | 3  | Carla Gomez  | 16  | 10    | Los Angeles |
 | 4  | David Lee    | 18  | 12    | New York    |
 | 5  | Emily Davis  | 14  | 8     | Miami       |
 
 Exercise 1: CREATE + INSERT
 Create the 'students' table and insert the above 5 records into it.
 
 Exercise 2: SELECT + WHERE + IN
 Select the names and cities of all students who live in either New York or Miami.
 
 Exercise 3: UPDATE + WHERE + BETWEEN
 Update the grade of all students aged between 15 and 17 to grade 12.
 
 Exercise 4: DELETE + LIKE
 Delete all students whose name starts with 'E'.
 
 Exercise 5: SELECT + ORDER BY + LIMIT
 Display the top 3 youngest students with their name and age, sorted from youngest to oldest
 */
 
 
CREATE TABLE students(
id INT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT,
grade INT NOT NULL,
city VARCHAR(20)
);

INSERT INTO students(id,name,age,grade,city) VALUES
(1,"Alice Smith",15,9,"New York"),
(2,"Bob Jhonson",17,11,"Chicago"),
(3,"Carla Gomez",16,10,"Los Angeles"),
(4,"David Lee",18,12,"New York"),
(5,"Emily Davis",14,8,"Miami");

SELECT * FROM students;

SELECT name,city FROM students 
WHERE city="New York" OR city="Miami";

UPDATE students
SET grade=12
WHERE age BETWEEN 15 AND 17;

DELETE FROM students
WHERE name LIKE "E%";

SELECT name,age FROM students
ORDER BY age ASC LIMIT 3;

SET SQL_SAFE_UPDATES = 0;