-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-05-29 23:19:10 AEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Booking
  (
    Trip_ID               NUMBER (6) NOT NULL ,
    Pick_Time             DATE NOT NULL ,
    Drop_Time             DATE NOT NULL ,
    Intened_drop_off_time NUMBER (2) NOT NULL ,
    Regist_No             CHAR (9) NOT NULL ,
    Location_ID           NUMBER (8) NOT NULL ,
    Location_ID2          NUMBER (8) NOT NULL ,
    Driver_ID             NUMBER (7) NOT NULL ,
    Official_ID           CHAR (9) NOT NULL
  ) ;
COMMENT ON COLUMN Booking.Trip_ID
IS
  'Every trip has a unique ID' ;
  COMMENT ON COLUMN Booking.Pick_Time
IS
  'Intened pick up time' ;
  COMMENT ON COLUMN Booking.Drop_Time
IS
  'Intened drop off time' ;
  COMMENT ON COLUMN Booking.Intened_drop_off_time
IS
  'The amount of passengers booked for a vehicle' ;
  COMMENT ON COLUMN Booking.Regist_No
IS
  'Every vehicle has a registration number,it''s unique.' ;
  COMMENT ON COLUMN Booking.Location_ID
IS
  'Every location has a unique ID' ;
  COMMENT ON COLUMN Booking.Location_ID2
IS
  'Every location has a unique ID' ;
  COMMENT ON COLUMN Booking.Driver_ID
IS
  'Every driver has a unique ID' ;
  COMMENT ON COLUMN Booking.Official_ID
IS
  'Each official has unique Olympic ID' ;
ALTER TABLE Booking ADD CONSTRAINT Booking_PK PRIMARY KEY ( Trip_ID ) ;


CREATE TABLE Completion
  (
    Driver_ID NUMBER (7) NOT NULL ,
    Module_ID CHAR (10) NOT NULL
  ) ;
COMMENT ON COLUMN Completion.Driver_ID
IS
  'Every driver has a unique ID' ;
  COMMENT ON COLUMN Completion.Module_ID
IS
  'There is an compulsary module to be completed to be a driver of OT, there are also other optional modules to be chosed.' ;
ALTER TABLE Completion ADD CONSTRAINT Completion_PK PRIMARY KEY ( Driver_ID, Module_ID ) ;


CREATE TABLE Driver
  (
    Driver_ID          NUMBER (7) NOT NULL ,
    Driver_Fname       VARCHAR2 (20) NOT NULL ,
    Driver_Lname       VARCHAR2 (20) NOT NULL ,
    Birthday           DATE NOT NULL ,
    Licence_No         CHAR (19) NOT NULL ,
    Level_of_Clearance NUMBER (2) NOT NULL ,
    Suspension         CHAR (10) NOT NULL ,
    Module_Count       NUMBER (2) NOT NULL
  ) ;
COMMENT ON COLUMN Driver.Driver_ID
IS
  'Every driver has a unique ID' ;
  COMMENT ON COLUMN Driver.Driver_Fname
IS
  'Driver''s first name' ;
  COMMENT ON COLUMN Driver.Driver_Lname
IS
  'Driver''s last name' ;
  COMMENT ON COLUMN Driver.Birthday
IS
  'Date of birth of a driver' ;
  COMMENT ON COLUMN Driver.Licence_No
IS
  'The number of licence certificated to a driver' ;
  COMMENT ON COLUMN Driver.Level_of_Clearance
IS
  'A driver has the level of clearance, the level are digits from 1 to 4, 4 is the highest level' ;
  COMMENT ON COLUMN Driver.Suspension
IS
  'When a driver is in a suspension due to issues, he can not driver any OT vehicle.' ;
  COMMENT ON COLUMN Driver.Module_Count
IS
  'Total number of modules a driver has completed' ;
ALTER TABLE Driver ADD CONSTRAINT Driver_PK PRIMARY KEY ( Driver_ID ) ;


CREATE TABLE Feature
  (
    Make     CHAR (10) NOT NULL ,
    Model    VARCHAR2 (20) NOT NULL ,
    Seats_No NUMBER (2) NOT NULL ,
    Feature  VARCHAR2 (50) NOT NULL
  ) ;
COMMENT ON COLUMN Feature.Make
IS
  'The manufacturer of the vehicle' ;
  COMMENT ON COLUMN Feature.Model
IS
  'Every maker provides different models of vehicles,vehicles of same model have same features' ;
  COMMENT ON COLUMN Feature.Seats_No
IS
  'The amount of seats of a vehicle' ;
  COMMENT ON COLUMN Feature.Feature
IS
  'The styles and characters of a vehicle, it is decided by model' ;
ALTER TABLE Feature ADD CONSTRAINT Feature_PK PRIMARY KEY ( Make, Model ) ;


