-- RENTING_EMP (EMP_ID, NAME, ADDRESS, EMP_PNUM, DATE_OF_BIRTH, START_DATE,
--     BASE_SALARY, COMMISSION_RATE, YEARLY_SALES);
-- CUSTOMERS (CUS_NAME, ADDRESS, CUS_ID, BUDGET, CARRIER, CUS_PNUM, EMP_ID);
--  VEHICLES (CAR_ID, OPTIONS, PRICE_WIHTOUT_CUSTOMS, TRANSMISSION_TYPE, NUM_OF_PASS, PETROL_TYPE, CAR_MODEL, CAR_COLOR, NUM_OF_DOORS, CAR_BRAND, RENT_PRICE, EMP_ID, year);
-- rent (CAR_ID, CUS_ID, rent_ID, rent date, return date, EMP_ID, price);
--  payment (CAR_ID, cus_id, PAY_DATE, price, pay_id); 

create database dataproject;

use dataproject;

CREATE TABLE RENTING_EMP (
    EMP_ID INT PRIMARY KEY,
    NAME VARCHAR(30),
    ADDRESS VARCHAR(30),
    EMP_PNUM INT,
    DATE_OF_BIRTH DATE,
    START_DATE DATE,
    BASE_SALARY INT,
    COMMISSION_RATE REAL,
    YEARLY_SALES INT
);
CREATE TABLE CUSTOMERS (
    CUS_NAME VARCHAR(30),
    ADDRESS VARCHAR(30),
    CUS_ID INT PRIMARY KEY,
    BUDGET INT,
    CARRIER VARCHAR(20),
    CUS_PNUM INT,
    EMP_ID INT,
    FOREIGN KEY (EMP_ID)
        REFERENCES RENTING_EMP (EMP_ID)
);
CREATE TABLE VEHICLES (
    CAR_ID INT PRIMARY KEY,
    OPTIONS VARCHAR(50),
    PRICE_WIHTOUT_CUSTOMS INT,
    TRANSMISSION_TYPE CHAR,
    NUM_OF_PASS INT,
    PETROL_TYPE CHAR,
    CAR_MODEL VARCHAR(30),
    CAR_COLOR VARCHAR(20),
    NUM_OF_DOORS INT,
    CAR_BRAND VARCHAR(30),
    RENT_PRICE INT,
    EMP_ID INT,
    year INT,
    FOREIGN KEY (EMP_ID)
        REFERENCES RENTING_EMP (EMP_ID)
);

CREATE TABLE rent (
    CAR_ID INT,
    CUS_ID INT,
    rent_ID INT AUTO_INCREMENT PRIMARY KEY,
    rent_date DATE,
    return_date DATE,
    emp_id INT,
    price REAL,
    FOREIGN KEY (cus_ID)
        REFERENCES customers (cus_id)
        ON DELETE CASCADE,
    FOREIGN KEY (emp_id)
        REFERENCES RENTING_EMP (emp_id)
        ON DELETE CASCADE,
    FOREIGN KEY (CAR_ID)
        REFERENCES VEHICLES (CAR_ID)
        ON DELETE CASCADE
);

CREATE TABLE payment (
    CAR_ID INT,
    cus_id INT,
    PAY_DATE DATE,
    price REAL,
    pay_id INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (CAR_ID)
        REFERENCES VEHICLES (CAR_ID),
    FOREIGN KEY (cus_ID)
        REFERENCES customers (cus_id)
        ON DELETE CASCADE
);





