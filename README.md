#  Terraform AWS Project

This repository contains Terraform configuration files to create and manage AWS infrastructure using **Infrastructure as Code (IaC)**.  
Follow the steps below to set up Terraform, configure AWS credentials, and deploy your resources.

---

##  Prerequisites

### 1️⃣ Create an AWS IAM User
1. Log in to your AWS Management Console.
2. Navigate to **IAM → Users → Create User**.
3. In Security Credentials Select:
   - * Create Access key*
4. Attach permissions (for example):
   - `AmazonEC2FullAccess`
   - `AmazonVPCFullAccess`
   - `AmazonS3FullAccess`
5. Download your **Access Key ID** and **Secret Access Key** — you’ll need them soon.

---

### 2️⃣ Configure AWS CLI

Install and configure the AWS CLI to allow Terraform to authenticate.

```bash
# Install AWS CLI (Windows)
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

# Verify installation
aws --version

# Configure AWS credentials
aws configure

You’ll be prompted to enter:

AWS Access Key ID [None]: <Your Access Key>
AWS Secret Access Key [None]: <Your Secret Key>
Default region name [None]: us-east-1
Default output format [None]: json

### Create public and private key for instance using:-
    -> ssh-keygen 

### 3️⃣ Install Terraform from HashiCorp Documentation

⚙️ Initialize and Deploy Terraform

Run these commands inside your project directory (where your .tf files are located):

# Step 1: Initialize Terraform
terraform init

# Step 2: Validate the configuration
terraform validate
Ensures your Terraform syntax and structure are correct

# Step 3: See what will be created
terraform plan
Displays an execution plan showing resources that will be added, changed, or destroyed.

# Step 4: Apply the configuration
terraform apply
Type yes when prompted to confirm resource creation on AWS.

# Step 5: Check the current state
terraform show
Displays all created resources and their current state.

# Step 6: Destroy all resources when done
terraform destroy
Safely deletes all AWS resources created by this configuration.

