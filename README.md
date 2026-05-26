# DefensePoint Cloud Engineer Assessment

This project automates the provisioning of AWS infrastructure using Terraform and configures a Keycloak instance via Docker Compose using Ansible.

## 🚀 Provisioning & Configuration

### 1. Infrastructure (Terraform)
Provision the EC2 instance (Ubuntu) and Security Groups.

```bash
cd terraform
terraform init
terraform apply -var="key_name=your_aws_ssh_key"
```
> [!NOTE] 
> The `instance_public_ip` generated in the terminal output.

### 2. Configuration (Ansible)
Update the `ansible/inventory.ini` file with the generated public IP.

Execute the configuration playbook:

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yaml --ask-vault-pass
```

### ✅ Proof of Execution

![Keycloak working!](/img/keycloak.png)

### 🧠 Assumptions & Challenges

- Free Tier Constraints: Opted for a t3.micro instance. To ensure stability within the 1GB RAM limit, Keycloak and PostgreSQL were deployed in a shared Docker network using resource-conscious defaults.

- Security: Sensitive data (Database and Keycloak Admin passwords) were strictly managed and encrypted using ansible-vault, avoiding plain-text exposure in the repository.

- Networking: The AWS Security Group was explicitly configured to allow ingress on ports 22 (SSH), 8080 (Keycloak HTTP), and 443 (HTTPS) as requested.