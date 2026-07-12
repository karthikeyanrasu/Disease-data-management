--Creation Queries
CREATE DATABASE DiseaseManagement;

CREATE TABLE Disease_Type (
    Disease_Type_Code CHAR(10) PRIMARY KEY,
    Description VARCHAR(255)  );
-- Stores different types of diseases to categorize diseases in the Disease table.

CREATE TABLE Disease (
    Disease_ID SERIAL PRIMARY KEY,
    Disease_Name VARCHAR(255),
    Intensity_Level INT,
    Source_Disease_Cd INT REFERENCES Disease(Disease_ID),
    Disease_Type_Code CHAR(10) REFERENCES Disease_Type(Disease_Type_Code)
);
-- Holds information about specific diseases, including a reference to Disease_Type and   
    possible source diseases.

CREATE TABLE Location (
    Location_ID SERIAL PRIMARY KEY,
    City_Name VARCHAR(255),
    State_Name VARCHAR(255),
    Country_Name VARCHAR(255),
    Wealth_Rank_Number INT,
    Developing_Flag BOOLEAN
);
-- Details geographic locations, which can be used to analyse disease patterns 
    geographically.

CREATE TABLE Race (
    Race_Code CHAR(10) PRIMARY KEY,
    Race_Description VARCHAR(255)
);
-- Catalogues races to understand and analyse demographic influences on disease 
    patterns.

CREATE TABLE Person (
    Person_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Primary_Location_ID INT REFERENCES Location(Location_ID),
    Race_CD CHAR(10) REFERENCES Race(Race_Code)
);
-- Records individuals, linking them to locations and races for demographic studies.

CREATE TABLE Treatment_Plan (
    Treatment_Plan_ID SERIAL PRIMARY KEY,
    Plan_Description VARCHAR(255),
    Disease_ID INT REFERENCES Disease(Disease_ID) );
-- Contains treatment plans linked to specific diseases to manage patient care effectively.

CREATE TABLE Hospital (
    Hospital_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255)  );
-- Lists hospitals, which are key locations for delivering healthcare and treatments.

CREATE TABLE Healthcare_Provider (
    Provider_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Hospital_ID INT REFERENCES Hospital(Hospital_ID)
);
-- Details healthcare providers, associating them with hospitals to manage their 
    placement and track their employment.


CREATE TABLE Diagnostic_Test (
    Test_ID SERIAL PRIMARY KEY,
    Person_ID INT REFERENCES Person(Person_ID),
    Disease_ID INT REFERENCES Disease(Disease_ID)
);
-- Keeps records of diagnostic tests performed on individuals, linking tests to diseases 
    and persons for medical tracking.

CREATE TABLE Insurance (
    Insurance_ID SERIAL PRIMARY KEY,
    Provider_Name VARCHAR(255),
    Person_ID INT REFERENCES Person(Person_ID)
);
-- Manages insurance provider data for individuals to facilitate billing and medical 
    service access.

CREATE TABLE Hospital_Person (
    Hospital_Person_ID SERIAL PRIMARY KEY,
    Hospital_ID INT REFERENCES Hospital(Hospital_ID),
    Person_ID INT REFERENCES Person(Person_ID)
);
-- Tracks which individuals (patients or staff) are associated with which hospitals.

--Insertion Queries:

INSERT INTO Disease_Type (Disease_Type_Code, Description) VALUES
('DT001', 'Infectious'),('DT002', 'Chronic'),('DT003', 'Hereditary'),
('DT004', 'Congenital'),('DT005', 'Autoimmune'),('DT006', 'Neoplastic'),
('DT007', 'Degenerative'),('DT008', 'Nutritional'),('DT009', 'Psychiatric'),
('DT010', 'Endocrine'),('DT011', 'Cardiovascular'),('DT012', 'Dermatological'),
('DT013', 'Gastrointestinal'),('DT014', 'Neurological'),('DT015', 'Respiratory'),
('DT016', 'Orthopedic'),('DT017', 'Ocular'),('DT018', 'Dental'),
('DT019', 'Urological'),('DT020', 'Renal');

