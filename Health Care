-- Patient Table
CREATE TABLE Patient (
  PatientID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(100),
  DateOfBirth DATE,
  ContactNumber VARCHAR(20)
);

-- Medical History Table
CREATE TABLE MedicalHistory (
  HistoryID INT PRIMARY KEY,
  PatientID INT,
  Diagnosis VARCHAR(100),
  Treatment VARCHAR(100),
  Surgery VARCHAR(100),
  Medication VARCHAR(100),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Lab Results Table
CREATE TABLE LabResults (
  LabResultID INT PRIMARY KEY,
  PatientID INT,
  TestType VARCHAR(100),
  Result VARCHAR(100),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Prescriptions Table
CREATE TABLE Prescriptions (
  PrescriptionID INT PRIMARY KEY,
  PatientID INT,
  MedicationName VARCHAR(100),
  Dosage VARCHAR(50),
  Frequency VARCHAR(50),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Outcome Table
CREATE TABLE Outcome (
  OutcomeID INT PRIMARY KEY,
  PatientID INT,
  ReadmissionRate FLOAT,
  MedicationAdherence FLOAT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Example queries:

-- Get all patients
SELECT * FROM Patient;

-- Get patient's medical history
SELECT * FROM MedicalHistory WHERE PatientID = 1;

-- Get patient's lab results
SELECT * FROM LabResults WHERE PatientID = 1;

-- Get patient's prescriptions
SELECT * FROM Prescriptions WHERE PatientID = 1;

-- Get patient's outcomes
SELECT * FROM Outcome WHERE PatientID = 1;
