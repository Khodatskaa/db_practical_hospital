USE [db_practical_hospital]
GO 

INSERT INTO Departments (Name) VALUES ('Branch A'), ('Branch B'), ('Branch C');

INSERT INTO Doctors (Name, Surname, Premium, Salary) VALUES 
('John', 'Doe', 0, 5000),
('Jane', 'Smith', 0, 6000),
('Michael', 'Johnson', 0, 5500);

INSERT INTO Specializations (Name) VALUES ('Cardiology'), ('Neurology'), ('Orthopedics');

INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Sponsors (Name) VALUES ('Umbrella Corporation'), ('Wayne Enterprises'), ('Stark Industries');

INSERT INTO Donations (Amount, DepartmentId, SponsorId) VALUES 
(1000, 1, 1),
(2000, 2, 2),
(1500, 3, 3);

INSERT INTO Vacations (StartDate, EndDate, DoctorId) VALUES 
('2024-04-01', '2024-04-10', 1),
('2024-04-05', '2024-04-15', 2);

INSERT INTO Wards (Name, DepartmentId) VALUES 
('Ward 1', 1),
('Ward 2', 2),
('Ward 3', 3);