INSERT INTO Disease (Disease_Name, Intensity_Level, Source_Disease_Cd, Disease_Type_Code) VALUES
('Flu', 2, NULL, 'DT001'),('Diabetes', 6, NULL, 'DT010'),
('Alzheimer''s', 8, NULL, 'DT014'),('Celiac Disease', 5, NULL, 'DT008'),
('Multiple Sclerosis', 7, NULL, 'DT005'),('Cancer', 9, NULL, 'DT006'),
('Asthma', 4, NULL, 'DT015'),('Osteoporosis', 3, NULL, 'DT016'),
('Glaucoma', 4, NULL, 'DT017'),('Dental Caries', 3, NULL, 'DT018'),
('Kidney Stones', 5, NULL, 'DT020'),('Heart Disease', 9, NULL, 'DT011'),
('Eczema', 3, NULL, 'DT012'),('Gastritis', 4, NULL, 'DT013'),
('Epilepsy', 6, NULL, 'DT014'),('Tuberculosis', 7, NULL, 'DT015'),
('Arthritis', 4, NULL, 'DT016'),('Conjunctivitis', 2, NULL, 'DT017'),
('Gingivitis', 2, NULL, 'DT018'),('Bladder Infection', 5, NULL, 'DT019');

INSERT INTO Location (City_Name, State_Name, Country_Name, Wealth_Rank_Number, Developing_Flag) VALUES
('New York', 'New York', 'USA', 9, FALSE),('Los Angeles', 'California', 'USA', 8, FALSE),
('Chicago', 'Illinois', 'USA', 7, FALSE),('Houston', 'Texas', 'USA', 7, FALSE),
('Phoenix', 'Arizona', 'USA', 6, FALSE),('Philadelphia', 'Pennsylvania', 'USA', 6, FALSE),
('San Antonio', 'Texas', 'USA', 6, FALSE),('San Diego', 'California', 'USA', 7, FALSE),
('Dallas', 'Texas', 'USA', 7, FALSE),('San Jose', 'California', 'USA', 8, FALSE),
('London', 'London', 'UK', 10, FALSE),('Manchester', 'Greater Manchester', 'UK', 7, FALSE),
('Birmingham', 'West Midlands', 'UK', 6, FALSE),('Leeds', 'West Yorkshire', 'UK', 6, FALSE),
('Glasgow', 'Scotland', 'UK', 6, FALSE),('Paris', 'Ile-de-France', 'France', 10, FALSE),
('Marseille', 'Provence-Alpes-Côte d''Azur', 'France', 7, FALSE),
('Lyon', 'Auvergne-Rhône-Alpes', 'France', 7, FALSE),
('Toulouse', 'Occitanie', 'France', 6, FALSE),
('Nice', 'Provence-Alpes-Côte d''Azur', 'France', 8, FALSE);

INSERT INTO Race (Race_Code, Race_Description) VALUES
('RC001', 'Caucasian'),('RC002', 'African American'),
('RC003', 'Hispanic'),('RC004', 'Asian'),
('RC005', 'Native American'),('RC006', 'Pacific Islander'),
('RC007', 'Middle Eastern'),('RC008', 'Mixed Race'),
('RC009', 'Other'),('RC010', 'Indian'),
('RC011', 'Chinese'),('RC012', 'Japanese'),
('RC013', 'Korean'),('RC014', 'Vietnamese'),
('RC015', 'Russian'),('RC016', 'Italian'),
('RC017', 'Greek'),('RC018', 'French'),
('RC019', 'German'),('RC020', 'Brazilian');

