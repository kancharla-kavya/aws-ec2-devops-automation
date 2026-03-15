# AWS EC2 DevOps Automation Project

## Project Overview

This project demonstrates basic **DevOps automation using AWS CLI** to provision and configure cloud infrastructure.

Using shell scripts, the project automatically creates multiple EC2 instances and installs web servers on them.

* **Linux Instances** → Install and configure **NGINX**
* **Windows Instances** → Access using **Remote Desktop (RDP)** and optionally install **IIS**

The goal of this project is to understand **infrastructure automation, cloud provisioning, and basic DevOps workflows**.

---

# Technologies Used

* AWS EC2
* AWS CLI
* Bash Scripting
* Linux (Amazon Linux)
* Windows Server
* NGINX Web Server
* Git & GitHub

---

# Project Architecture

The automation performs the following tasks:

1. Creates **Linux EC2 instances**
2. Creates **Windows EC2 instances**
3. Installs **NGINX automatically on Linux**
4. Opens required ports using **Security Groups**
5. Deploys a simple web page

---

# Project Files

```
aws-ec2-devops-automation/
│
├── create-linux.sh
├── create-windows.sh
├── deploy.sh
├── nginx-install.sh
└── README.md
```

### File Description

| File              | Purpose                               |
| ----------------- | ------------------------------------- |
| create-linux.sh   | Creates Linux EC2 instances           |
| create-windows.sh | Creates Windows EC2 instances         |
| deploy.sh         | Main automation script                |
| nginx-install.sh  | Installs NGINX automatically on Linux |

---

# How to Run the Project

### Step 1: Configure AWS CLI

```
aws configure
```

Enter your:

* Access Key
* Secret Key
* Region (example: ap-south-1)

---

### Step 2: Clone Repository

```
git clone https://github.com/YOUR_USERNAME/aws-ec2-devops-automation.git
cd aws-ec2-devops-automation
```

---

### Step 3: Run the Deployment Script

```
bash deploy.sh
```

This script will:

* Launch Linux instances
* Launch Windows instances
* Install NGINX automatically on Linux

---

# Testing the Deployment

Open the **Public IP address of the Linux instance** in your browser:

```
http://PUBLIC_IP
```

Expected Output:

```
DevOps Automation Project - Kavya
```

---

# Security Group Ports Used

| Port | Purpose              |
| ---- | -------------------- |
| 22   | SSH (Linux access)   |
| 80   | HTTP Web Server      |
| 3389 | RDP (Windows access) |

---

# Learning Outcomes

Through this project you learn:

* AWS EC2 provisioning
* Infrastructure automation
* Bash scripting
* Web server deployment
* DevOps basics

---

# Future Improvements

* Terraform infrastructure automation
* CI/CD integration
* Docker container deployment
* Auto-scaling setup

