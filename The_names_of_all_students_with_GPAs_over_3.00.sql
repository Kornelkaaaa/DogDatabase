-- The names of all students with GPAs over 3.00
SELECT P.PName
FROM PERSON AS P
INNER JOIN STUDENT AS S P.PID = S.PID
WHERE S.SGPA > 3.00;