INSERT INTO Person (First_Name, Last_Name, Primary_Location_ID, Race_CD) VALUES
('John', 'Doe', 1, 'RC001'),('Jane', 'Smith', 2, 'RC002'),
('Alice', 'Johnson', 3, 'RC003'),('Bob', 'Williams', 4, 'RC004'),
('Michael', 'Brown', 5, 'RC005'),('Maria', 'Davis', 6, 'RC006'),
('James', 'Miller', 7, 'RC007'),('Linda', 'Wilson', 8, 'RC008'),
('Robert', 'Moore', 9, 'RC009'),('Patricia', 'Taylor', 10, 'RC010'),
('David', 'Anderson', 11, 'RC011'),('Elizabeth', 'Thomas', 12, 'RC012'),
('Joseph', 'Jackson', 13, 'RC013'),('Jennifer', 'White', 14, 'RC014'),
('Charles', 'Harris', 15, 'RC015'),('Barbara', 'Martin', 16, 'RC016'),
('Thomas', 'Thompson', 17, 'RC017'),('Susan', 'Garcia', 18, 'RC018'),
('Christopher', 'Martinez', 19, 'RC019'),('Jessica', 'Robinson', 20, 'RC020');

INSERT INTO Treatment_Plan (Plan_Description, Disease_ID) VALUES
('Standard Flu Treatment', 1),('Type 2 Diabetes Management', 2),
('Alzheimer''s Care Plan', 3),('Gluten-Free Diet', 4),
('MS Immunomodulators Therapy', 5),('Cancer Chemotherapy', 6),
('Asthma Inhalers Plan', 7),('Calcium and Vitamin D Supplements', 8),
('Eye Drops for Glaucoma', 9),('Tooth Filling and Fluoride Treatment', 10),
('Fluid Intake and Dietary Changes', 11),('Lifestyle and Medication for Heart', 12),
('Moisturizers and Topical Steroids', 13),('Antacids and Diet Management', 14),
('Anti-Seizure Medication Plan', 15),('TB Antibiotics Course', 16),
('Joint Pain Relief Measures', 17),('Eye Irritation Soothing Drops', 18),
('Gum Disease Antibacterial Rinse', 19),('Antibiotics for Bladder Infection', 20);

INSERT INTO Hospital (Name) VALUES
('Saint Mary''s Hospital'),('Mount Sinai Hospital'),
('Cleveland Clinic'),('Johns Hopkins Hospital'),
('Mayo Clinic'),('Massachusetts General Hospital'),
('UCLA Medical Center'),('New York-Presbyterian Hospital'),
('University of Michigan Hospitals'),('UCSF Medical Center'),
('Imperial College Healthcare NHS'),('King''s College Hospital'),
('Guy''s and St Thomas'' NHS Foundation'),('Royal Free Hospital'),
('The Royal London Hospital'),('Hôpital Européen Georges-Pompidou'),
('Pitié-Salpêtrière Hospital'),('Hôpital Saint-Louis'),
('Hôpital Cochin'),('Centre Hospitalier Universitaire de Nice');

INSERT INTO Healthcare_Provider (Name, Hospital_ID) VALUES
('Dr. Sarah Connors', 1),('Dr. John Hart', 1),
('Dr. Lisa Ray', 2),('Dr. Omar Little', 2),
('Dr. Jessica Alba', 3),('Dr. Bruce Banner', 3),
('Dr. Clark Kent', 4),('Dr. Diana Prince', 4),
('Dr. Jean Grey', 5),('Dr. Charles Xavier', 5),
('Dr. Stephen Strange', 6),('Dr. Hank Pym', 6),
('Dr. Tony Stark', 7),('Dr. Natasha Romanoff', 7),
('Dr. Steve Rogers', 8),('Dr. Peter Parker', 8),
('Dr. Bruce Wayne', 9),('Dr. Clark Kent', 9),
('Dr. Lois Lane', 10),('Dr. Barry Allen', 10);

INSERT INTO Diagnostic_Test (Person_ID, Disease_ID) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),
(9, 9),(10, 10),(11, 11),(12, 12),(13, 13),(14, 14),
(15, 15),(16, 16),(17, 17),(18, 18),(19, 19),(20, 20);

INSERT INTO Insurance (Provider_Name, Person_ID) VALUES
('UnitedHealth', 1),('Kaiser Foundation', 2),
('WellPoint Inc. Group', 3),('Aetna Group', 4),
('Humana Group', 5),('HCSC Group', 6),
('Cigna Health Group', 7),('Highmark Group', 8),
('Coventry Corp. Group', 9),('HIP Insurance Group', 10),
('Independence Blue Cross Group', 11),
('Blue Shield of CA Group', 12),
('Blue KC Group', 13),('CareFirst Inc. Group', 14),
('Health Net of California', 15),('Centene Corp. Group', 16),
('California Physicians' Service, 17),('Metropolitan Group', 18),
('Molina Healthcare Inc. Group', 19),('Wellcare Group', 20);


