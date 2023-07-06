-- The PADS
-- link: https://www.hackerrank.com/challenges/the-pads/problem
-- sulutions:
SELECT CONCAT(o.Name, '(', SUBSTRING(o.OCCUPATION, 1, 1), ')')
FROM OCCUPATIONS o
ORDER BY o.Name;
SELECT CONCAT(
        'There are a total of ',
        total.countO,
        ' ',
        LOWER(total.Name),
        's.'
    )
FROM (
        select o.Occupation AS Name,
            COUNT(o.Occupation) AS countO
        FROM OCCUPATIONS o
        GROUP by o.Occupation
    ) total
order by total.countO,
    total.Name asc;