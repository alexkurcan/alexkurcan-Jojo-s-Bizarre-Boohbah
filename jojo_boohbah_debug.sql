-- Question 1.
SELECT boohbah_id, AVG(sync_level), name
FROM boohbah_stand_link
JOIN boohbah USING (boohbah_id)
GROUP BY boohbah_id, name;

-- Question 2.
SELECT b.name, s.stand_name
FROM boohbah b
JOIN boohbah_stand_link l ON b.boohbah_id = l.boohbah_id
JOIN jojo_stand s ON l.stand_id = s.stand_id;


-- Question 3.
SELECT name, color
FROM boohbah
WHERE energy_level > 80;

-- Question 4.
SELECT b.boohbah_id, l.stand_id
FROM boohbah b
JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2;

-- Question 5.
SELECT name
FROM boohbah b
WHERE energy_level > (SELECT AVG(energy_level)
                      FROM boohbah);

-- Question 6.
SELECT name
FROM boohbah
WHERE energy_level > ALL (SELECT power
                          FROM jojo_stand
                          WHERE season = 3);

-- Question 7.
SELECT b.name, s.stand_name
FROM boohbah b
JOIN jojo_stand s ON b.boohbah_id = s.stand_id
WHERE b.energy_level > 80;

-- Question 8.
SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (SELECT AVG(sync_level)
                    FROM boohbah_stand_link);

-- Question 9.
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN (SELECT boohbah_id, stand_id FROM boohbah_stand_link);

-- Question 10.
MERGE INTO boohbah b
USING jojo_stand s
ON (b.name = s.boohbah_name)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = 999;