CREATE TABLE Language
  (
    Language_Code CHAR (3) NOT NULL ,
    Language      VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Language.Language_Code
IS
  'Every language use the ISO639-1 two-character language code,it''s unique' ;
  COMMENT ON COLUMN Language.Language
IS
  'Name of the language' ;
ALTER TABLE Language ADD CONSTRAINT Language_PK PRIMARY KEY ( Language_Code ) ;


CREATE TABLE Location
  (
    Location_ID   NUMBER (8) NOT NULL ,
    Location_name VARCHAR2 (50) NOT NULL ,
    Location_Type VARCHAR2 (20) NOT NULL ,
    Address       VARCHAR2 (50) NOT NULL
  ) ;
COMMENT ON COLUMN Location.Location_ID
IS
  'Every location has a unique ID' ;
  COMMENT ON COLUMN Location.Location_name
IS
  'Name of a location' ;
  COMMENT ON COLUMN Location.Location_Type
IS
  'Locations are classified to different types.eg.hotel,library' ;
  COMMENT ON COLUMN Location.Address
IS
  'Address of a location includes street, number, town' ;
ALTER TABLE Location ADD CONSTRAINT Location_PK PRIMARY KEY ( Location_ID ) ;


CREATE TABLE Maintenance_Repair
  (
    Type       CHAR (12) NOT NULL ,
    Start_Date DATE NOT NULL ,
    Cost       NUMBER (10) NOT NULL ,
    Details    VARCHAR2 (50) NOT NULL ,
    Regist_No  CHAR (9) NOT NULL
  ) ;
COMMENT ON COLUMN Maintenance_Repair.Type
IS
  'Maintenance or repair' ;
  COMMENT ON COLUMN Maintenance_Repair.Start_Date
IS
  'Start date when the vehicle is maintenance or repair is started' ;
  COMMENT ON COLUMN Maintenance_Repair.Cost
IS
  'The final cost of the maintenance or repair' ;
  COMMENT ON COLUMN Maintenance_Repair.Details
IS
  'The description of the action when maintenaned or repired.' ;
  COMMENT ON COLUMN Maintenance_Repair.Regist_No
IS
  'Every vehicle has a registration number,it''s unique.' ;
ALTER TABLE Maintenance_Repair ADD CONSTRAINT Maintenance_Repair_PK PRIMARY KEY ( Type, Start_Date, Regist_No ) ;


CREATE TABLE Module
  (
    Module_ID          CHAR (10) NOT NULL ,
    Module_Name        VARCHAR2 (20) NOT NULL ,
    Duration           NUMBER (2) NOT NULL ,
    Date_of_Completion DATE NOT NULL
  ) ;
COMMENT ON COLUMN Module.Module_ID
IS
  'There is an compulsary module to be completed to be a driver of OT, there are also other optional modules to be chosed.' ;
  COMMENT ON COLUMN Module.Module_Name
IS
  'Name of a training module.' ;
  COMMENT ON COLUMN Module.Duration
IS
  'The number of days of a training module ' ;
  COMMENT ON COLUMN Module.Date_of_Completion
IS
  'The date of a driver completing a module' ;
ALTER TABLE Module ADD CONSTRAINT Module_PK PRIMARY KEY ( Module_ID ) ;


CREATE TABLE Official
  (
    Official_ID     CHAR (9) NOT NULL ,
    Official_Lname  VARCHAR2 (20) NOT NULL ,
    Officail_Fname  VARCHAR2 (20) NOT NULL ,
    Prefer_Language VARCHAR2 (20) NOT NULL ,
    Country         VARCHAR2 (20) NOT NULL ,
    Role            VARCHAR2 (20) NOT NULL ,
    Language_Code   CHAR (3) NOT NULL
  ) ;
COMMENT ON COLUMN Official.Official_ID
IS
  'Each official has unique Olympic ID' ;
  COMMENT ON COLUMN Official.Official_Lname
IS
  'Official''s last name' ;
  COMMENT ON COLUMN Official.Officail_Fname
IS
  'First Name of an officail' ;
  COMMENT ON COLUMN Official.Prefer_Language
IS
  'Every officail has a single preferred language' ;
  COMMENT ON COLUMN Official.Country
IS
  'The nation where the official is from' ;
  COMMENT ON COLUMN Official.Role
IS
  'The title of an official' ;
  COMMENT ON COLUMN Official.Language_Code
IS
  'Every language use the ISO639-1 two-character language code,it''s unique' ;
CREATE UNIQUE INDEX Official__IDX ON Official
  (
    Language_Code ASC
  )
  ;
ALTER TABLE Official ADD CONSTRAINT Official_PK PRIMARY KEY ( Official_ID ) ;


CREATE TABLE Own_Feture
  (
    Regist_No CHAR (9) NOT NULL ,
    Make      CHAR (10) NOT NULL ,
    Model     VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Own_Feture.Regist_No
IS
  'Every vehicle has a registration number,it''s unique.' ;
  COMMENT ON COLUMN Own_Feture.Make
IS
  'The manufacturer of the vehicle' ;
  COMMENT ON COLUMN Own_Feture.Model
IS
  'Every maker provides different models of vehicles,vehicles of same model have same features' ;
ALTER TABLE Own_Feture ADD CONSTRAINT Own_Feture_PK PRIMARY KEY ( Regist_No, Make, Model ) ;


CREATE TABLE Speak_Language
  (
    Driver_ID     NUMBER (7) NOT NULL ,
    Language_Code CHAR (3) NOT NULL
  ) ;
COMMENT ON COLUMN Speak_Language.Driver_ID
IS
  'Every driver has a unique ID' ;
  COMMENT ON COLUMN Speak_Language.Language_Code
IS
  'Every language use the ISO639-1 two-character language code,it''s unique' ;
ALTER TABLE Speak_Language ADD CONSTRAINT Speak_Language_PK PRIMARY KEY ( Driver_ID, Language_Code ) ;


CREATE TABLE Vehicle
  (
    Regist_No        CHAR (9) NOT NULL ,
    VIN              VARCHAR2 (20) NOT NULL ,
    Make             CHAR (10) NOT NULL ,
    Model            VARCHAR2 (20) NOT NULL ,
    colour           CHAR (10) NOT NULL ,
    Current_Odometer NUMBER (6) NOT NULL
  ) ;
COMMENT ON COLUMN Vehicle.Regist_No
IS
  'Every vehicle has a registration number,it''s unique.' ;
  COMMENT ON COLUMN Vehicle.VIN
IS
  'Every vehicle has an ID (VIN), it''s unique' ;
  COMMENT ON COLUMN Vehicle.Make
IS
  'The manufacturer of the vehicle' ;
  COMMENT ON COLUMN Vehicle.Model
IS
  'Every maker provides different models' ;
  COMMENT ON COLUMN Vehicle.colour
IS
  'Every vehicle has single colour' ;
  COMMENT ON COLUMN Vehicle.Current_Odometer
IS
  'How many km the vehicle havs run.' ;
ALTER TABLE Vehicle ADD CONSTRAINT Vehicle_PK PRIMARY KEY ( Regist_No ) ;


ALTER TABLE Booking ADD CONSTRAINT Booking_Driver_FK FOREIGN KEY ( Driver_ID ) REFERENCES Driver ( Driver_ID ) ;

ALTER TABLE Booking ADD CONSTRAINT Booking_Location_FK FOREIGN KEY ( Location_ID ) REFERENCES Location ( Location_ID ) ;

ALTER TABLE Booking ADD CONSTRAINT Booking_Location_FKv1 FOREIGN KEY ( Location_ID2 ) REFERENCES Location ( Location_ID ) ;

ALTER TABLE Booking ADD CONSTRAINT Booking_Official_FK FOREIGN KEY ( Official_ID ) REFERENCES Official ( Official_ID ) ;

ALTER TABLE Booking ADD CONSTRAINT Booking_Vehicle_FK FOREIGN KEY ( Regist_No ) REFERENCES Vehicle ( Regist_No ) ;

ALTER TABLE Completion ADD CONSTRAINT Completion_Driver_FK FOREIGN KEY ( Driver_ID ) REFERENCES Driver ( Driver_ID ) ;

ALTER TABLE Completion ADD CONSTRAINT Completion_Module_FK FOREIGN KEY ( Module_ID ) REFERENCES Module ( Module_ID ) ;

ALTER TABLE Maintenance_Repair ADD CONSTRAINT Maintenance_Repair_Vehicle_FK FOREIGN KEY ( Regist_No ) REFERENCES Vehicle ( Regist_No ) ;

ALTER TABLE Official ADD CONSTRAINT Official_Language_FK FOREIGN KEY ( Language_Code ) REFERENCES Language ( Language_Code ) ;

ALTER TABLE Own_Feture ADD CONSTRAINT Own_Feture_Feature_FK FOREIGN KEY ( Make, Model ) REFERENCES Feature ( Make, Model ) ;

ALTER TABLE Own_Feture ADD CONSTRAINT Own_Feture_Vehicle_FK FOREIGN KEY ( Regist_No ) REFERENCES Vehicle ( Regist_No ) ;

ALTER TABLE Speak_Language ADD CONSTRAINT Speak_Language_Driver_FK FOREIGN KEY ( Driver_ID ) REFERENCES Driver ( Driver_ID ) ;

ALTER TABLE Speak_Language ADD CONSTRAINT Speak_Language_Language_FK FOREIGN KEY ( Language_Code ) REFERENCES Language ( Language_Code ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             1
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
