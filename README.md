
# 🌍 Terraform AWS Infrastructure Projects

This repository contains various Terraform projects demonstrating core and advanced Terraform concepts on AWS. These projects are practical, real-world implementations covering EC2 provisioning, automation, reusable modules, and environment-based infrastructure.

---

## 🧠 Skills & Concepts Covered

✅ Terraform CLI Commands (`init`, `plan`, `apply`, `destroy`)  
✅ `variable.tf` for dynamic inputs  
✅ `output.tf` for exposing resource details  
✅ Provisioning EC2 Instances (basic & advanced)  
✅ Installing Nginx on EC2 via `user_data` scripts  
✅ Creating multiple instances using `count` and `for_each`  
✅ Using `locals`, `conditions`, and `interpolation`  
✅ Working with AWS VPC, Subnets, Security Groups  
✅ Creating reusable and custom Terraform Modules  
✅ Deploying infrastructure in different environments (dev, prod, staging)  
✅ Clean, production-level folder structure

---

## 🗂️ Project Structure

```
14)Terraform/
├── Terraform OS/                     # Basic EC2, nginx, automation
│   ├── ec2.tf
│   ├── variable.tf
│   ├── output.tf
│   └── nginx.sh
│
├── terraform-app-module/            # Custom modules + environments
│   ├── dev/
│   │   └── main.tf
│   ├── prod/
│   │   └── main.tf
│   ├── modules/
│   │   └── ec2/
│   │       ├── main.tf
│   │       ├── variable.tf
│   │       └── output.tf
│   └── backend.tf                   # For remote backend (optional)
│
└── README.md
```

---

## 📁 Folder Details

### `Terraform OS/`  
Basic automation using Terraform:  
- Launch EC2  
- Attach KeyPair  
- Security Groups for SSH & HTTP  
- Install Nginx via shell script  
- Auto-create a sample web page

### `terraform-app-module/`  
Advanced Terraform usage with:  
- Custom EC2 module  
- Environment-specific configuration (dev, prod)  
- Reusable code for any environment  
- Auto-scaling via `count`  
- Dynamic AMI, instance types, tags, etc.

---

## 🚀 How to Use

### 1️⃣ Initialize Terraform
```bash
terraform init
```

### 2️⃣ Validate & Plan
```bash
terraform validate
terraform plan
```

### 3️⃣ Apply Changes
```bash
terraform apply
```

### 4️⃣ Destroy Infrastructure
```bash
terraform destroy
```

---

## 🔐 Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed (`v1.5+ recommended`)
- SSH KeyPair for EC2 access
- Valid IAM user with `EC2`, `VPC`, and `S3` permissions

---

## 📸 Screenshots

- ✅ Nginx auto-installed
- ✅ EC2 tags visible
- ✅ Web page served on public IP
- ✅ `terraform plan` and `apply` logs

---

## 🏁 Next Projects (Ideas)

- [ ] EKS cluster setup with Terraform
- [ ] CI/CD using CodePipeline + GitHub + Terraform
- [ ] Full monitoring with CloudWatch & alarms
- [ ] Infrastructure state management with S3 + DynamoDB

---

## 📬 Contact

📧 [Zaheer Mulani](mailto:zaheermulani.dev@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/zaheermulani)  

---

## 🏷️ Tags

`Terraform` `AWS` `DevOps` `EC2` `Automation` `Modules` `Nginx` `Infrastructure as Code` `Cloud`
