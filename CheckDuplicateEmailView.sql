CREATE VIEW DuplicateEmails AS
SELECT Email, COUNT(*) as occurrences
FROM PAYMENT
GROUP BY Email
HAVING occurrences > 1;