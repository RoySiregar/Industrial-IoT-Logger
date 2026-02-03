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
1.  **Digital Twin Simulator (Publisher):** Simulates a manufacturing robot generating production data (Cycle Time, Pass/Fail status, Defect Codes) based on realistic probabilistic logic.
2.  **Data Subscriber (Consumer):** Listens to the MQTT stream, parses raw string payloads, performs quality logic checks, and persists the data into a MySQL database.

---

## 📸 Screenshots

### 1. Real-time Data Stream (Console App)
The application handles asynchronous tasks: The **Simulator (Robot)** sends data (Cyan/Red logs), while the **Subscriber** simultaneously processes and saves it (Green logs).
![Console Log](screenshots/running_log.png)

### 2. Database Storage (HeidiSQL)
Parsed production data stored in MySQL. Notice the extracted **Cycle Time (ct_time)** and **Result** columns derived from the raw MQTT message.
![Database Result](screenshots/database_result.png)

---

## 🛠️ Tech Stack & Tools

* **Language:** C# (.NET Console Application)
* **Communication Protocol:** MQTT (Message Queuing Telemetry Transport)
* **Libraries:**
    * `MQTTnet` (High-performance MQTT client)
    * `Newtonsoft.Json` (JSON Serialization)
    * `Dapper` (Micro-ORM for fast SQL execution)
    * `MySql.Data` (Database Connector)
* **Database:** MySQL (Hosted via Laragon/XAMPP)
* **Tools:** Visual Studio 2022, HeidiSQL

---

## 🚀 Key Features

### 🧠 1. Intelligent Data Parsing
The system receives a raw CSV-like string embedded in JSON (e.g., `"15.20,Defect Detected,dirty"`) and intelligently splits it to extract:
* **Cycle Time (CT):** For OEE calculation.
* **Defect Type:** (e.g., scratch, dirty, shift) for quality analysis.
* **Inspection Result:** Auto-determines PASS/FAIL based on log levels.

### ⚡ 2. Asynchronous Architecture
Uses C# `async/await` and `Task.Run` to ensure the **Simulator** loop does not block the **Subscriber** listener. This simulates a non-blocking, multi-threaded industrial environment.

### 🎲 3. Realistic Simulation Logic
The "Digital Twin" module doesn't just send random text. It simulates:
* **Probabilistic Failure:** 30% chance of failure (Defect) vs 70% success.
* **Randomized Cycle Time:** Varies between 15.0s - 30.0s.
* **Dynamic Attributes:** Randomly assigns Line IDs, Station Names, and Project Models from a predefined dictionary.

### 🛡️ 4. Robust Error Handling
Implements `try-catch` blocks globally to prevent application crashes during network jitter or database disconnection, ensuring 24/7 uptime capability.

---

## ⚙️ Installation & Setup

Follow these steps to run the project locally.

### Prerequisites
* .NET SDK (6.0 or later)
* MySQL Server (via Laragon, XAMPP, or Docker)
* MQTT Broker (Mosquitto is recommended, or use the embedded logic)

### Step 1: Clone the Repository
```bash
git clone [https://github.com/RoySiregar/Industrial-IoT-Logger.git](https://github.com/RoySiregar/Industrial-IoT-Logger.git)
cd Industrial-IoT-Logger