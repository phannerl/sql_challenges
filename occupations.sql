-- Occupations
-- link: https://www.hackerrank.com/challenges/occupations/problem
-- solution:
SELECT d.Name,
    p.Name,
    s.Name,
    a.Name
FROM (
        SELECT row_number() OVER (
                ORDER BY Name
            ) n,
            Name
        FROM OCCUPATIONS
        WHERE Occupation = 'Doctor'
    ) d
    FULL JOIN (
        SELECT row_number() OVER (
                ORDER BY Name
            ) n,
            Name
        FROM OCCUPATIONS
        WHERE Occupation = 'Professor'
    ) p ON p.n = d.n
    FULL JOIN (
        SELECT row_number() OVER (
                ORDER BY Name
            ) n,
            Name
        FROM OCCUPATIONS
        WHERE Occupation = 'Singer'
    ) s ON p.n = s.n
    FULL JOIN (
        SELECT row_number() OVER (
                ORDER BY Name
            ) n,
            Name
        FROM OCCUPATIONS
        WHERE Occupation = 'Actor'
    ) a ON p.n = a.n;