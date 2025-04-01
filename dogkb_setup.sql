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
    DPrice DECIMAL(4,2),
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
(3, 'oszukaj', 88.00, 4),
(4, 'suka', 69.20, 2),
(5, 'fagata', 85.10, 1);

-- Check inserted data
SELECT * FROM PERSON;
SELECT * FROM DOG;
