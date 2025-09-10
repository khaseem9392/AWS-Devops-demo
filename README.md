
# 🚀 AWS DevOps Engineer Demo Project

## 🏗️ Architecture Diagram  
![Architecture Diagram](architecture.jpg)
![Architecture Diagram](architechure2.png)


- **VPC**: Contains public and private subnets, routing tables, and security groups.
- **EC2 Instance**: Hosts a sample Flask app running in a Docker container.
- **RDS (PostgreSQL)**: Managed relational database service.
- **CloudWatch**: Collects application and infrastructure logs and metrics.
- **CI/CD Pipeline (GitHub Actions)**: Automates infrastructure provisioning and app deployment.
- **IAM Roles**: Ensures least-privilege security access.

---

## ✅ Tech Stack Justification

| Tool | Reason |
|------|--------|
| **Terraform** | Declarative Infrastructure as Code (IaC) allows version control, reproducibility, and modular infrastructure provisioning. |
| **GitHub Actions** | Native CI/CD integration with GitHub to automate infrastructure provisioning, app builds, and deployments in a secure, auditable way. |
| **Docker** | Ensures containerized, consistent app deployment across environments (dev/staging/prod). Simple portability and isolation. |
| **CloudWatch** | Provides central logging and metrics for both EC2 and RDS instances, aiding in debugging and monitoring system health. |
| **IAM Roles** | Secure authentication without hardcoded secrets by using roles with minimum permissions assigned to EC2/RDS services. |

---

# AWS DevOps Demo Project - Setup Guide

## ✅ Step 1 – Prerequisites Installation

### Install VS Code  
[https://code.visualstudio.com/](https://code.visualstudio.com/)

### Install Required VS Code Extensions  
- Terraform by HashiCorp  
- Docker  
- Python  

### Install Tools Locally  
- Terraform CLI  
- AWS CLI  
- Docker Desktop  

---


# AWS DevOps Demo Project - Setup Guide

## ✅ Step 1 – Prerequisites Installation

### Install VS Code  
https://code.visualstudio.com/

### Install Required VS Code Extensions  
- Terraform by HashiCorp  
- Docker  
- Python  

### Install Tools Locally  
- Terraform CLI  
- AWS CLI  
- Docker Desktop  

---

## ✅ Step 2 – Configure AWS CLI Credentials

```bash
aws configure
```

**Input:**  
- AWS Access Key ID  
- AWS Secret Access Key  
- Default region: `us-east-1`  
- Output format: `json`  

---

## ✅ Step 3 – Clone the Repository

```bash
git clone https://github.com/your-username/aws-devops-demo.git
cd aws-devops-demo
```

---

## ✅ Step 4 – Terraform Initialization

```bash
cd iac/environments/dev
terraform init
```

**Expected Output:**  
```
Terraform has been successfully initialized!
```

---

## ✅ Step 5 – Apply Terraform Configuration

```bash
terraform apply -var-file="terraform.tfvars" -auto-approve
```

**Expected Outputs Example:**  
```
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:
ec2_ip = "3.122.45.67"
rds_endpoint = "mydb.abcd1234.us-east-1.rds.amazonaws.com:5432"
vpc_id = "vpc-0a1b2c3d4e5f67890"
```

---

## ✅ Step 6 – Build and Run Sample App Locally (Optional)

### Navigate to Sample App

```bash
cd app/sample-app
```

### Build Docker Image

```bash
docker build -t sample-app:latest .
```

### Run the Container

```bash
docker run -p 80:80 sample-app
```

### Test Locally

```bash
curl http://localhost
```

**Expected Response:**  
```
Hello from Sample App running on EC2!
```

---

## ✅ Step 7 – Access App on Deployed EC2

Retrieve Public IP from Terraform output:

```bash
terraform output ec2_ip
```

Access in browser:  
```
http://<ec2_ip>
```

**Expected Response:**  
```
Hello from Sample App running on EC2!
```

---

## ✅ Step 8 – Monitoring Logs

1. Log in to AWS Console  
2. Navigate to CloudWatch → Logs → Log Groups → `/aws/sample-app`  
3. View logs from EC2 and RDS  

---

## ✅ Step 9 – CI/CD Automation

After pushing to the GitHub repo:  
- GitHub Actions workflow auto-applies Terraform  
- Builds and deploys the Docker sample app  

Example workflow file:  
```
pipeline/github-actions.yml
```


## 📊 Monitoring & Logging
- Logs are available in **AWS CloudWatch**:
    - **EC2 Logs** → `/aws/sample-app`
    - **RDS Logs** → Automatic PostgreSQL logs
- CloudWatch Alarms can be added for CPU thresholds or failed logins (optional).

---

## 🌟 Bonus Features

- ✅ **Auto-scaling Group**: EC2 instances automatically scale based on CPU utilization thresholds.
- ✅ **Canary Deployment**: Implemented in the GitHub Actions pipeline for gradual rollout of app versions.

---

## ✅ Security Best Practices
- Use of IAM roles assigned to EC2 and RDS resources.
- No hardcoded AWS credentials in the Terraform code.
- Secrets (like DB passwords) passed via Terraform variables and stored securely (in practice: AWS Secrets Manager).

---

## 📂 Example Outputs

```bash
ec2_ip = "3.122.45.67"
rds_endpoint = "mydb.abcd1234.us-east-1.rds.amazonaws.com:5432"
vpc_id = "vpc-0a1b2c3d4e5f67890"
```
"Suggestions and project improvement ideas are welcomed!"
Thanks a lot,
Project Leader
D khaseemvali
