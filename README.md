# 🌍 GroundPass

GroundPass is an iOS app developed in SwiftUI that predicts and displays satellite passes visible from the user's location. The app combines orbital data (TLEs) with prediction algorithms to calculate trajectories and visibility times, notifying the user of upcoming flyovers.

---

## ✨ Features
- Browse and search satellites with real-time data.  
- Mark your favorite satellites for quick access.  
- Modern SwiftUI interface with clean architecture.  
- Configurable API integration via `Config.xcconfig`.

---

## ⚙️ Requirements
- iOS 17.0+  
- Xcode 15+  
- Swift 5.9+  
- Backend service running locally (see below)

---

## 🔧 How to configure the API keys (`Config.xcconfig`)

GroundPass requires API keys and backend configuration to work correctly. Follow these steps:

### 1️⃣ Copy the example config
The repository includes a template with fake values. Copy it to create your local configuration file:

```bash
cp Config.example.xcconfig Config.xcconfig
```
Open Config.xcconfig and replace the placeholder values with your real API keys or backend URLs:

```
// Config.xcconfig
API_KEY_N2YO = YOUR_REAL_API_KEY
```

⚠️ Do not commit this file. It contains sensitive information.

Make sure Config.xcconfig is ignored by Git to avoid accidentally pushing your keys:

### 2️⃣ Connect the config to your Xcode project
Open your project in Xcode.
Go to your Target → Info → Configurations.
For each build configuration (Debug/Release), select your Config.xcconfig file as the base.

---

## 🖥️ Backend Setup

Search functionality in GroundPass depends on a backend service. Follow these steps:

### 1️⃣ Clone the backend repository
```bash
git clone https://github.com/your-username/groundpass-backend.git
cd groundpass-backend
```

### 2️⃣ Install dependencies
```bash
brew install node
```

### 3️⃣ Keep the backend running
In order to run the backend do the following:
```bash
cd groundpass-backend
node server.js
```
Make sure the backend runs on http://localhost:3000 or update your API_URL in Config.xcconfig.

The app needs the backend running locally to perform searches.
Open a simulator or device and run the app while the backend server is active.

---

## 🚀 Getting Started
Open GroundPass.xcodeproj in Xcode.
Select your target device or simulator.
Run the project (Cmd + R).

--- 

## 📚 Tech Stack
- SwiftUI
- SwiftData
- Clean Architecture
- REST API integration
- Local backend (Node.js/Express)
