SELECT
  b.title,
  a.first_name || ' ' || a.last_name AS author,
  p.name AS publisher
FROM books b
INNER JOIN authors a 
  ON b.author_id = a.author_id
INNER JOIN publishers p 
  ON b.publisher_id = p.publisher_id;

SELECT
  bc.copy_id,
  b.title,
  m.full_name AS member,
  l.loan_date,
  l.due_date
FROM loans l
INNER JOIN book_copies bc 
  ON l.copy_id = bc.copy_id
INNER JOIN books b 
  ON bc.book_id = b.book_id
INNER JOIN members m 
  ON l.member_id = m.member_id;

SELECT
  r.reservation_id,
  b.title,
  lb.name AS branch,
  r.reservation_date
FROM reservations r
INNER JOIN book_copies bc 
  ON r.copy_id = bc.copy_id
INNER JOIN books b 
  ON bc.book_id = b.book_id
INNER JOIN library_branches lb 
  ON bc.branch_id = lb.branch_id
WHERE r.status = 'active';

SELECT
  m.member_id,
  m.full_name,
  COUNT(l.loan_id) AS total_loans
FROM members m
LEFT JOIN loans l 
  ON m.member_id = l.member_id
GROUP BY m.member_id, m.full_name
ORDER BY total_loans DESC;

SELECT 
  bc.copy_id,
  b.title,
  l.loan_id,
  l.loan_date
FROM book_copies bc
RIGHT JOIN loans l 
  ON bc.copy_id = l.copy_id
JOIN books b 
  ON bc.book_id = b.book_id
LIMIT 20;

SELECT 
  COALESCE(l.loan_id, r.reservation_id) AS movement_id,
  l.loan_date,
  r.reservation_date,
  CASE 
    WHEN l.loan_id IS NOT NULL THEN 'Loan'
    WHEN r.reservation_id IS NOT NULL THEN 'reservation'
    ELSE 'unknown'
  END AS type
FROM loans l
FULL JOIN reservations r 
  ON l.copy_id = r.copy_id
    AND l.member_id = r.member_id
ORDER BY movement_id
LIMIT 50;

WITH member_reservations AS (
  SELECT 
    m.member_id,
    m.full_name,
    COUNT(r.reservation_id) AS reservations_count
  FROM members m
  JOIN reservations r USING(member_id)
  GROUP BY m.member_id, m.full_name
)
SELECT 
  mr.full_name,
  mr.reservations_count,
  b.title AS most_reserved_title
FROM member_reservations mr
JOIN (
  SELECT 
    r.member_id,
    r.copy_id,
    COUNT(*) AS cnt
  FROM reservations r
  GROUP BY r.member_id, r.copy_id
  ORDER BY cnt DESC
  LIMIT 5
) top5 USING(member_id)
JOIN book_copies bc 
  ON top5.copy_id = bc.copy_id
JOIN books b 
  ON bc.book_id = b.book_id
ORDER BY mr.reservations_count DESC;

SELECT 
  g.name AS genre,
  lb.name AS branch,
  COUNT(bc.*) AS available_copies
FROM genres g
JOIN books b USING(genre_id)
JOIN book_copies bc 
  ON b.book_id = bc.book_id
JOIN library_branches lb 
  ON bc.branch_id = lb.branch_id
WHERE bc.status = 'available'
GROUP BY g.name, lb.name
ORDER BY g.name, lb.name;

SELECT 
  lib.full_name AS librarian,
  lb.name AS branch,
  COUNT(l.loan_id) AS loans_processed
FROM librarians lib
JOIN library_branches lb USING(branch_id)
JOIN book_copies bc 
  ON bc.branch_id = lb.branch_id
JOIN loans l 
  ON l.copy_id = bc.copy_id
GROUP BY lib.full_name, lb.name
ORDER BY loans_processed DESC
LIMIT 10;
