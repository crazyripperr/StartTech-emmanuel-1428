# StartTech Application — Emmanuel-1428

> Full-stack Todo application: React frontend + Golang backend with automated CI/CD.

## 🗂️ Repository Structure

```
StartTech-emmanuel-1428/
├── .github/workflows/
│   ├── frontend-ci-cd.yml   ← Runs when Client/ changes: build → test → S3
│   └── backend-ci-cd.yml    ← Runs when Server/ changes: test → Docker → EC2
├── Client/                  ← React frontend (forked from original repo)
├── Server/                  ← Golang backend (forked from original repo)
├── backend/
│   └── Dockerfile           ← How to containerise the Golang app
├── frontend/
│   ├── Dockerfile           ← For local testing only
│   └── nginx.conf           ← Nginx config for the test container
└── scripts/
    ├── deploy-frontend.sh   ← Manual frontend deploy
    ├── deploy-backend.sh    ← Manual backend deploy
    ├── health-check.sh      ← Check all services are alive
    └── rollback.sh          ← Roll back to a previous version
```

## 🚀 Quick Start (Local Development)

```bash
# 1. Clone this repo
git clone https://github.com/YOUR_USERNAME/StartTech-emmanuel-1428
cd StartTech-emmanuel-1428

# 2. Start backend
cd Server
go mod download
go run main.go

# 3. Start frontend (new terminal)
cd Client
npm install
npm run dev
```

## 🔄 CI/CD Pipelines

Pipelines trigger **automatically** when you push to `main`.

| What you push to | Pipeline triggers | Result |
|------------------|------------------|--------|
| `Client/` folder | frontend-ci-cd.yml | React → S3 → CloudFront |
| `Server/` folder | backend-ci-cd.yml | Go → Docker Hub → EC2 |

See the infra repo README for GitHub Secrets setup.

## 🏥 Manual Health Check

```bash
./scripts/health-check.sh YOUR_ALB_DNS_NAME
```

## ⏪ Rollback

If a deploy breaks something:

```bash
# Find the last working image tag from Docker Hub
./scripts/rollback.sh YOUR_DOCKERHUB_USERNAME abc1234
```
