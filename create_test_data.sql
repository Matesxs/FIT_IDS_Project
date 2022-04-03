-- Create genres
INSERT INTO genres(name) VALUES ('Test genre1');
INSERT INTO genres(name) VALUES ('Test genre2');
INSERT INTO genres(name) VALUES ('Test genre3');
INSERT INTO genres(name) VALUES ('Test genre4');

-- Create compositions
INSERT INTO compositions(COMPOSITION_NAME, ORIGINAL_COMPOSITION_NAME, LENGTH, CREATION_DATE) VALUES ('Test name', 'Test original name', 142, DATE'2006-02-28');
INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Test name2', 'Test composer', 62, DATE'2014-11-01');
INSERT INTO compositions(COMPOSITION_NAME, LENGTH, CREATION_DATE) VALUES ('Test name3', 362, DATE'2011-08-05');
INSERT INTO compositions(COMPOSITION_NAME, ORIGINAL_COMPOSITION_NAME, LENGTH, CREATION_DATE) VALUES ('Test name4', 'Some original name', 25, DATE'1992-08-02');

-- Create genre collections for compositions
INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (1, 1);
INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (3, 1);
INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (4, 1);

INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (4, 2);

INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (4, 3);
INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (1, 3);

INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (1, 4);

-- Create Albums
INSERT INTO albums(NAME, INTERPRET, PRODUCER, PUBLISHER, LENGTH, DATE_OF_RELEASE) VALUES ('Test album name', 'Test interpret', 'Test producer', 'Test publisher', 204, DATE'2015-02-13');
INSERT INTO albums(NAME, INTERPRET, PUBLISHER, LENGTH, DATE_OF_RELEASE) VALUES ('Test album name2', 'Test interpret2', 'Test publisher2', 87, DATE'2015-08-10');
INSERT INTO albums(NAME, LENGTH, DATE_OF_RELEASE) VALUES ('Test album name3', 25, DATE'2018-01-13');

-- Create composition collections
INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (1, 1);
INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (1, 2);

INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (2, 2);
INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (2, 4);

INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (3, 4);

-- Create carriers
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (1, 1, 0);
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (1, 1, 0);
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (1, 2, 1);
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION, CONDITION_DESCRIPTION) VALUES (1, 2, 2, 'Some condition description');
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (1, 2, 1);

INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (2, 1, 0);
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (2, 1, 2);
INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (2, 3, 1);

-- Create users
INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Test first name', 'Test last name', 'Some random address that will be changed', '123456789', 'test@test.com');
INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL) VALUES ('Test first name2', 'Test last name2', 'Some random address that will be changed2', 'test123@test.com');
INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Test first name3', 'Test last name3', 'Some random address that will be changed3', '4565464645546', 'test3@test.com');
INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL) VALUES ('Test first name4', 'Test last name4', 'Some random address that will be changed4', 'taaaaa@test.cz');
INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Test first name5', 'Test last name5', 'Some random address that will be changed5', '5454455445', 'gdgdsgdgs@gdsdgdsgsdgs.gf');
INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Test first name6', 'Test last name6', 'Some random address that will be changed6', '556745565445', 'gdgdsgdgs@dfzrzr.fff');

-- Register employees
INSERT INTO employees(ID, DATE_OF_ACCEPTANCE, END_OF_EMPLOYMENT_CONTRACT, BANK_ACCOUNT, PERMISSIONS) VALUES (1, DATE'2015-08-01', DATE'2016-08-01', 'Some bank info', 1);
INSERT INTO employees(ID, DATE_OF_ACCEPTANCE, BANK_ACCOUNT, PERMISSIONS) VALUES (2, DATE'2017-11-05', 'Some bank info2', 1);
INSERT INTO employees(ID, DATE_OF_ACCEPTANCE, BANK_ACCOUNT, PERMISSIONS) VALUES (4, DATE'2011-01-11', 'Some bank info3', 5);

-- Create carrier borrow records
INSERT INTO carrier_borrow_records(BORROW_DATE, EXPECTED_RETURN_DATE, BORROWER_ID, CREATED_BY_ID) VALUES (DATE'2017-07-02', DATE'2017-07-09', 3, 4);
INSERT INTO carrier_borrow_records(BORROW_DATE, EXPECTED_RETURN_DATE, BORROWER_ID, CREATED_BY_ID, ACTUAL_RETURN_DATE, ACCEPTED_BY_ID) VALUES (DATE'2013-03-11', DATE'2013-03-25', 6, 1, DATE'2013-04-17', 2);

-- Create carrier collections
INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (1, 1);
INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (3, 1);
INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (8, 1);

INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (2, 2);
INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (6, 2);
INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (7, 2);

commit;
