# 🏗️ Terraform AWS Web Sport Rental System

โปรเจกต์นี้ใช้ **Terraform** สำหรับสร้าง Infrastructure บน AWS เพื่อ deploy ระบบ **Sports Rental Web Application** แบบอัตโนมัติ

---

## 📦 โครงสร้างโปรเจกต์
```hcl
.
├── main.tf
├── variables.tf
├── terraform.tfvars
└── outputs.tf
```

---

## ขั้นตอนการใช้งาน

### Clone โปรเจกต์
```bash
git clone https://github.com/ppimchacc/web_sport_customer.git
cd web_sport_customer
```
---

### 1. ติดตั้งเครื่องมือ
- Terraform
- AWS CLI
- ตรวจสอบ:

```bash
terraform -v
aws --version
```
---

### 2. Login เข้า AWS CLI
```bash
aws configure
```

กรอกข้อมูล:
```text
AWS Access Key ID: ********
AWS Secret Access Key: ********
Default region: ap-southeast-1
```

---

### 3. สร้าง Key Pair ใน AWS
- ไปที่: EC2 → Key Pairs → Create Key Pair
- ตั้งชื่อให้ตรงกับ: key_name = "my-terraform-key"

---

### 4. แก้ไขค่าใน terraform.tfvars
```hcl
aws_region    = "ap-southeast-1"
instance_type = "t3.micro"
key_name      = "my-terraform-key"
```
---

### 5. ทำการ deploy ระบบ
```bash
terraform init
terraform plan
terraform apply
```
พิมพ์:
```text
yes
```

---

### 6. การเข้าใช้งาน
- หลังจาก deploy สำเร็จ จะได้ URL:
- Customer:
```text
  http://<PUBLIC_IP>/customer/frontend/login.html
```
- Staff:
```text
  http://<PUBLIC_IP>/staff/frontend/login.html
```

---

### 7. การทดลองใช้งานระบบ
- สำหรับ สาขามหาวิทยาลัยนเรศวร
- Customer  
  - Email: `pimchanokc66@nu.ac.th`  
  - Password: `332021`

- Staff  
  - Email: `rattana@nu.ac.th`  
  - Password: `rattana_jaidee`

