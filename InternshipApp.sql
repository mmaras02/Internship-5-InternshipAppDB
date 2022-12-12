CREATE TABLE Interns(
	InternId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	OIB VARCHAR(11) UNIQUE CHECK(LENGTH(OIB) = 11),
	Gender VARCHAR(1) NOT NULL CHECK(Gender ='M' OR Gender='F'),
	BirthDate TIMESTAMP NOT NULL,
	PlaceOfResidence VARCHAR(30) NOT NULL
);

ALTER TABLE Interns
	ADD CONSTRAINT BirthDate CHECK(date_part('year',AGE(BirthDate)) BETWEEN 16 and 24);
	
CREATE TABLE Members(
	MemberId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	OIB VARCHAR(11) UNIQUE CHECK(LENGTH(OIB) = 11),
	Gender VARCHAR(1) NOT NULL CHECK(Gender ='M' OR Gender='F'),
	BirthDate TIMESTAMP NOT NULL,
	PlaceOfResidence VARCHAR(30) NOT NULL
);

CREATE TABLE Internships(
	InternshipId SERIAL PRIMARY KEY,
	StartDate TIMESTAMP,
	EndDate TIMESTAMP,
	LeaderId INT REFERENCES Members(MemberId),
	PhaseId INT REFERENCES Phase(PhaseId)
);

CREATE TABLE InternStatus(
	StatusId SERIAL PRIMARY KEY,
	Name VARCHAR (30) CHECK(Name ='intern' OR Name= 'kicked out' OR Name='internship completed')
);
	
CREATE TABLE Phase(
	PhaseId SERIAL PRIMARY KEY,
	Name VARCHAR(30) CHECK(Name='in preparation' OR Name='active' OR Name='compleated')
);
	
CREATE TABLE Fields(
	FieldId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
);
	
CREATE TABLE Grades (
	GradeId SERIAL PRIMARY KEY,
	Value INT CHECK(Value BETWEEN 1 AND 5)
);
	
	
CREATE TABLE InternFields (
	InternFieldId SERIAL PRIMARY KEY,
	InternId INT REFERENCES Interns(InternId),
	FieldId INT REFERENCES Fields(FieldId),
	StatusId INT REFERENCES InternStatus(StatusId)
);	

CREATE TABLE MemebersField(
	MemberId INT REFERENCES Members(MemberId),
	FieldId INT REFERENCES Fields(FieldId)
);
	
CREATE TABLE InternshipField (
	InternshipFieldId SERIAL PRIMARY KEY,
	InternshipId INT REFERENCES Internships(InternshipId),
	FieldId INT REFERENCES Fields(FieldId),
	LeaderId INT REFERENCES Members(MemberId)
);

CREATE TABLE InternGrades (
	InternGradeId SERIAL PRIMARY KEY,
	InternFieldId INT REFERENCES InternFields(InternFieldID),
	GradeId INT REFERENCES Grades(GradeId),
	EvaluatorId INT REFERENCES Members(MemberId)
);

------------------------
/*insert all data*/
------------------------


