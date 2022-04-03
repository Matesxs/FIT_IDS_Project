-- Create genres
BEGIN
    INSERT INTO genres(name) VALUES ('Ambient');
    INSERT INTO genres(name) VALUES ('Video game');
    INSERT INTO genres(name) VALUES ('Classical');
    INSERT INTO genres(name) VALUES ('Contemporary');
    INSERT INTO genres(name) VALUES ('Jazz');
END;

-- Create compositions

BEGIN
    -- Volume Alpha songs (24)
    BEGIN
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Key', 'Daniel Rosenfeld', 65, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Door', 'Daniel Rosenfeld', 111, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Subwoofer Lullaby', 'Daniel Rosenfeld', 208, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Death', 'Daniel Rosenfeld', 41, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Living Mice', 'Daniel Rosenfeld', 177, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Moog City', 'Daniel Rosenfeld', 160, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Haggstrom', 'Daniel Rosenfeld', 204, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Minecraft', 'Daniel Rosenfeld', 254, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Oxygène', 'Daniel Rosenfeld', 65, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Équinoxe', 'Daniel Rosenfeld', 114, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Mice on Venus', 'Daniel Rosenfeld', 281, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Dry Hands', 'Daniel Rosenfeld', 68, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Wet Hands', 'Daniel Rosenfeld', 90, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Clark', 'Daniel Rosenfeld', 191, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Chris', 'Daniel Rosenfeld', 87, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Thirteen', 'Daniel Rosenfeld', 176, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Excuse', 'Daniel Rosenfeld', 124, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Sweden', 'Daniel Rosenfeld', 215, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Cat', 'Daniel Rosenfeld', 186, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Dog', 'Daniel Rosenfeld', 145, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Danny', 'Daniel Rosenfeld', 254, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Beginning', 'Daniel Rosenfeld', 102, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Droopy Likes Ricochet', 'Daniel Rosenfeld', 96, '2011');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Droopy Likes Your Face', 'Daniel Rosenfeld', 116, '2011');
    END;


    -- Rachmaninoff symphonies (3)
    BEGIN
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH) VALUES ('Symphony No.1', 'Sergei Rachmaninoff', 2528);
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH) VALUES ('Symphony No.2', 'Sergei Rachmaninoff', 3669);
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH) VALUES ('Symphony No.3', 'Sergei Rachmaninoff', 2523);
    END;


    -- Zelda orchestral (1)
    BEGIN
        INSERT INTO compositions(COMPOSITION_NAME, ORIGINAL_COMPOSITION_NAME, LENGTH, CREATION_DATE) VALUES ('The Legend Of Zelda: výročí 25 let', 'The Legend Of Zelda: 25th Anniversary', 2616, '2011');
    END;


    -- Jack Gibbons album (6)
    BEGIN
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Walking the dog', 'George Gershwin', 261, '1997');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('They cant take that away from me', 'George Gershwin', 287, '2003');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Swanee', 'George Gershwin', 123, '2003');
        INSERT INTO compositions(COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Concerto in F: II. Andante con moto', 'George Gershwin', 651, '1997');
        INSERT INTO compositions(COMPOSITION_NAME, ORIGINAL_COMPOSITION_NAME, COMPOSER, LENGTH, CREATION_DATE) VALUES ('Rhapsody in Blue', 'Rhapsodie v Modrém', 'George Gershwin', 869, '2008');
    END;
END;


-- Create genre collections for compositions

BEGIN
    -- Volume Alpha genres
    BEGIN
        FOR x IN 1..24
        LOOP
            INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (1, x);
            INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (2, x);
        END LOOP;
    END;

    -- Rachmaninoff symphonies genre
    BEGIN
        FOR x IN 25..27 LOOP
            INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (3, x);
        END LOOP;
    END;

    -- Zelda orchestral genres
    BEGIN
        INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (2, 28);
        INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (3, 28);
        INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (4, 28);
    END;

    -- Jack Gibbons album genres
    BEGIN
        FOR x IN 29..33 LOOP
            INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (5, x);
        END LOOP;
    END;

    BEGIN
        INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (3, 32);
        INSERT INTO genre_collection(GENRE_ID, COMPOSITION_ID) VALUES (3, 33);
    END;
END;


-- Create Albums
BEGIN
    -- Volume Alpha album
    INSERT INTO albums(NAME, INTERPRET, PRODUCER, PUBLISHER, LENGTH, DATE_OF_RELEASE) VALUES ('Minecraft – Volume Alpha', 'C418', 'Daniel Rosenfeld', 'self-released', 204, '2011');

    -- Rachmaninoff symphonies album
    INSERT INTO albums(NAME, INTERPRET, PUBLISHER, LENGTH, DATE_OF_RELEASE) VALUES ('Rachmaninoff symphonies 1-3', 'Concertgebouw Orchestra', 'Decca', 8720, '1982');

    -- Zelda orchestral album
    INSERT INTO albums(NAME, PRODUCER, LENGTH) VALUES ('The Legend Of Zelda (Orchestral)', 'Nintendo', 2616);

    -- The video game album
    INSERT INTO albums(NAME, LENGTH) VALUES ('The video game selection', 3439);

    -- Jack gibbons album
    INSERT INTO albums(NAME, INTERPRET, PRODUCER, PUBLISHER, LENGTH, DATE_OF_RELEASE) VALUES ('Gibbons plays Gershwin', 'Jack Gibbons', 'Decca', 'United artists ltd.', 204, '2018');
END;



-- Create composition collections
BEGIN
    -- Volume Alpha album
    BEGIN
        FOR x IN 1..24 LOOP
            INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (1, x);
        END LOOP;
    END;

    -- Rachmaninoff symphonies album
    BEGIN
        FOR x IN 25..27 LOOP
            INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (2, x);
        END LOOP;
    END;

    -- Zelda orchestral album
    BEGIN
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (3, 28);
    END;

    -- The video game album
    BEGIN
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 1);
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 2);
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 3);
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 11);
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 12);
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 13);
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (4, 28);
    END;


    -- Jack Gibbons album
    FOR x IN 29..33 LOOP
        INSERT INTO composition_collection(ALBUM_ID, COMPOSITION_ID) VALUES (5, x);
    END LOOP;
