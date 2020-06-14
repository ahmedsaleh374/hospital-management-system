DROP TABLE PATIENT CASCADE;
CREATE TABLE PATIENT(
    PatientId int, 
    Name varchar(30), 
    gender VARCHAR(9),
    Address varchar(100),
    ContactNo varchar(100),
    Age int, 
    PRIMARY KEY(PatientId),
    check(gender in ('Male', 'Female', 'Unknown'))
);


DROP TABLE HOSPITAL CASCADE;
CREATE TABLE HOSPITAL (
    HosId int, 
    hosName varchar(30), 
    HosCity varchar(100),
    HosAddress varchar(100),
    PRIMARY KEY(HosId)
);

DROP TABLE ROOM CASCADE;
CREATE TABLE ROOM (
    RoomId int, 
    RoomNo int,
    HosId int, 
    PRIMARY KEY(RoomId),
    FOREIGN KEY(HosId) REFERENCES HOSPITAL(HosId)
);

DROP TABLE ADMITTED_IN CASCADE;
CREATE TABLE ADMITTED_IN (
    PatientId int, 
    RoomId int, 
    HosId int, 
    PRIMARY KEY(PatientId, RoomId, HosId),
    FOREIGN KEY(RoomId) REFERENCES ROOM(RoomId),
    FOREIGN KEY(HosId) REFERENCES HOSPITAL(HosId),
    FOREIGN KEY(PatientId) REFERENCES PATIENT(PatientId)
);