INSERT INTO Interns(FirstName, LastName, OIB, BirthDate, Gender, PlaceOfResidence) VALUES
	('Dorotea', 'Herceg', '39204716391', '2002-04-09', 'F', 'Split'),
	('Dorian', 'Bralic', '12094108998', '2000-04-04', 'M', 'Zagreb'),
	('Duje', 'Dujic', '15673956734', '2004-07-01', 'M', 'Zadar'),
	('Karmen', 'Zoric', '45637893456', '2001-03-14', 'F', 'Zagreb'),
	('Orson', 'Hill', '28729043080', '2003-07-01', 'M', 'Split'),
	('Andro', 'Pavlovic', '20473928450','2001-06-02', 'M', 'Zagreb'),
	('Ratko', 'Dallas', '29305489104','1999-10-18', 'M', 'Split'),
	('Martina', 'Vlasic', '95289005289', '1998-01-21', 'F', 'Split'),
	('Dorian', 'Bralic', '19065238952', '2000-04-14', 'M', 'Split'),
	('Jake', 'Fray', '09856756012', '2001-03-02', 'M', 'Split'),
	('Mara', 'Markovic', '45645327681', '2003-08-05', 'M', 'Omis'),
	('Marko', 'Padmore', '05673128639', '2001-12-17', 'M', 'Zadar'),
	('Andy', 'Ericson	', '33345678445', '2003-07-11', 'M', 'Trogir'),
	('Staša', 'Jerikovic', '98985423457','2001-06-18', 'F', 'Dubrovnik'),
	('Nicol', 'Noel', '16453298076','2000-11-12', 'F', 'Zagreb'),
	('Kate', 'Katic', '88564777900', '2002-04-09', 'F', 'Split'),
	('Mario', 'Maric', '99955678564', '2001-08-10', 'M', 'Split'),
	('Kevin', 'Crawford', '11113456742', '2004-07-01', 'M', 'Zadar'),
	('Mellisa', 'Wilcox', '56470098877', '1999-02-11', 'F', 'Zagreb'),
	('Joel', 'Cole', '00009786678', '2003-07-01', 'M', 'Split'),
	('Joseph ', 'Dows', '09786546721','2001-06-02', 'M', 'Zagreb'),
	('Justin', 'Stone', '12345656572','1999-10-18', 'M', 'Split'),
	('Mihelle', 'Rojas	', '23415750086', '1998-01-21', 'F', 'Split'),
	('John', 'Mayes', '30040050067', '2000-04-14', 'M', 'Split'),
	('Leslie', 'Addams', '56470004544', '2001-03-02', 'F', 'Split'),
	('Kathryn ', 'Mendes', '90909786567', '2003-08-05', 'F', 'Split'),
	('Gail', 'Mcknight', '22345617833', '2001-12-17', 'F', 'Zadar'),
	('Aaron', 'Boyer	', '33452610983', '2003-07-11', 'M', 'Trogir'),
	('Audrey', 'Barron', '11111683442','2001-06-18', 'F', 'Dubrovnik'),
	('Brent', 'Fredricson', '34526712340','2000-11-12', 'M', 'Zagreb'),
	('Suzzane', 'Mckenzie', '34256453430', '2002-04-09', 'F', 'Split'),
	('Marissa', 'Baker', '66578453371', '2001-08-10', 'F', 'Split'),
	('Harry', 'Bekars', '88972343342', '2004-07-01', 'M', 'Copenhagen'),
	('Hannah', 'Doyle', '45634453672', '1999-02-11', 'F', 'Zagreb'),
	('Harold', 'Lowery', '98778667889', '2003-07-01', 'M', 'Split'),
	('Tamara ', 'Wilkeroson', '11435662341','2000-05-12', 'F', 'Zagreb'),
	('Thomas', 'Smith', '34212121234','1998-10-21', 'M', 'Split'),
	('Adam', 'Lucas	', '09767786754', '2000-11-27', 'M', 'Zagreb'),
	('Ryan', 'Anderson', '67584934754', '2002-04-26', 'M', 'Zagreb'),
	('Jeff', 'Wang', '05087334210', '2001-03-02', 'M', 'Split'),
	('Paula ', 'May', '12345343530', '2003-03-15', 'F', 'Omis'),
	('Carla', 'Coleman', '98675600980', '2001-11-19', 'F', 'Zadar'),
	('Jessica', 'Wiggins', '12343435672', '2004-02-20', 'F', 'Trogir'),
	('Allison', 'Cruz', '09456733076','2001-03-15', 'F', 'Manchester'),
	('Laura', 'Donovan', '33366758459','2000-10-10', 'F', 'London'),
	('Rebbecca ', 'Martin', '88779675463', '2002-03-13', 'F', 'Split'),
	('Kyle', 'Holland', '22134562213', '2000-10-19', 'M', 'Zagreb'),
	('John', 'Lewis', '78699657440', '1999-01-20', 'M', 'Split'),
	('Tara', 'Garcia', '66785984563','2001-07-15', 'F', 'Split'),
	('Benjamin', 'Pena', '00650094653','2004-02-10', 'M', 'London')
