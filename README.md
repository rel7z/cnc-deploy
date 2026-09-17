# CNC Cluster Deployment

Automated installer and precompiled binaries for the CNC Distributed Cluster.

## 🚀 One-Line Interactive Installer

Clone and run the interactive configurator on Debian/Ubuntu Linux:

```bash
git clone https://github.com/rel7z/cnc-deploy && cd cnc-deploy && ./install.py
```

Or run via bash installer wrapper:

```bash
git clone https://github.com/rel7z/cnc-deploy && cd cnc-deploy && ./install.sh
```

---

## 🛠 Manual Quick Setup

### Role 1: CNC Server + Web Dashboard
```bash
# 1. Update system & install Node 20
apt update && apt install git curl build-essential -y
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install nodejs -y

# 2. Clone repositories
git clone https://github.com/rel7z/cnc-deploy && cd cnc-deploy
git clone https://github.com/rel7z/cnc

# 3. Configure & Start Server
chmod +x cnc-server-linux
./cnc-server-linux -config=server_config.json &

# 4. Start Dashboard
cd cnc && npm install && npm run build && npm start
```

### Role 2: CNC Worker Node
```bash
apt update -y && \
wget https://github.com/rel7z/cnc-deploy/raw/refs/heads/main/cnc-worker-linux && \
wget https://raw.githubusercontent.com/rel7z/cnc-deploy/refs/heads/main/worker_config.json && \
chmod +x cnc-worker-linux && \
git clone https://github.com/rel7z/worker-tools tools && \
./cnc-worker-linux -config=worker_config.json
```
