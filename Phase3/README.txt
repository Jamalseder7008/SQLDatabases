Author: Jamal Seder, 
Year: 2022

Helper: Sara Basili (Drop table order!)

UNO Hospital database generation system

To build tables without errors ensure that the tables are created in the following order:
--Physician, Timecard, Nurse, Patient, Bed

To Drop Tables without errors ensure that the tables are dropped in the following order:
--Timecard, Bed, Patient, Nurse, Physician

After creating tables with create table in SQL/SQLDeveloper with proper attributes-

Use Inserter.java to generate insert statements for each of the tables.
There are sample csv files that can be used alongside the Inserter file.

To call inserter, call in terminal with the tablename passed in as an argument directly after.