--
INSERT INTO Members(FirstName, LastName, OIB, BirthDate, Gender, PlaceOfResidence) VALUES
	('Matthew', 'Malone', '88879965341', '2000-07-19', 'M', 'Split'),
	('Kathryn ', 'Hallaway', '99988807112', '2001-09-21', 'F', 'Bruxelles'),
	('Jose', 'Miller', '33453612789', '1999-02-23', 'M', 'Split'),
	('Ann', 'Madden', '98076782341', '1998-12-01', 'F', 'Split'),
	('Jill', 'Peterson', '33425611209', '2001-04-25', 'F', 'Copenhagen'),
	('Carlos', 'Ryan', '90000564112', '2000-03-09', 'M', 'Split'),
	('Connor', 'Wilson', '22399001113', '1999-05-29', 'M', 'Bruxelles'),
	('Katie', 'Grier', '66755580033', '2000-11-09', 'F', 'Split'),
	('Gina', 'Adams', '12121344529', '2002-12-18', 'F', 'Zagreb'),
	('Jody', 'Smit', '33300917893', '2001-06-13', 'M', 'Zagreb'),
	('Erin', 'Hawkins', '55564732891', '2000-08-19', 'F', 'London'),
	('Justin', 'Clark', '34527168912', '2001-04-23', 'M', 'Split'),
	('Bradely', 'Barret', '89711209657', '2007-02-28', 'M', 'Copenhagen'),
	('Mary', 'Bead', '91910044532', '2003-03-01', 'F', 'Copenhagen'),
	('Derrick', 'Hart', '10101985330', '1998-05-16', 'M', 'Split'),
	('Robert', 'Rice', '95673409112', '1999-11-09', 'M', 'Split'),
	('Stephanie', 'White', '00011236689', '1998-09-19', 'F', 'Vienna'),
	('Eric', 'Jordan', '44457789190', '1999-02-25', 'M', 'Berlin'),
	('Amy', 'Villarreal', '33324516712', '1995-02-20', 'F', 'Split'),
	('Daniel', 'Thomas', '44566711009', '1997-12-03', 'M', 'Rome'),
	('Benjamin', 'Stevenson', '11009789045', '1998-02-12', 'M', 'Split'),
	('Taylor', 'Mcintosh', '22376990090', '2000-12-09', 'F', 'Vienna'),
	('Krista', 'Tayler', '99804456782', '2001-05-14', 'F', 'Split'),
	('Angela', 'Bell', '23455676231', '2002-03-21', 'F', 'Prague'),
	('Katie', 'Cook', '33409556172', '1999-11-01', 'F', 'Berlin'),
	('Richard', 'Yates', '88766765009', '2002-05-24', 'M', 'Split')
--
INSERT INTO Internships(StartDate,EndDate,LeaderId,PhaseId) VALUES
	('2018-11-05', '2019-04-08', 1, 3),
	('2019-11-11', '2020-04-06', 3, 3),
	('2020-11-09', '2021-04-05', 4, 3),
	('2021-11-08', '2022-04-11', 6, 3),
	('2022-11-07', '2023-04-10', 7, 2),
	('2023-11-06', '2024-04-08', 1, 1);
--
INSERT INTO InternStatus(Name) VALUES
	('intern'),
	('kicked out'),
	('internship completed')
--
INSERT INTO Phase(Name) VALUES
	('in preparation'),
	('active'),
	('compleated')
--
INSERT INTO Fields(Name) VALUES
	('programiranje'),
	('multimedija'),
	('dizajn'),
	('marketing')
--
INSERT INTO Grades(Value) VALUES
	(1),
	(2),
	(3),
	(4),
	(5)
--
INSERT INTO InternFields(InternId,FieldId,StatusId) VALUES
	(1,2,1),
	(2,1,3),
	(3,1,1),
	(4,3,1),
	(5,4,1),
	(6,2,1),
	(7,1,1),
	(8,1,1),
	(9,3,1),
	(10,4,1),
	(11,2,1),
	(12,1,1),
	(13,1,1),
	(14,3,1),
	(15,4,1),
	(16,2,1),
	(17,1,1),
	(18,1,1),
	(19,3,1),
	(20,4,1),
	(21,2,2),
	(22,1,2),
	(23,1,2),
	(24,3,1),
	(25,4,2),
	(26,2,2),
	(27,1,1),
	(28,1,1),
	(29,3,1),
	(30,4,1),
	(31,2,1),
	(32,1,3),
	(33,1,1),
	(34,3,1),
	(35,4,1),
	(36,2,1),
	(37,1,3),
	(38,1,1),
	(39,3,1),
	(40,4,1),
	(41,2,1),
	(42,1,3),
	(43,1,1),
	(44,3,1),
	(45,4,1),
	(46,2,3),
	(47,1,3),
	(48,1,2),
	(49,3,2),
	(50,4,2)
--
INSERT INTO InternshipField(InternshipId,FieldId,LeaderId) VALUES
	(1,1,1),(1,2,5),(1,3,2),(1,4,10),
	(2,1,6),(2,2,12),(2,3,16),(2,4,10),
	(3,1,15),(3,2,5),(3,3,14),(3,4,9),
	(4,1,21),(4,2,18),(4,3,8),(4,4,23),
	(5,1,1),(5,2,11),(5,3,2),(5,4,10),
	(6,1,3),(6,2,5),(6,3,2),(6,4,4)
