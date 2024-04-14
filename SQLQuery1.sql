USE [db_practical_hospital]
GO
-- Inquiry 1: Display the full names of doctors and their specialization.
SELECT CONCAT(D.Name, ' ', D.Surname) AS DoctorFullName, S.Name AS Specialization
FROM Doctors D
JOIN DoctorsSpecializations DS ON D.Id = DS.DoctorId
JOIN Specializations S ON DS.SpecializationId = S.Id;

-- Inquiry 2: Display surnames and salaries of doctors who are not on vacation.
SELECT D.Surname, D.Salary, D.Premium AS Allowance
FROM Doctors D
WHERE NOT EXISTS (
    SELECT 1 FROM Vacations V WHERE V.DoctorId = D.Id AND GETDATE() BETWEEN V.StartDate AND V.EndDate
);

-- Inquiry 3: Display the names of the chambers located in the "Branch A".
SELECT W.Name AS ChamberName
FROM Wards W
JOIN Departments D ON W.DepartmentId = D.Id
WHERE D.Name = 'Branch A';

-- Inquiry 4: Display the names of the sponsors without repetitions sponsored by Umbrella Corporation.
SELECT DISTINCT S.Name AS SponsorName
FROM Sponsors S
JOIN Donations ON S.Id = Donations.SponsorId
WHERE S.Name = 'Umbrella Corporation';

-- Inquiry 5: Withdraw all donations for the last month.
SELECT D.Name AS Branch, S.Name AS Sponsor, Donations.Amount AS DonationAmount, Donations.Date AS DonationDate
FROM Donations
JOIN Departments D ON Donations.DepartmentId = D.Id
JOIN Sponsors S ON Donations.SponsorId = S.Id
WHERE Donations.Date >= DATEADD(MONTH, -1, GETDATE());