--DML Queries


--Inserting New Record
INSERT INTO Diagnostic_Test (Person_ID, Disease_ID) 
VALUES (21, 3);   -- Now this will work since Person_ID 21 exists.

--2) Updating a record
UPDATE Treatment_Plan 
SET Plan_Description = 'Advanced Chemotherapy' 
WHERE Treatment_Plan_ID = 6;  -- Update a Treatment Plan Description


--3) Deleting a record
DELETE FROM Insurance 
WHERE Insurance_ID = 20; --Deleting an Outdated Insurance Record.

--Running Operational Queries

--1)Query to Retrieve Patients with a Specific Disease:

SELECT p.First_Name, p.Last_Name 
FROM Person p
JOIN Diagnostic_Test dt ON p.Person_ID = dt.Person_ID
JOIN Disease d ON dt.Disease_ID = d.Disease_ID
WHERE d.Disease_Name = 'Cancer';

--2)Query to List All Treatment Plans for Diseases with High Intensity:

SELECT d.Disease_Name, tp.Plan_Description 
FROM Treatment_Plan tp
JOIN Disease d ON tp.Disease_ID = d.Disease_ID
WHERE d.Intensity_Level > 7;

--3) Find Hospitals in a Specific Location:

SELECT h.Name, l.City_Name 
FROM Hospital h
JOIN Location l ON l.Location_ID = l.Location_ID
WHERE l.State_Name = 'California';

--Generating Reports for Analysis:

--5.1) Report on disease frequency by location:
--Query:
SELECT l.City_Name, d.Disease_Name, COUNT(*) as Frequency
FROM Diagnostic_Test dt
JOIN Disease d ON dt.Disease_ID = d.Disease_ID
JOIN Person p ON dt.Person_ID = p.Person_ID
JOIN Location l ON p.Primary_Location_ID = l.Location_ID
GROUP BY l.City_Name, d.Disease_Name
ORDER BY Frequency DESC;

--5.2. Report on healthcare provider workload:
--Query:
SELECT hp.Name, COUNT(*) as NumberOfPatients
FROM Healthcare_Provider hp
JOIN Hospital_Person hp2 ON hp.Hospital_ID = hp2.Hospital_ID
GROUP BY hp.Name
ORDER BY NumberOfPatients DESC;

--Dimensional Model

--Creation Queries:
CREATE SCHEMA DataWarehouse;

--DIMENSION TABLES:

CREATE TABLE DataWarehouse.DimDate (
    DateKey SERIAL PRIMARY KEY,
    Date DATE,
    DayOfWeek VARCHAR(10),
    Month VARCHAR(10),
    Year INT,
    FiscalQuarter INT,
    FiscalYear INT );

CREATE TABLE DataWarehouse.DimPatient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DOB DATE,
    Gender VARCHAR(10),
    Race VARCHAR(50),
    InsuranceStatus VARCHAR(50)  );

CREATE TABLE DataWarehouse.DimDisease (
    DiseaseID INT PRIMARY KEY,
    DiseaseName VARCHAR(255),
    DiseaseType VARCHAR(100),
    Category VARCHAR(100)   );

CREATE TABLE DataWarehouse.DimDiagnosticTest (
    TestID INT PRIMARY KEY,
    TestType VARCHAR(100),
    TestDescription VARCHAR(255) );

CREATE TABLE DataWarehouse.DimTreatment (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(255),
    TreatmentType VARCHAR(100),
    ExpectedDuration INT  );

CREATE TABLE DataWarehouse.DimHealthcareProvider (
    ProviderID INT PRIMARY KEY,
    ProviderName VARCHAR(255),
    Qualification VARCHAR(255),
    Specialization VARCHAR(255),
    HospitalID INT  );

--FACT TABLES

