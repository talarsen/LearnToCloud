
# 🚀 Terraform and Infrastructure as Code (IaC) Basics

---

## ❓ What is Infrastructure as Code?

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure through code instead of manual processes.  
This makes infrastructure easy to version, reuse, and automate.

**Example:**  
Instead of manually clicking in the AWS console 🖱️ to create a server, you write code 🧑‍💻 that describes the server and run it to automatically create the server.  

## ❓ What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp.  
It lets you define and manage infrastructure using configuration files and safely apply changes.

**Example providers:**  
- AWS  
- Azure  
- Google Cloud 

---

## ❓ Why use Terraform?

Terraform helps automate infrastructure deployment and makes it repeatable, safe, and version-controlled.

**Benefits:**
- Platform agnostic → works with many cloud providers  
- Declarative syntax → define *what* you want  
- Versionable → track changes in Git  
- Automatable → reduce human errors

**Example:**  
Define server infrastructure in code, share it with your team, and easily recreate the same setup anytime.

## ❓ What does `terraform init` do?

`terraform init` initializes your Terraform working directory and prepares it for use.

**What it does:**
- Downloads necessary provider plugins 📥  
- Configures backend (if needed)  
- Prepares the environment to run plans and apply changes

## ❓ What does `terraform apply` do?

`terraform apply` executes the Terraform plan and makes real changes to your infrastructure.

**What it does:**
- Reads configuration and generates a plan  
- Shows what will change  
- Prompts for approval  
- Provisions or updates the infrastructure

You approve with `yes` → Terraform makes the changes.

---
