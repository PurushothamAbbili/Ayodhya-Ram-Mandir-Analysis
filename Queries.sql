-- Using Database
USE RamMandhir;

-- 1)Retrieve information about the Ram Mandir?
SELECT 
    *
FROM
    Temple
WHERE
    Name = 'Ram Mandir';

-- 2)List all construction phases for the Ram Mandir?
SELECT 
    PhaseName, StartDate, CompletionDate
FROM
    ConstructionPhase
        JOIN
    Temple USING (TempleID)
WHERE
    Name = 'Ram Mandir';

-- 3)Find the total Amount of Donations received for the Ram Mandir?
SELECT 
    SUM(d.Amount) AS TotalDonation
FROM
    Donations d
        JOIN
    Temple t ON d.TempleID = t.TempleID
WHERE
    d.TempleID = 1;

-- 4)Get details about the architecture of the Ram Mandir?
SELECT 
    ArchitectName, Description
FROM
    Architecture a
        JOIN
    Temple t ON a.TempleID = t.TempleID
WHERE
    a.TempleID = 1;

-- 5)Retrieve Events associated with the Ram Mandir?
SELECT 
    t.Name AS `Temple Name`, e.EventName
FROM
    Temple t
        JOIN
    TempleEvents te ON t.TempleID = te.TempleID
        JOIN
    Events e ON te.EventID = e.EventID;

-- 6)Find donors who contributed more than 50000 towards the Ram Mandir?
SELECT 
    d.DonorName, d.Amount
FROM
    Donations d
        JOIN
    Temple t ON d.TempleID = t.TempleID
WHERE
    d.Amount > 50000
ORDER BY d.Amount;

-- 7)Retrieve details about a specific Deity (e.g., Rama)?
SELECT 
    *
FROM
    Deity
WHERE
    Name = 'Rama';

-- 8)Find the start and end dates of the construction phases for the Ram Mandir?
SELECT 
    cp.PhaseName, cp.StartDate, cp.CompletionDate
FROM
    ConstructionPhase cp
        JOIN
    Temple t ON cp.TempleID = t.TempleID;

-- 9)Count the number of Events associated with each Temple?
SELECT 
    t.Name, COUNT(e.EventID) AS NoOfEvents
FROM
    TempleEvents te
        JOIN
    Temple t ON t.TempleID = te.TempleID
        JOIN
    Events e ON te.EventID = e.EventID
GROUP BY 1;

-- 10)Find the donors who made contributions on or after '2021-06-01'?
SELECT 
    DonorName, DonationDate
FROM
    Donations
WHERE
    DonationDate >= '2021-06-01';