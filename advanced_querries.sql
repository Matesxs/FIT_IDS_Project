-- Add index for album name (from 12 to 11)
EXPLAIN PLAN FOR
    -- Show who have borrowed carriers with specified album
    SELECT usr.FIRST_NAME, usr.LAST_NAME, C2.ID
    FROM USERS usr
        JOIN CARRIER_BORROW_RECORDS CBR on usr.ID = CBR.BORROWER_ID
        JOIN CARRIER_COLLECTION CC on CBR.ID = CC.CARRIER_BORROW_RECORD_ID
        JOIN CARRIERS C2 on C2.ID = CC.CARRIER_ID
        JOIN ALBUMS A2 on C2.ALBUM_ID = A2.ID
    WHERE A2.NAME = 'The best of Waterflame'
    GROUP BY usr.FIRST_NAME, usr.LAST_NAME, C2.ID;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

CREATE INDEX album_name_index ON ALBUMS(NAME);

EXPLAIN PLAN FOR
    SELECT usr.FIRST_NAME, usr.LAST_NAME, C2.ID
    FROM USERS usr
        JOIN CARRIER_BORROW_RECORDS CBR on usr.ID = CBR.BORROWER_ID
        JOIN CARRIER_COLLECTION CC on CBR.ID = CC.CARRIER_BORROW_RECORD_ID
        JOIN CARRIERS C2 on C2.ID = CC.CARRIER_ID
        JOIN ALBUMS A2 on C2.ALBUM_ID = A2.ID
    WHERE A2.NAME = 'The best of Waterflame'
    GROUP BY usr.FIRST_NAME, usr.LAST_NAME, C2.ID;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());


-- Add index for borrow date (from 5 to 3)
EXPLAIN PLAN FOR
    -- Show number of borrowed carriers by month
    SELECT TO_CHAR(BORROW_DATE, 'YYYY-MM') AS month, COUNT(*)
    FROM CARRIER_BORROW_RECORDS cbr
    GROUP BY TO_CHAR(BORROW_DATE, 'YYYY-MM')
    ORDER BY TO_CHAR(BORROW_DATE, 'YYYY-MM') DESC;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

CREATE INDEX cbr_borrow_date_index ON CARRIER_BORROW_RECORDS(BORROW_DATE);

EXPLAIN PLAN FOR
    SELECT TO_CHAR(BORROW_DATE, 'YYYY-MM') AS month, COUNT(*)
    FROM CARRIER_BORROW_RECORDS cbr
    GROUP BY TO_CHAR(BORROW_DATE, 'YYYY-MM')
    ORDER BY TO_CHAR(BORROW_DATE, 'YYYY-MM') DESC;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());


SELECT
  cbr.ID as borrow_id,
       cbr.BORROWER_ID as borrower_id,
       U.FIRST_NAME as borrower_first_name,
       U.LAST_NAME as borrower_last_name,
       U.EMAIL as borrower_email,
       A2.NAME as album_name,
       C2.ID as carrier_id
    FROM xdousa00.CARRIER_BORROW_RECORDS cbr
        JOIN xdousa00.USERS U on U.ID = cbr.BORROWER_ID
        JOIN xdousa00.CARRIER_COLLECTION CC on cbr.ID = CC.CARRIER_BORROW_RECORD_ID
        JOIN xdousa00.CARRIERS C2 on C2.ID = CC.CARRIER_ID
        JOIN xdousa00.ALBUMS A2 on A2.ID = C2.ALBUM_ID
    WHERE
          cbr.ACTUAL_RETURN_DATE IS NULL AND cbr.EXPECTED_RETURN_DATE < CURRENT_DATE
    ORDER BY cbr.ID;

-- Create materialized view for late returners
CREATE MATERIALIZED VIEW late_returners
    BUILD IMMEDIATE
    REFRESH FORCE
AS
    SELECT
       cbr.ID as borrow_id,
       cbr.BORROWER_ID as borrower_id,
       U.FIRST_NAME as borrower_first_name,
       U.LAST_NAME as borrower_last_name,
       U.EMAIL as borrower_email,
       A2.NAME as album_name,
       C2.ID as carrier_id
    FROM xdousa00.CARRIER_BORROW_RECORDS cbr
        JOIN xdousa00.USERS U on U.ID = cbr.BORROWER_ID
        JOIN xdousa00.CARRIER_COLLECTION CC on cbr.ID = CC.CARRIER_BORROW_RECORD_ID
        JOIN xdousa00.CARRIERS C2 on C2.ID = CC.CARRIER_ID
        JOIN xdousa00.ALBUMS A2 on A2.ID = C2.ALBUM_ID
    WHERE
          cbr.ACTUAL_RETURN_DATE IS NULL AND cbr.EXPECTED_RETURN_DATE < CURRENT_DATE
    ORDER BY cbr.ID;

-- Test if it works
SELECT * FROM late_returners;
