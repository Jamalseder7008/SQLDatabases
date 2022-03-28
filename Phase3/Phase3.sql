--Hospital schema with Sample data
DROP table TIMECARD;
DROP table PHYSICIAN;
DROP table PATIENT;
DROP table BED;
DROP table NURSE;

--This structuring is the exact structuring to use to populate the database
--Physician, Timecard, Nurse, Patient, Bed
CREATE TABLE PHYSICIAN(
    D_ID VARCHAR2(3),
    D_NAME VARCHAR2(25) NOT NULL,
    D_SPECIALTY VARCHAR2(20),
        CONSTRAINT PHYSICIAN_PK PRIMARY KEY(D_ID) 
);

CREATE TABLE TIMECARD(
    D_ID VARCHAR2(3),
    T_DATE DATE,
    T_HOURS NUMBER(2),
        CONSTRAINT TIMECARD_PK PRIMARY KEY(D_ID, T_DATE)
);

CREATE TABLE NURSE(
    N_ID VARCHAR2(3),
    N_NAME VARCHAR2(25) NOT NULL,
    N_SALARY NUMBER(7),
    SUPERVISOR_ID VARCHAR2(3),
        CONSTRAINT NURSE_PK PRIMARY KEY(N_ID),
        CONSTRAINT SUPERVISOR_ID FOREIGN KEY(N_ID) REFERENCES NURSE(N_ID)
);

CREATE TABLE PATIENT(
    P_NUMBER VARCHAR2(3),
    P_NAME VARCHAR2(25) NOT NULL,
    P_AGE NUMBER(3),
    D_ID VARCHAR2(3),
        CONSTRAINT PATIENT_PK PRIMARY KEY(P_NUMBER),
        CONSTRAINT PHYSICIAN_FK FOREIGN KEY(D_ID) REFERENCES PHYSICIAN(D_ID)
);

CREATE TABLE BED(
    B_NUMBER VARCHAR2(3),
    R_NUMBER NUMBER(4),
    UNIT VARCHAR2(25),
    P_NUMBER VARCHAR2(3),
    N_ID VARCHAR2(3),
        CONSTRAINT BED_PK PRIMARY KEY(B_NUMBER),
        CONSTRAINT PATIENT_FK FOREIGN KEY(P_NUMBER) REFERENCES PATIENT(P_NUMBER),
        CONSTRAINT NURSE_FK FOREIGN KEY(N_ID) REFERENCES NURSE(N_ID)
);

--Physician/doctor insert statements
INSERT INTO physician VALUES('D01', 'Will Smith', 'Dermatology');
INSERT INTO physician VALUES('D02', 'Margot Robbie', 'Anesthesiology');
INSERT INTO physician VALUES('D03', 'Ryan Gosling', 'Family Medicine');
INSERT INTO physician VALUES('D04', 'Dwayne Johnson', 'Surgery');
INSERT INTO physician VALUES('D05', 'Emma Stone', 'Internal medicine');
INSERT INTO physician VALUES('D06', 'Tom Hanks', 'Dermatology');
INSERT INTO physician VALUES('D07', 'Idris Elba', 'Anesthesiology');
INSERT INTO physician VALUES('D08', 'Gal Gadot', 'Family Medicine');
INSERT INTO physician VALUES('D09', 'Will Ferrell', 'Internal medicine');
INSERT INTO physician VALUES('D10', 'Chris Evans', 'Dermatology');
INSERT INTO physician VALUES('D11', 'Jamie Foxx', 'Surgery');
INSERT INTO physician VALUES('D12', 'Tom Hardy', 'Anesthesiology');
commit;

