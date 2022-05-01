-- Get information about borrower and borrow itself when its overdue
SELECT
       cbr.ID as borrow_id,
       cbr.BORROWER_ID as borrower_id,
       U.FIRST_NAME as borrower_first_name,
       U.LAST_NAME as borrower_last_name,
       U.EMAIL as borrower_email,
       A2.NAME as album_name,
       C2.ID as carrier_id
FROM CARRIER_BORROW_RECORDS cbr
    JOIN USERS U on U.ID = cbr.BORROWER_ID
    JOIN CARRIER_COLLECTION CC on cbr.ID = CC.CARRIER_BORROW_RECORD_ID
    JOIN CARRIERS C2 on C2.ID = CC.CARRIER_ID
    JOIN ALBUMS A2 on A2.ID = C2.ALBUM_ID
WHERE
      cbr.ACTUAL_RETURN_DATE IS NULL AND cbr.EXPECTED_RETURN_DATE < CURRENT_DATE
ORDER BY cbr.ID;


-- Show number of borrowed carriers by month
SELECT TO_CHAR(BORROW_DATE, 'YYYY-MM') AS month, COUNT(*)
FROM CARRIER_BORROW_RECORDS cbr
GROUP BY TO_CHAR(BORROW_DATE, 'YYYY-MM')
ORDER BY TO_CHAR(BORROW_DATE, 'YYYY-MM') DESC;


-- Show all carriers, whats on it and number of them
SELECT
    alb.NAME,
    C2.TYPE,
    COUNT(*) AS number_of_carriers
FROM ALBUMS alb
    JOIN CARRIERS C2 on alb.ID = C2.ALBUM_ID
GROUP BY alb.NAME, C2.TYPE
ORDER BY alb.NAME, C2.TYPE;


-- Number of created borrows by employees
SELECT
       usr.FIRST_NAME,
       usr.LAST_NAME,
       COUNT(*) AS created_borrows
FROM EMPLOYEES emp
    JOIN USERS usr on emp.ID = usr.ID
    JOIN CARRIER_BORROW_RECORDS CBR on emp.ID = CBR.CREATED_BY_ID
GROUP BY usr.FIRST_NAME, usr.LAST_NAME;


-- Get information about carriers that were never borrowed
SELECT
       alb.NAME AS album_name,
       C2.ID AS carrier_id,
       C2.TYPE AS carrier_type
FROM ALBUMS alb
    JOIN CARRIERS C2 on alb.ID = C2.ALBUM_ID
WHERE NOT EXISTS
    (
        SELECT CBR.ID
        FROM ALBUMS alb2
            JOIN CARRIERS C2 on alb2.ID = C2.ALBUM_ID
            JOIN CARRIER_COLLECTION CC on C2.ID = CC.CARRIER_ID
            JOIN CARRIER_BORROW_RECORDS CBR on CBR.ID = CC.CARRIER_BORROW_RECORD_ID
        WHERE alb2.ID = alb.ID
    );


-- Display relevant albums to user by older borrows
SELECT DISTINCT
                C6.ID,
                C6.TYPE,
                C6.CONDITION,
                alb2.NAME
FROM ALBUMS alb2
    JOIN CARRIERS C6 on alb2.ID = C6.ALBUM_ID
    JOIN COMPOSITION_COLLECTION CC on alb2.ID = CC.ALBUM_ID
    JOIN COMPOSITIONS C2 on C2.ID = CC.COMPOSITION_ID
    JOIN GENRE_COLLECTION GC on C2.ID = GC.COMPOSITION_ID
    JOIN GENRES G on G.ID = GC.GENRE_ID
WHERE G.NAME IN(
        SELECT DISTINCT G2.NAME
        FROM ALBUMS alb
            JOIN COMPOSITION_COLLECTION CC2 on alb.ID = CC2.ALBUM_ID
            JOIN COMPOSITIONS C3 on C3.ID = CC2.COMPOSITION_ID
            JOIN GENRE_COLLECTION GC2 on C3.ID = GC2.COMPOSITION_ID
            JOIN GENRES G2 on GC2.GENRE_ID = G2.ID
            JOIN CARRIERS C4 on alb.ID = C4.ALBUM_ID
            JOIN CARRIER_COLLECTION CC3 on C4.ID = CC3.CARRIER_ID
            JOIN CARRIER_BORROW_RECORDS CBR on CC3.CARRIER_BORROW_RECORD_ID = CBR.ID
        WHERE CBR.BORROWER_ID = 4
    )
    AND alb2.NAME NOT IN(
        SELECT alb3.NAME
        FROM ALBUMS alb3
            JOIN CARRIERS C5 on alb3.ID = C5.ALBUM_ID
            JOIN CARRIER_COLLECTION CC4 on C5.ID = CC4.CARRIER_ID
            JOIN CARRIER_BORROW_RECORDS R on CC4.CARRIER_BORROW_RECORD_ID = R.ID
        WHERE R.BORROWER_ID = 4
    )
    GROUP BY C6.ID, C6.TYPE, C6.CONDITION, alb2.NAME;