# CNC Cluster — One-Time Automated Installer

Interactive and headless setup tool for deploying CNC Server (with UI Dashboard) and Worker nodes.

---

## 🚀 Quick Start (One-Liner)

Run the one-liner command directly on any Debian/Ubuntu VPS:

### 1. Interactive Menu
```bash
curl -sSL https://raw.githubusercontent.com/rel7z/cnc/main/bin/install.sh | bash
```

### 2. Quick Server Setup (Headless / Direct)
```bash
curl -sSL https://raw.githubusercontent.com/rel7z/cnc/main/bin/install.sh | bash -s -- --role server
```

### 3. Quick Worker Setup (Headless / Direct)
```bash
curl -sSL https://raw.githubusercontent.com/rel7z/cnc/main/bin/install.sh | bash -s -- --role worker --server-addr 1.2.3.4:9090
```

---

## 🛠 Local Execution

If you already cloned the repository:

```bash
python3 bin/install.py
```

Or specify the target role:

```bash
# Server setup
python3 bin/install.py --role server

# Worker node setup
python3 bin/install.py --role worker --server-addr 1.2.3.4:9090
```

---

## 📦 What the Installer Does

### Role 1: CNC Server + Web Dashboard
- Installs system packages: `git`, `curl`, `wget`, `jq`, `build-essential`.
- Automatically sets up **Node.js 20 LTS** & npm.
- Clones / verifies the codebase.
- Interactively configures `server_config.json`:
  - HTTP Dashboard Port (e.g. `:8080`)
  - TCP Worker Port (e.g. `:9090`)
  - WordPress & Joomla Plugins Directories (e.g. `~/plugins/wp`, `~/plugins/joomla`)
  - Google Drive Auto-Sync, Watch Directory (`~/merged`), and OAuth Credentials.
- Builds backend binaries (`cnc-server`, `tools/cms-scan`).
- Installs UI dependencies & builds Next.js dashboard (`npm install && npm run build`).
- *(Optional)* Creates and enables systemd background services (`cnc-server.service` & `cnc-ui.service`).

### Role 2: CNC Worker Node
- Installs worker dependencies.
- Downloads `cnc-worker-linux` and sets executable permissions.
- Clones `https://github.com/rel7z/worker-tools` into `./tools`.
- Interactively configures `worker_config.json` (server address, worker ID, CPU concurrency).
- *(Optional)* Creates and enables systemd service `cnc-worker.service` to keep the worker online 24/7.
