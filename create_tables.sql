/*-- Clearing created data
-- Drop table
BEGIN
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'users' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'employees' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'genres' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'compositions' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'genre_collection' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'albums' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'composition_collection' || ' CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

-- Drop seq
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'user_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'genre_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'genre_collection_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'composition_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'album_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'composition_collection_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;
END;
*/

CREATE SEQUENCE user_id_seq START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE genre_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE genre_collection_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE composition_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE composition_collection_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE album_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE carrier_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE carrier_collection_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE carrier_borrow_record_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE users(
    id INT DEFAULT user_id_seq.NEXTVAL PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20) NULL,
    email VARCHAR2(50) NOT NULL CHECK(REGEXP_LIKE (email,'^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'))
);

CREATE TABLE employees(
    id INT PRIMARY KEY,
    date_of_acceptance DATE NOT NULL,
    end_of_employment_contract DATE NULL,
    bank_account VARCHAR2(20) NULL,
    permissions INT DEFAULT 0,

    CONSTRAINT employee_id_fk
        FOREIGN KEY(id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE genres(
    id INT DEFAULT genre_id_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(20) NOT NULL
);

CREATE TABLE compositions(
    id INT DEFAULT composition_id_seq.NEXTVAL PRIMARY KEY,
    composition_name VARCHAR2(100) NOT NULL,
    original_composition_name VARCHAR2(100) NULL,
    composer VARCHAR2(200) NULL,
    length INT NOT NULL,
    creation_date DATE NULL
);

CREATE TABLE genre_collection(
    id INT DEFAULT genre_collection_id_seq.NEXTVAL PRIMARY KEY,
    genre_id INT NOT NULL,
    composition_id INT NOT NULL,

    CONSTRAINT genre_collection_unique_id UNIQUE (genre_id, composition_id),

    CONSTRAINT genre_id_fk
        FOREIGN KEY(genre_id) REFERENCES genres(id)
        ON DELETE CASCADE,

    CONSTRAINT genre_composition_id_fk
        FOREIGN KEY(composition_id) REFERENCES compositions(id)
        ON DELETE CASCADE
);

CREATE TABLE albums(
    id INT DEFAULT album_id_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(200) NOT NULL,
    interpret VARCHAR2(200) NULL,
    producer VARCHAR2(200) NULL,
    publisher VARCHAR2(200) NULL,
    length INT NOT NULL,
    date_of_release DATE NULL
);

CREATE TABLE composition_collection(
    id INT DEFAULT composition_collection_id_seq.NEXTVAL PRIMARY KEY,
    album_id INT NOT NULL,
    composition_id INT NOT NULL,

    CONSTRAINT composition_collection_unique_id UNIQUE (album_id, composition_id),

    CONSTRAINT album_id_fk
        FOREIGN KEY(album_id) REFERENCES albums(id)
        ON DELETE CASCADE,

    CONSTRAINT collection_composition_id_fk
        FOREIGN KEY(composition_id) REFERENCES compositions(id)
        ON DELETE CASCADE
);

CREATE TABLE carriers(
    id INT DEFAULT carrier_id_seq.NEXTVAL PRIMARY KEY,
    album_id INT NOT NULL,

    type INT NOT NULL,
    condition INT DEFAULT 0,
    condition_description VARCHAR2(500) NULL,

    CONSTRAINT carrier_album_id_fk
        FOREIGN KEY(album_id) REFERENCES albums(id)
        ON DELETE CASCADE
);

CREATE TABLE carrier_borrow_records(
    id INT DEFAULT carrier_borrow_record_id_seq.NEXTVAL PRIMARY KEY,

    borrow_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    actual_return_date DATE NULL,

    borrower_id INT NULL,
    created_by_id INT NULL,
    accepted_by_id INT NULL,

    CONSTRAINT carrier_borrow_records_borrower_id_fk
        FOREIGN KEY(borrower_id) REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT carrier_borrow_records_created_by_id_fk
        FOREIGN KEY(created_by_id) REFERENCES employees(id)
        ON DELETE SET NULL,

    CONSTRAINT carrier_borrow_records_accepted_by_id_fk
        FOREIGN KEY(accepted_by_id) REFERENCES employees(id)
        ON DELETE SET NULL
);

CREATE TABLE carrier_collection(
    id INT DEFAULT carrier_collection_id_seq.NEXTVAL PRIMARY KEY,
    carrier_id INT NOT NULL,
    carrier_borrow_record_id INT NOT NULL,

    CONSTRAINT carrier_collection_unique_id UNIQUE (carrier_id, carrier_borrow_record_id),

    CONSTRAINT carrier_collection_carrier_id_fk
        FOREIGN KEY(carrier_id) REFERENCES carriers(id)
        ON DELETE CASCADE,

    CONSTRAINT carrier_collection_carrier_borrow_record_id_fk
        FOREIGN KEY(carrier_borrow_record_id) REFERENCES carrier_borrow_records(id)
        ON DELETE CASCADE
);

COMMIT;