CREATE TABLE DataWarehouse.FactDiagnosis (
    DiagnosisID SERIAL PRIMARY KEY,
    DateKey INT REFERENCES DataWarehouse.DimDate(DateKey),
    PatientID INT REFERENCES DataWarehouse.DimPatient(PatientID),
    DiseaseID INT REFERENCES DataWarehouse.DimDisease(DiseaseID),
    TestID INT REFERENCES DataWarehouse.DimDiagnosticTest(TestID),
    Number_of_Diagnoses INT  );

CREATE TABLE DataWarehouse.FactTreatment (
    TreatmentID SERIAL PRIMARY KEY,
    DateKey INT REFERENCES DataWarehouse.DimDate(DateKey),
    PatientID INT REFERENCES DataWarehouse.DimPatient(PatientID),
    DiseaseID INT REFERENCES DataWarehouse.DimDisease(DiseaseID),
    TreatmentTypeID INT REFERENCES DataWarehouse.DimTreatment(TreatmentID),
    ProviderID INT REFERENCES DataWarehouse.DimHealthcareProvider(ProviderID),
    Outcome VARCHAR(255)    );

--ETL Process

--Insertion Queries for Dimension Model: Dimension and Fact Tables

--DIMENSION TABLES:

INSERT INTO DataWarehouse.DimDate (DateKey, Date, DayOfWeek, Month, Year, FiscalQuarter, FiscalYear)
SELECT DISTINCT
    TO_CHAR(g.date, 'YYYYMMDD')::INT AS DateKey,
    g.date AS Date,
    TO_CHAR(g.date, 'Day') AS DayOfWeek,
    TO_CHAR(g.date, 'Month') AS Month,
    EXTRACT(YEAR FROM g.date) AS Year,
    EXTRACT(QUARTER FROM g.date) AS FiscalQuarter,
    EXTRACT(YEAR FROM g.date) AS FiscalYear
FROM generate_series('2021-01-01'::date, '2024-12-31'::date, '1 day') AS g(date)
ON CONFLICT (DateKey) DO NOTHING  
-- This prevents duplication if some dates are already present
LIMIT 20;  -- This limits the number of entries to 20.

INSERT INTO DataWarehouse.DimPatient (PatientID, FirstName, LastName, DOB, Gender, Race, InsuranceStatus)
SELECT Person_ID, First_Name, Last_Name, NULL AS DOB, NULL AS Gender, Race_CD, NULL AS InsuranceStatus
FROM public.person;

INSERT INTO DataWarehouse.DimDisease (DiseaseID, DiseaseName, DiseaseType, Category)
SELECT Disease_ID, Disease_Name, Disease_Type_Code, NULL AS Category
FROM public.Disease;

INSERT INTO DataWarehouse.DimDiagnosticTest (TestID, TestType, TestDescription)
SELECT Test_ID, NULL AS TestType, NULL AS TestDescription
FROM public.Diagnostic_Test;

INSERT INTO DataWarehouse.DimTreatment (TreatmentID, TreatmentName, TreatmentType, ExpectedDuration)
SELECT Treatment_Plan_ID, Plan_Description, NULL AS TreatmentType, NULL AS ExpectedDuration
FROM public.Treatment_Plan;

INSERT INTO DataWarehouse.DimHealthcareProvider (ProviderID, ProviderName, Qualification, Specialization, HospitalID)
SELECT Provider_ID, Name, NULL AS Qualification, NULL AS Specialization, Hospital_ID
FROM public.Healthcare_Provider;

--FACT TABLES

INSERT INTO DataWarehouse.FactDiagnosis (DiagnosisID, DateKey, PatientID, DiseaseID, TestID, Number_of_Diagnoses)
SELECT Test_ID, 20240101, Person_ID, Disease_ID, Test_ID, COUNT(*)
FROM public.Diagnostic_Test
GROUP BY Test_ID, Person_ID, Disease_ID;

