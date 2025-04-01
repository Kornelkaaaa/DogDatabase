-- The names of all students
SELECT P.PName
FROM PERSON as P
INNER JOIN STUDENT AS S ON P.PID = S.PID
