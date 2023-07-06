-- Ollivander's Inventory
-- link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
-- solution:
SELECT data.id,
    data.age,
    data.coins_needed,
    data.power
FROM (
        SELECT TOP 1 WITH TIES Wands.id AS id,
            Wands_Property.age AS age,
            Wands.coins_needed AS coins_needed,
            Wands.power AS power
        FROM Wands
            LEFT JOIN Wands_Property ON Wands_Property.Code = Wands.Code
        WHERE Wands_Property.is_evil = 0
        order by row_number() over(
                partition by Wands_Property.age,
                Wands.power
                order by Wands.coins_needed
            )
    ) data
ORDER BY data.power DESC,
    data.age DESC;