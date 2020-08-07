SELECT brand, segment, SUM(quantity) quantity
FROM sales
GROUP BY CUBE (brand, segment)
ORDER BY brand, segment

SELECT brand, segment, SUM(quantity) quantity
FROM sales
GROUP BY brand, CUBE(segment)
ORDER BY brand, segment