--
INSERT INTO InternGrades(InternFieldId,GradeId,EvaluatorId) VALUES
	(51,2,4),(51,5,10),(51,4,23),
	(53,4,3),(53,3,15),(53,2,21),
	(54,4,14),(54,3,16),(54,2,14),
	(55,4,18),(55,5,22),(55,4,5),
	(56,5,9),(56,2,13),(56,4,23),
	(57,5,15),(57,4,17),(57,2,1),
	(58,4,1),(58,4,6),(58,2,15),
	(59,3,20),(59,5,8),(59,2,2),
	(60,4,26),(60,3,22),(60,3,18),
	(61,3,9),(61,3,13),(61,3,23),
	(62,5,6),(62,3,15),(62,2,21),
	(63,3,24),(63,4,21),(63,4,15),
	(64,3,2),(64,5,7),(64,3,25),
	(65,5,10),(65,4,13),
	(66,3,4),(66,4,23),(66,4,10),
	(67,5,6),(67,4,17),
	(68,4,3),(68,3,15),(68,3,21),
	(69,3,2),(69,5,8),(69,5,14),
	(70,4,5),(70,3,11),(70,2,12),
	(71,5,9),(71,3,4),
	(72,4,21),(72,3,1),
	(73,5,9),(73,4,17),(73,4,21),
	(74,2,2),(74,2,16),(74,3,14),
	(75,2,5),(75,4,12),
	(76,3,10),(76,3,4),
	(77,5,1),(77,2,15),
	(78,2,21),(78,5,24),(78,4,6),
	(79,2,14),(79,5,2),(79,3,14),
	(80,4,12),(80,5,18),(80,2,5),
	(81,3,13),(81,4,4),(81,3,10),
	(83,2,17),(83,5,21),(83,4,17),
	(84,4,7),(84,1,14),(84,2,8),
	(85,4,5),(85,3,11),(85,3,12),
	(86,2,4),(86,2,13),(86,2,9),
	(88,3,1),(88,2,15),(88,3,6),
	(89,4,7),(78,4,16),(89,2,14),
	(90,3,11),(90,5,22),(90,2,18),
	(91,4,10),(91,3,10),(91,4,13),
	(93,2,15),(93,4,21),(93,2,6),
	(94,2,14),(94,5,16),(94,2,25),
	(95,3,22),(95,4,12),(95,1,18),
	(98,2,1),(98,4,3),
	(99,5,7),(99,5,14),
	(100,3,11),(100,3,18)
	

----------------------
/*Query requests*/
----------------------
--1--
SELECT FirstName, LastName 
FROM Members
	WHERE PlaceOfResidence NOT LIKE 'Split'

--2--
SELECT StartDate,EndDate
FROM Internships
	ORDER BY StartDate DESC
	
--3--
SELECT FirstName, LastName 
FROM Interns i
INNER JOIN InternFields inf ON i.InternId=inf.InternId
INNER JOIN InternshipField intf ON inf.FieldId=intf.InternshipFieldId
INNER JOIN Internships it ON intf.InternshipId=it.InternshipId
	WHERE EXTRACT(YEAR FROM it.StartDate)>2021 AND EXTRACT(YEAR FROM it.EndDate)<2022
	
--4--
SELECT COUNT(*) AS NumberOfGirlsOnDevInternship 
FROM Interns i
INNER JOIN InternFields inf ON i.InternId=inf.InternId
INNER JOIN InternshipField intf ON inf.FieldId=intf.InternshipFieldId
INNER JOIN Internships it ON intf.InternshipId=it.InternshipId
	WHERE i.Gender='F' AND EXTRACT(YEAR FROM it.StartDate)=EXTRACT(YEAR FROM NOW())
	
--5--
SELECT DISTINCT COUNT(*) AS NumberOfKickedOutMarketingInterns FROM Interns i
JOIN InternFields inf ON i.InternId=inf.InternId
	WHERE  inf.StatusId = 2 AND inf.FIeldId=4

--6--
UPDATE Members m
SET PlaceOfResidence = 'Moscow'
	WHERE LastName like '%on'

--7--	
DELETE FROM Members
WHERE (EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM BirthDate))>25




