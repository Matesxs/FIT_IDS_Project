-- Get information about borrower and borrow itself when its overdue
SELECT
       cbr.ID as borrow_id,
       cbr.BORROWER_ID as borrower_id,
       U.FIRST_NAME as borrower_first_name,
       U.LAST_NAME as borrower_last_name,
       U.EMAIL as borrower_email,
       A2.NAME as album_name,
       cbr.BORROW_DATE as borrow_date
FROM CARRIER_BORROW_RECORDS cbr
    JOIN USERS U on U.ID = cbr.BORROWER_ID
    JOIN CARRIER_COLLECTION CC on cbr.ID = CC.CARRIER_BORROW_RECORD_ID
    JOIN CARRIERS C2 on C2.ID = CC.CARRIER_ID
    JOIN ALBUMS A2 on A2.ID = C2.ALBUM_ID
WHERE
      cbr.ACTUAL_RETURN_DATE IS NULL AND cbr.EXPECTED_RETURN_DATE < CURRENT_DATE