INSERT INTO DataWarehouse.FactTreatment (TreatmentID, DateKey, PatientID, DiseaseID, TreatmentTypeID, ProviderID, Outcome)
SELECT Treatment_Plan_ID, 20240101, NULL AS PatientID, Disease_ID, Treatment_Plan_ID, NULL AS ProviderID, NULL AS Outcome
FROM public.Treatment_Plan;

--Analytical Queries

--1) Disease Incidence by Age Group and Gender :

--Query:

SELECT
    dd.DiseaseName,
    CASE
        WHEN age(dp.dob) BETWEEN '0 years' AND '18 years' THEN 'Children'
        WHEN age(dp.dob) BETWEEN '19 years' AND '60 years' THEN 'Adults'
        ELSE 'Seniors'
    END AS AgeGroup,
    dp.gender,
    COUNT(*) AS DiseaseCount
FROM
    DataWarehouse.FactDiagnosis fd
JOIN
    DataWarehouse.DimPatient dp ON fd.PatientID = dp.PatientID
JOIN
    DataWarehouse.DimDisease dd ON fd.DiseaseID = dd.DiseaseID
GROUP BY
    dd.DiseaseName, AgeGroup, dp.gender
ORDER BY
    dd.DiseaseName, AgeGroup, dp.gender;


--2) Treatment Outcomes by Disease and Treatment Type :

--Query:


SELECT
    dd.DiseaseName,
    dt.TreatmentName,
    ft.Outcome,
    COUNT(*) AS TotalCases
FROM
    DataWarehouse.FactTreatment ft
JOIN
    DataWarehouse.DimDisease dd ON ft.DiseaseID = dd.DiseaseID
JOIN
    DataWarehouse.DimTreatment dt ON ft.TreatmentTypeID = dt.TreatmentID
GROUP BY
    dd.DiseaseName, dt.TreatmentName, ft.Outcome
ORDER BY
    dd.DiseaseName, dt.TreatmentName, ft.Outcome;


--3) Diagnostic Test Usage and Diagnosis Correlation:
--Query:
SELECT
    ddt.TestDescription,
    dd.DiseaseName,
    COUNT(fd.TestID) AS NumberOfUses,
    COUNT(CASE WHEN fd.DiseaseID IS NOT NULL THEN 1 END) AS SuccessfulDiagnoses
FROM
    DataWarehouse.DimDiagnosticTest ddt
JOIN
    DataWarehouse.FactDiagnosis fd ON ddt.TestID = fd.TestID
JOIN
    DataWarehouse.DimDisease dd ON fd.DiseaseID = dd.DiseaseID
GROUP BY
    ddt.TestDescription, dd.DiseaseName
ORDER BY
    NumberOfUses DESC;


--4) Healthcare Provider Efficiency :

--Query:

SELECT
    dhp.ProviderName,
    COUNT(*) AS TreatmentsAdministered,
    COUNT(CASE WHEN ft.Outcome = 'Successful' THEN 1 ELSE NULL END) AS SuccessfulTreatments,
    ROUND((COUNT(CASE WHEN ft.Outcome = 'Successful' THEN 1 ELSE NULL END)::decimal / COUNT(*)) * 100, 2) AS SuccessRate
FROM
    DataWarehouse.FactTreatment ft
JOIN
    DataWarehouse.DimHealthcareProvider dhp ON ft.ProviderID = dhp.ProviderID
GROUP BY
    dhp.ProviderName
ORDER BY
    SuccessRate DESC;


--5) Trends in Disease Diagnosis Over Time: 
--Query:
SELECT
    dd.DiseaseName,
    EXTRACT(YEAR FROM dm.Date) AS Year,
    EXTRACT(MONTH FROM dm.Date) AS Month,
    COUNT(*) AS MonthlyDiagnoses
FROM
    DataWarehouse.FactDiagnosis fd
JOIN
    DataWarehouse.DimDate dm ON fd.DateKey = dm.DateKey
JOIN
    DataWarehouse.DimDisease dd ON fd.DiseaseID = dd.DiseaseID
GROUP BY
    dd.DiseaseName,
    EXTRACT(YEAR FROM dm.Date),
    EXTRACT(MONTH FROM dm.Date)
ORDER BY
    dd.DiseaseName, Year, Month;