END;


-- Create carriers
BEGIN
    -- Volume Alpha carriers
    BEGIN
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (1, 1, 0);
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (1, 2, 0);
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION, CONDITION_DESCRIPTION) VALUES (1, 2, 2, 'Scratched record');
    END;


    -- Rachmaninoff symphonies carriers
    BEGIN
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION, CONDITION_DESCRIPTION) VALUES (2, 1, 3, 'Scratched disc');
    END;

    -- Zelda orchestral carriers
    BEGIN
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (3, 2, 0);
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (3, 3, 0);
    END;


    -- The video game album carriers
    BEGIN
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION, CONDITION_DESCRIPTION) VALUES (4, 4, 1, 'Missing label');
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (4, 2, 0);
    END;



    -- Jack gibbons album carriers
    BEGIN
        INSERT INTO carriers(ALBUM_ID, TYPE, CONDITION) VALUES (2, 1, 0);
    END;
END;

COMMIT;

--####################################################################################################################
-- Create users
BEGIN
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL) VALUES ('Hieu Minh', 'Do', 'Holešov 52, Holešov, 769 01', 'hieuDoMinh@seznam.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Lukáš', 'Omasta', 'Martinice 89, Martinice, 768 03', '575540441', 'luke.omi@centrum.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Martin', 'Kovář', 'Palackého 14/265, Holešov, 769 01', '753235197', 'markov@centrum.cz');

    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('František', 'Karburátor', 'Holubice 14, Holubice, 722 01', '+420724394725', 'frKar@seznam.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Alžběta', 'Strýčková', 'Jankovice 35, Jankovice, 769 01', '596719535', 'bety.strickova@seznam.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL) VALUES ('Milan', 'Filip', 'Slavkov pod Hostýnem 154, Bystřice pod Hostýnem, 769 02', 'milF@gmail.com');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL) VALUES ('David', 'Jetelina', 'Hulín 39, Hulín, 764 02', 'daveJelito@gmail.com');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL) VALUES ('Martin', 'Horčička', 'Racková 42, Racková, 769 03', 'metin222@seznam.com');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Vladimír', 'Studený', 'Bystřice pod Hostýnem 54/263, Bystřice pod Hostýnem, 769 02', '734658439', 'ladik@seznam.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Marek', 'Tatýrek', 'Jankovice 68, Jankovice, 769 01', '734658439', 'ladik@seznam.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Martin', 'Macháček', 'Hulín 74, Hulín, 764 02', '732374952', 'mar.mach@seznam.cz');
    INSERT INTO users(FIRST_NAME, LAST_NAME, ADDRESS, PHONE_NUMBER, EMAIL) VALUES ('Josef', 'Miklík', 'Palackého 235, Holešov, 769 01', '744567249', 'p.mikl@centrum.cz');
END;

-- Register employees
BEGIN
    INSERT INTO employees(ID, DATE_OF_ACCEPTANCE, END_OF_EMPLOYMENT_CONTRACT, BANK_ACCOUNT, PERMISSIONS) VALUES (1, DATE'2015-08-01', DATE'2016-08-01', '19-2000145399/0800', 1);
    INSERT INTO employees(ID, DATE_OF_ACCEPTANCE, BANK_ACCOUNT, PERMISSIONS) VALUES (2, DATE'2017-11-05', '14-2007186304/0800', 1);
    INSERT INTO employees(ID, DATE_OF_ACCEPTANCE, BANK_ACCOUNT, PERMISSIONS) VALUES (3, DATE'2011-01-11', '14-2007418677/0811', 5);
END;

-- Create carrier borrow records
BEGIN
    INSERT INTO carrier_borrow_records(BORROW_DATE, EXPECTED_RETURN_DATE, BORROWER_ID, CREATED_BY_ID, ACTUAL_RETURN_DATE, ACCEPTED_BY_ID) VALUES (DATE'2013-03-11', DATE'2013-03-25', 4, 2, DATE'2013-04-17', 2);
    INSERT INTO carrier_borrow_records(BORROW_DATE, EXPECTED_RETURN_DATE, BORROWER_ID, CREATED_BY_ID) VALUES (DATE'2022-04-01', DATE'2022-05-01', 6, 2);
    INSERT INTO carrier_borrow_records(BORROW_DATE, EXPECTED_RETURN_DATE, BORROWER_ID, CREATED_BY_ID) VALUES (DATE'2022-03-15', DATE'2022-04-15', 6, 2);
    INSERT INTO carrier_borrow_records(BORROW_DATE, EXPECTED_RETURN_DATE, BORROWER_ID, CREATED_BY_ID) VALUES (DATE'2021-12-18', DATE'2022-01-18', 8, 3);
END;


-- Create carrier collections
BEGIN
    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (1, 1);
    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (5, 1);
    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (6, 1);

    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (9, 2);

    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (8, 3);

    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (4, 4);
    INSERT INTO carrier_collection(CARRIER_ID, CARRIER_BORROW_RECORD_ID) VALUES (6, 4);
END;

COMMIT;
