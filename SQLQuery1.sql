CREATE DATABASE [db_practical_hospital]
GO
USE [db_practical_hospital]
GO
CREATE TABLE Departments (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name nvarchar(100) NOT NULL UNIQUE
);

CREATE TABLE Doctors (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name nvarchar(max) NOT NULL,
	Premium money DEFAULT 0,
	Salary DECIMAL(10,2) NOT NULL,
    Surname nvarchar(max) NOT NULL
);

CREATE TABLE Specializations (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name nvarchar(100) NOT NULL UNIQUE
);

CREATE TABLE DoctorsSpecializations (
    Id int PRIMARY KEY IDENTITY(1,1),
    DoctorId int NOT NULL,
    SpecializationId int NOT NULL
);

CREATE TABLE Donations (
    Id int PRIMARY KEY IDENTITY(1,1),
    Amount money NOT NULL CHECK (Amount > 0),
    Date date DEFAULT GETDATE(),
    DepartmentId int NOT NULL,
    SponsorId int NOT NULL
);

CREATE TABLE Sponsors (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name nvarchar(100) NOT NULL UNIQUE
);

CREATE TABLE Vacations (
    Id int PRIMARY KEY IDENTITY(1,1),
    StartDate date NOT NULL,
    EndDate date NOT NULL,
    DoctorId int NOT NULL,
    CONSTRAINT CHK_Vacations_Dates CHECK (EndDate > StartDate)
);

CREATE TABLE Wards (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name nvarchar(20) NOT NULL UNIQUE,
    DepartmentId int NOT NULL
);
