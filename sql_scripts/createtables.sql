-- Drop the database if it exists
DROP DATABASE IF EXISTS AEM;

-- Create the database
CREATE DATABASE AEM;

-- Use the created database
USE AEM;

-- Create tables
CREATE TABLE IF NOT EXISTS U (
    U_ID INT PRIMARY KEY,
    U_Name VARCHAR(255),
    Created_At DATETIME
);

CREATE TABLE IF NOT EXISTS Location (
    Location_ID INT PRIMARY KEY,
    Venue VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip_Code VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Event_Type (
    Event_Type_ID INT PRIMARY KEY,
    Type_Name VARCHAR(255),
    Created_At DATETIME
);

CREATE TABLE IF NOT EXISTS `Event` (
    Event_ID INT PRIMARY KEY,
    Event_Type_ID INT,
    Location_ID INT,
    U_ID INT,
    Start_Date_Time DATETIME,
    End_Date_Time DATETIME,
    Max_Capacity INT,
    Presenter_Deadline DATETIME,
    Event_Name VARCHAR(255),
    Venue VARCHAR(255),
    F_Date_Time DATETIME,
    Created_At DATETIME,
    Is_Published BOOLEAN,
    Description TEXT,
    FOREIGN KEY (Event_Type_ID) REFERENCES Event_Type(Event_Type_ID),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID),
    FOREIGN KEY (U_ID) REFERENCES U(U_ID)
);

CREATE TABLE IF NOT EXISTS User (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    F_Name VARCHAR(255),
    LName VARCHAR(255),
    Phone_Number VARCHAR(20),
    Role VARCHAR(20),
    Created_At DATETIME
);

CREATE TABLE IF NOT EXISTS Presenter (
    Presenter_ID INT PRIMARY KEY,
    Presenter_Name VARCHAR(255),
    Create_At DATETIME
);

CREATE TABLE IF NOT EXISTS Sponsor (
    Sponsor_ID INT PRIMARY KEY,
    Sponsor_Name VARCHAR(255),
    Create_At DATETIME
);

CREATE TABLE IF NOT EXISTS Speaker (
    Speaker_ID INT PRIMARY KEY,
    Speaker_Name VARCHAR(255),
    Created_At DATETIME
);

CREATE TABLE IF NOT EXISTS User_Event (
    User_ID INT,
    Event_ID INT,
    Created_At DATETIME,
    PRIMARY KEY (User_ID, Event_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Event_ID) REFERENCES `Event`(Event_ID)
);

CREATE TABLE IF NOT EXISTS Presenter_Event (
    Presenter_ID INT,
    Event_ID INT,
    Created_At DATETIME,
    PRIMARY KEY (Presenter_ID, Event_ID),
    FOREIGN KEY (Presenter_ID) REFERENCES Presenter(Presenter_ID),
    FOREIGN KEY (Event_ID) REFERENCES `Event`(Event_ID)
);

CREATE TABLE IF NOT EXISTS Speaker_Event (
    Speaker_ID INT,
    Event_ID INT,
    Created_At DATETIME,
    PRIMARY KEY (Speaker_ID, Event_ID),
    FOREIGN KEY (Speaker_ID) REFERENCES Speaker(Speaker_ID),
    FOREIGN KEY (Event_ID) REFERENCES `Event`(Event_ID)
);

CREATE TABLE IF NOT EXISTS Sponsor_Event (
    Sponsor_ID INT,
    Event_ID INT,
    Created_At DATETIME,
    PRIMARY KEY (Sponsor_ID, Event_ID),
    FOREIGN KEY (Sponsor_ID) REFERENCES Sponsor(Sponsor_ID),
    FOREIGN KEY (Event_ID) REFERENCES `Event`(Event_ID)
);
