# 🏭 Industrial IoT Data Logger & Simulator

![.NET](https://img.shields.io/badge/.NET-8.0-purple?style=for-the-badge&logo=dotnet)
![MQTT](https://img.shields.io/badge/Protocol-MQTT-blue?style=for-the-badge&logo=mqtt)
![MySQL](https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)

> **An end-to-end Industrial IoT (IIoT) solution simulating a Smart Factory environment.**  
> This project demonstrates a high-performance data pipeline that captures, parses, and stores real-time telemetry data from robotic machinery using the MQTT protocol.

---

## 📖 Project Overview

In the era of **Industry 4.0**, real-time data acquisition is critical. This application acts as a centralized **Factory Monitoring System** that bridges the gap between shop-floor machinery and database storage.

It operates using a **Dual-Agent Architecture** running asynchronously:

1. **Digital Twin Simulator (Publisher)**  
   Simulates a manufacturing robot generating production data (Cycle Time, Pass/Fail status, Defect Codes) based on realistic probabilistic logic.

2. **Data Subscriber (Consumer)**  
   Listens to the MQTT stream, parses raw string payloads, performs quality logic checks, and persists the data into a MySQL database.

---

## 📸 Screenshots

### 1. Real-time Data Stream (Console App)
The application handles asynchronous tasks: the **Simulator (Robot)** sends data (Cyan/Red logs), while the **Subscriber** simultaneously processes and saves it (Green logs).

![Console Log](screenshots/running_log.PNG)

### 2. Database Storage (HeidiSQL)
Parsed production data stored in MySQL. Notice the extracted **Cycle Time (ct_time)** and **Result** columns derived from the raw MQTT message.

![Database Result](screenshots/database_result.PNG)  
![Database Result 2](screenshots/database_result1.PNG)

---

## 🛠️ Tech Stack & Tools

- **Language:** C# (.NET Console Application)
- **Communication Protocol:** MQTT (Message Queuing Telemetry Transport)
- **Libraries:**
  - MQTTnet
  - Newtonsoft.Json
  - Dapper
  - MySql.Data
- **Database:** MySQL (Laragon / XAMPP)
- **Tools:** Visual Studio 2022, HeidiSQL

---

## 🚀 Key Features

### 🧠 Intelligent Data Parsing
Parses raw CSV-like strings embedded in JSON (e.g. `"15.20,Defect Detected,dirty"`) to extract:
- Cycle Time (CT)
- Defect Type
- PASS / FAIL result

### ⚡ Asynchronous Architecture
Uses `async/await` and `Task.Run` to prevent blocking between simulator and subscriber processes.

### 🎲 Realistic Simulation Logic
- 70% PASS / 30% FAIL probability
- Random cycle time (15–30 seconds)
- Dynamic Line, Station, and Project assignment

### 🛡️ Robust Error Handling
Global `try-catch` ensures stability against MQTT or database connection issues.

---

## ⚙️ Installation & Setup

### Prerequisites
- .NET SDK 6.0+
- MySQL Server (Laragon / XAMPP / Docker)
- MQTT Broker (Mosquitto recommended)

---

### Step 1: Clone the Repository
```bash
git clone https://github.com/RoySiregar/Industrial-IoT-Logger.git
cd Industrial-IoT-Logger
```

### Step 2: Configure Database
Open your SQL Client (HeidiSQL/phpMyAdmin) and execute the script found in sql/schema.sql:
```bash
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
```

### Step 3: Run the Application
1.Open the solution file src/StationRunningStateService.sln in Visual Studio.

2.Check Program.cs to ensure the MySQL Connection String matches your local setup:
```bash
static string _dbConnString = "Server=127.0.0.1;Port=3306;Database=aoi;Uid=root;Pwd=;";
3.Press F5 or click Start.
```

### 🔮 Future Improvements
[ ] Add a Web Dashboard (Blazor/ASP.NET Core) to visualize OEE charts.
[ ] Implement Docker support for containerized deployment.
[ ] Add Telegram/Email alerts when consecutive failures occur.

### 👤 Author
### Roy Siregar
### Passionate about Industrial Automation, IoT, and Backend Engineering.


