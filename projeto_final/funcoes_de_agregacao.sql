SELECT 
  b.title,
  COUNT(*) AS total_loans
FROM loans l
JOIN book_copies bc USING(copy_id)
JOIN books b USING(book_id)
GROUP BY b.title
ORDER BY total_loans DESC;

SELECT 
  MIN(loan_date) AS first_loan,
  MAX(loan_date) AS last_loan
FROM loans;

SELECT AVG((due_date - loan_date)) AS avg_loan_duration_days
FROM loans
WHERE return_date IS NOT NULL;

SELECT SUM(
  CASE WHEN status = 'active' THEN 1 ELSE 0 END
) AS total_active_reservations
FROM reservations;
