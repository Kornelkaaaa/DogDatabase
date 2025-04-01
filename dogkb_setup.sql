-- Create the database
CREATE DATABASE DOGkb;

-- Use the newly created database
USE DOGkb;

-- Create PERSON table
CREATE TABLE PERSON (
    PID INT NOT NULL PRIMARY KEY,
    PName VARCHAR(10),
    PDoB DATE
);

-- Create DOG table
CREATE TABLE DOG (
    DID INT NOT NULL PRIMARY KEY,
    DName VARCHAR(10),
    DPrice DECIMAL(5,2),
    PID INT NOT NULL,
    FOREIGN KEY (PID) REFERENCES PERSON(PID)
);

-- Create STUDENT table
CREATE TABLE STUDENT (
    PID INT NOT NULL PRIMARY KEY,
    SGPA DECIMAL(3,2),
    FOREIGN KEY (PID) REFERENCES PERSON(PID)
);

-- Insert data into PERSON
INSERT INTO PERSON (PID, PName, PDoB) VALUES
(1, 'John', '2000-12-14'),
(2, 'Julia', '2005-02-25'),
(3, 'Korin', '2007-07-07'),
(4, 'Marek', '2006-01-15'),
(5, 'Graahn', '1988-11-29');

-- Insert data into DOG
INSERT INTO DOG (DID, DName, DPrice, PID) VALUES
(1, 'Szczeki', 20.59, 5),
(2, 'Tolate', 5.44, 3),
(3, 'how', 88.00, 4),
(4, 'sisi', 69.20, 2),
(5, 'fagat', 85.10, 1);

-- Check inserted data
SELECT * FROM PERSON;
SELECT * FROM DOG;

-- Insert data into STUDENT
INSERT INTO STUDENT (PID, SGPA) VALUES
(3, 4.00),
(4, 2.54), 
(2, 3.84);

-- All dogs worth less than $50.
SELECT D.DName, D.DPrice
FROM DOG as D
WHERE D.DPrice < 50;

-- The names of all students.
SELECT P.PName
FROM PERSON AS P
INNER JOIN STUDENT AS S ON P.PID = S.PID;

-- All people aged 19 or younger.
SELECT * 
FROM PERSON AS P
WHERE P.PDoB > "2006-04-01";

-- The names of all students with GPAs over 3.00
SELECT P.PName, S.SGPA
FROM PERSON AS P
INNER JOIN STUDENT AS S ON P.PID = S.PID
WHERE S.SGPA > 3.00; 

-- All students and their dogs
SELECT P.PName, D.DName
FROM PERSON AS P
INNER JOIN STUDENT AS S ON P.PID = S.PID
LEFT JOIN DOG AS D ON P.PID = D.PID;

--Who owns the most expensive dog, and how much does it cost?
SELECT P.PName, D.DName, D.DPrice
FROM PERSON AS P
INNER JOIN DOG AS D ON P.PID = D.PID
WHERE D.DPrice = 
(SELECT MAX(DPrice)
    FROM DOG);

-- Which students have the highest GPA, and what dogs (if any) do they own?
SELECT P.PName, S.SGPA, D.DName
FROM PERSON AS P
INNER JOIN STUDENT AS S ON P.PID = S.PID
INNER JOIN DOG AS D ON P.PID = D.PID
WHERE S.SGPA = (
    SELECT MAX(SGPA) FROM STUDENT);

--Find all people who do NOT have a student record AND do NOT own any dogs
