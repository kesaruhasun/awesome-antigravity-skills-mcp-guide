# ☁️ The Ultimate Free Cloud VPS & Hosting Guide

A developer's handbook for deploying servers, databases, Docker containers, and MCP agents at zero cost.

---

## 📑 Table of Contents

- [1. Oracle Cloud Infrastructure (OCI) Always Free](#1-oracle-cloud-infrastructure-oci-always-free)
- [2. Google Cloud Platform (GCP) Always Free](#2-google-cloud-platform-gcp-always-free)
- [3. Amazon Web Services (AWS) Free Tier](#3-amazon-web-services-aws-free-tier)
- [4. Modern PaaS & Container Platforms](#4-modern-paas--container-platforms)
- [5. VPS Security Hardening Checklist](#5-vps-security-hardening-checklist)

---

## 1. Oracle Cloud Infrastructure (OCI) Always Free

Oracle Cloud offers the most generous free cloud tier in the industry. It is permanent and does **not** expire after a trial period.

* **Sign-up Link:** [oracle.com/cloud/free](https://www.oracle.com/cloud/free/)

### What You Get for Free:
- **ARM Ampere A1 Compute:** Up to **4 OCPUs** and **24 GB of RAM**. You can split this across 1 to 4 virtual machines (e.g., one huge 4-core / 24GB instance or two 2-core / 12GB instances).
- **AMD x86_64 Compute:** 2 micro VMs (1/8 OCPU, 1 GB RAM each).
- **Storage:** **200 GB** total NVMe Block Storage (distributed across your VMs).
- **Network Egress:** **10 TB per month** of free outbound bandwidth.
- **Databases:** 2 Free Oracle Autonomous Databases (20 GB each).

```
┌────────────────────────────────────────────────────────────┐
│              ORACLE CLOUD ALWAYS FREE TIER                 │
├────────────────────────────┬───────────────────────────────┤
│ 🚀 4 ARM OCPUs             │ 💾 200 GB NVMe Storage        │
│ 🧠 24 GB RAM               │ 🌐 10 TB/month Free Bandwidth │
│ 🖥️ 2 x86_64 Micro VMs      │ 🗄️ 2 Autonomous Databases     │
└────────────────────────────┴───────────────────────────────┘
```

### Pro-Tips for Oracle Cloud:
1. **Selecting Home Region:** Choose your home region carefully during sign-up. Free ARM capacity can be competitive in high-density regions (like US-East-Ashburn or Frankfurt). Consider regions like US-West (San Jose/Phoenix) or Singapore/Tokyo.
2. **Avoiding Idle VM Reclamation:** Oracle monitors Always Free instances for idle utilization (CPU < 10%, Memory < 10%). To protect your VMs:
   - Deploy real workloads (Docker containers, Discord bots, MCP servers, CI runners).
   - **Recommended:** Upgrade your account to **Pay-As-You-Go (PAYG)** after account verification. You will **not** be charged as long as you stay within the Always Free limits, and PAYG accounts are immune to idle instance reclamation.

---

## 2. Google Cloud Platform (GCP) Always Free

Google Cloud provides an Always Free tier that includes compute, serverless execution, and data analytics.

* **Sign-up Link:** [cloud.google.com/free](https://cloud.google.com/free)

### What You Get for Free:
- **Compute Engine:** 1 `e2-micro` VM instance (0.25 vCPU, 1 GB RAM) per month in US regions:
  - `us-west1` (Oregon)
  - `us-central1` (Iowa)
  - `us-east1` (South Carolina)
- **Disk Storage:** 30 GB standard persistent disk storage.
- **BigQuery:** 10 GB active storage and **1 TB of query data processing** per month.
- **Cloud Run:** 2,000,000 requests per month (360,000 GB-seconds memory, 180,000 vCPU-seconds).
- **Cloud Functions:** 2,000,000 invocations per month.
- **Cloud Storage:** 5 GB regional storage (US).

---

## 3. Amazon Web Services (AWS) Free Tier

AWS offers a mixture of 12-Month Free services and permanent Always Free services.

* **Sign-up Link:** [aws.amazon.com/free](https://aws.amazon.com/free/)

### 12 Months Free:
- **Amazon EC2:** 750 hours/month of `t2.micro` or `t3.micro` Linux/Windows VM instances.
- **Amazon RDS:** 750 hours/month of single-AZ `db.t2.micro` / `db.t3.micro` / `db.t4g.micro` database (MySQL, PostgreSQL, MariaDB).
- **Amazon S3:** 5 GB standard cloud storage.

### Always Free (Permanent):
- **AWS Lambda:** 1,000,000 free requests per month.
- **Amazon DynamoDB:** 25 GB NoSQL database storage (handles up to 200M requests/month).
- **Amazon CloudFront:** **1 TB of outbound data transfer** per month.
- **Amazon SNS:** 1,000,000 free mobile push notifications / pub-sub messages.

---

## 4. Modern PaaS & Container Platforms

For hosting serverless APIs, Dockerized MCP servers, and full-stack frontends:

| Platform | Free Capabilities | Best For | URL |
| :--- | :--- | :--- | :--- |
| **Fly.io** | Generous allowances for small micro VMs & edge routing | Dockerized apps, low-latency APIs | [fly.io](https://fly.io) |
| **Render** | 750 free instance hours/month for web services | Node.js / Python web backends | [render.com](https://render.com) |
| **Koyeb** | Free Nano instance, automated git deployments | Microservices & webhooks | [koyeb.com](https://koyeb.com) |
| **Cloudflare** | Unlimited DDoS protection, Pages, 100k Workers/day | Ultra-fast edge logic & static sites | [cloudflare.com](https://cloudflare.com) |
| **Vercel** | 100 GB bandwidth, serverless edge functions | Next.js & modern frontend apps | [vercel.com](https://vercel.com) |
| **Netlify** | 100 GB bandwidth, 300 build minutes/month | Static sites & JAMstack apps | [netlify.com](https://netlify.com) |

---

## 5. VPS Security Hardening Checklist

Whenever you spin up a new Linux VPS (Ubuntu / Debian), follow these essential hardening steps immediately:

```bash
# 1. Update system packages
sudo apt update && sudo apt upgrade -y

# 2. Create a non-root sudo user
sudo adduser deployer
sudo usermod -aG sudo deployer

# 3. Configure SSH key authentication and disable root login
sudo mkdir -p /home/deployer/.ssh
sudo cp ~/.ssh/authorized_keys /home/deployer/.ssh/
sudo chown -R deployer:deployer /home/deployer/.ssh
sudo chmod 700 /home/deployer/.ssh
sudo chmod 600 /home/deployer/.ssh/authorized_keys

# 4. Lock down SSH configuration (/etc/ssh/sshd_config)
# Set: PermitRootLogin no
# Set: PasswordAuthentication no
sudo systemctl restart ssh

# 5. Enable UFW Firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# 6. Install Fail2Ban to block brute-force attacks
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```
