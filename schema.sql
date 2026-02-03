CREATE DATABASE IF NOT EXISTS aoi;
USE aoi;

CREATE TABLE IF NOT EXISTS ptbproductiondata (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Factory VARCHAR(50),
    Floor VARCHAR(50),
    Line VARCHAR(50),
    Project VARCHAR(100),
    StationName VARCHAR(100),
    EquipmentName VARCHAR(100),
    CurrentTime DATETIME,
    Level VARCHAR(50),
    Category VARCHAR(50),
    Description VARCHAR(100),
    Message TEXT,
    ct_time VARCHAR(50),
    result VARCHAR(50),
    RecordedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);