--Timecard insert statements
INSERT INTO timecard VALUES('D01', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D02', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D03', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D04', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D05', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D06', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D07', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D08', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D09', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D10', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D11', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D12', '31-Jan-22', 8);
INSERT INTO timecard VALUES('D01', '5-Feb-22', 7);
INSERT INTO timecard VALUES('D02', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D03', '5-Feb-22', 10);
INSERT INTO timecard VALUES('D04', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D05', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D06', '5-Feb-22', 5);
INSERT INTO timecard VALUES('D07', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D08', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D09', '5-Feb-22', 4);
INSERT INTO timecard VALUES('D10', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D11', '5-Feb-22', 3);
INSERT INTO timecard VALUES('D12', '5-Feb-22', 8);
INSERT INTO timecard VALUES('D01', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D02', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D03', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D04', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D05', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D06', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D07', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D08', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D09', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D10', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D11', '3-Mar-22', 8);
INSERT INTO timecard VALUES('D12', '3-Mar-22', 8);
commit;

--Nurse insert statements
INSERT INTO nurse VALUES('N01', 'John Nicklow', 120000, NULL);
INSERT INTO nurse VALUES('N03', 'Chris Summa', 88000, 'N01');
INSERT INTO nurse VALUES('N05', 'Vassil Roussev', 90000, 'N01');
INSERT INTO nurse VALUES('N09', 'Tamjid Hoque', 88000, 'N01');
INSERT INTO nurse VALUES('N02', 'James Wagner', 75000, 'N05');
INSERT INTO nurse VALUES('N04', 'Ben Samuel', 79000, 'N03');
INSERT INTO nurse VALUES('N06', 'Sam Hoyt', 82000, 'N03');
INSERT INTO nurse VALUES('N07', 'Ted Holmberg', 81000, 'N05');
INSERT INTO nurse VALUES('N08', 'Matt Toups', 80000, 'N09');
INSERT INTO nurse VALUES('N10', 'Hyunguk Yoo', 80000, 'N09');
commit;

--Patient insert statements
INSERT INTO patient VALUES('P01', 'Taylor Swift', 32, 'D01');
INSERT INTO patient VALUES('P02', 'Bruno Mars', 31, 'D04');
INSERT INTO patient VALUES('P03', 'Justin Bieber', 29, 'D07');
INSERT INTO patient VALUES('P04', 'Adele', 34, 'D10');
INSERT INTO patient VALUES('P05', 'Lady Gaga', 35, 'D02');
INSERT INTO patient VALUES('P06', 'Katy Perry', 33, 'D05');
INSERT INTO patient VALUES('P07', 'Rihanna', 34, 'D08');
INSERT INTO patient VALUES('P08', 'Snoop Dogg', 45, 'D11');
INSERT INTO patient VALUES('P09', 'Ariana Grande', 27, 'D12');
INSERT INTO patient VALUES('P10', 'Alicia Keys', 36, 'D01');
INSERT INTO patient VALUES('P11', 'Post Malone', 29, 'D02');
INSERT INTO patient VALUES('P12', 'Beyonce', 37, 'D05');
INSERT INTO patient VALUES('P13', 'Britney Spears', 38, 'D08');
commit;

--Bed insert statements
INSERT INTO bed VALUES('B01', 101, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B02', 102, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B03', 103, 'Intensive Care Unit', 'P01', 'N03');
INSERT INTO bed VALUES('B04', 104, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B05', 105, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B06', 106, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B07', 107, 'Intensive Care Unit', 'P04', 'N09');
INSERT INTO bed VALUES('B08', 108, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B09', 109, 'Intensive Care Unit', 'P07', 'N02');
INSERT INTO bed VALUES('B10', 110, 'Intensive Care Unit', NULL, NULL);
INSERT INTO bed VALUES('B11', 201, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B12', 202, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B13', 203, 'Surgery', 'P13', 'N03');
INSERT INTO bed VALUES('B14', 204, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B15', 206, 'Surgery', 'P03', 'N04');
INSERT INTO bed VALUES('B16', 207, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B17', 208, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B18', 206, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B19', 207, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B20', 208, 'Surgery', NULL, NULL);
INSERT INTO bed VALUES('B21', 1001, 'Rehabilitation', NULL, NULL);
INSERT INTO bed VALUES('B22', 1011, 'Rehabilitation', NULL, NULL);
INSERT INTO bed VALUES('B23', 1022, 'Rehabilitation', NULL, NULL);
INSERT INTO bed VALUES('B24', 1033, 'Rehabilitation', 'P09', 'N04');
INSERT INTO bed VALUES('B25', 1045, 'Rehabilitation', NULL, NULL);
INSERT INTO bed VALUES('B26', 1203, 'Long-Term Care', NULL, NULL);
INSERT INTO bed VALUES('B27', 1212, 'Long-Term Care', NULL, NULL);
INSERT INTO bed VALUES('B28', 1224, 'Long-Term Care', 'P11', 'N04');
INSERT INTO bed VALUES('B29', 1233, 'Long-Term Care', NULL, NULL);
INSERT INTO bed VALUES('B30', 1250, 'Long-Term Care', NULL, NULL);
commit;
