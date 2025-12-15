# 🎮 Tic Tac Toe Game

A professional Tic Tac Toe game built with **Spring Boot** and deployable anywhere!

## ✨ Features

- 🤖 Play against intelligent AI
- 📱 Responsive web interface
- 🚀 One-command deployment
- 🐳 Docker containerized
- 💪 Cross-platform compatibility

---

## 🚀 Quick Start

### Prerequisites
- **Docker** (easiest) OR **Java 17 + Maven**

### Deploy with Docker (Recommended)

#### Linux/macOS:
```bash
git clone https://github.com/rachitkumar2105/tic-tac-toe.git
cd TIC-TAC-TOE
chmod +x run.sh
./run.sh
```

#### Windows:
```cmd
git clone https://github.com/rachitkumar2105/TIC-TAC-TOE.git
cd TIC-TAC-TOE
run.bat
```

#### Manual Docker:
```bash
docker build -t tictactoe:latest .
docker run -d --name tictactoe -p 8080:8080 tictactoe:latest
```

### Deploy with Docker Compose

```bash
docker-compose up -d
```

### Deploy with JAR (No Docker)

```bash
# Build
mvn clean package

# Run
java -jar target/tictactoe-1.0.0.jar
```

---

## 📍 Access the App

- **Local Machine**: http://localhost:8080
- **Other Devices on Network**: http://<your-machine-ip>:8080
  
  Find your IP:
  - Linux/macOS: `ifconfig | grep inet`
  - Windows: `ipconfig`

---

## 🔧 Deployment Scenarios

### Cloud Deployment (Render, Railway, Heroku)

1. Push to GitHub
2. Connect repository to platform
3. Platform auto-detects Dockerfile
4. Auto-deploys on push

### On-Premises Server

```bash
# SSH into server
ssh user@server-ip

# Clone repo
git clone https://github.com/rachitkumar2105/TIC-TAC-TOE.git
cd TIC-TAC-TOE

# Run
./run.sh

# Access from browser: http://server-ip:8080
```

### Kubernetes

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tictactoe
spec:
  replicas: 2
  selector:
    matchLabels:
      app: tictactoe
  template:
    metadata:
      labels:
        app: tictactoe
    spec:
      containers:
      - name: tictactoe
        image: rachitkumar2105/tictactoe:latest
        ports:
        - containerPort: 8080
        livenessProbe:
          httpGet:
            path: /actuator/health
            port: 8080
          initialDelaySeconds: 40
          periodSeconds: 10
```

---

## 🛠️ Troubleshooting

### Check if Docker container is running
```bash
docker ps | grep tictactoe
```

### View logs
```bash
docker logs -f tictactoe
```

### Check health endpoint
```bash
curl http://localhost:8080/actuator/health
```

### Stop and remove container
```bash
docker stop tictactoe
docker rm tictactoe
```

### Port 8080 already in use?
```bash
docker run -d --name tictactoe -p 9090:8080 tictactoe:latest
# Access at http://localhost:9090
```

---

## 🔒 Firewall Configuration

Ensure port **8080** is open:

### Linux (UFW)
```bash
sudo ufw allow 8080
```

### Windows Firewall
- Open Windows Defender Firewall → Advanced Settings
- New Inbound Rule → Port 8080 → Allow

### Cloud (AWS, Azure, GCP)
- Add inbound rule for port 8080

---

## 📦 Project Structure
