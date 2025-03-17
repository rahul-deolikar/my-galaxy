
---

# **End-to-End CI/CD Pipeline with Jenkins, AWS, Terraform, Docker, and Kubernetes**

## **Project Overview**
This project sets up a **CI/CD pipeline** using Jenkins, Terraform, Docker, and Kubernetes on AWS. The pipeline automates the deployment of a web application with **high availability** and **scalability**.

## **Technologies Used**
- **CI/CD:** Jenkins  
- **Infrastructure as Code:** Terraform  
- **Cloud Provider:** AWS (EC2, VPC, RDS, Route 53, CloudWatch, S3)  
- **Containerization:** Docker  
- **Orchestration:** Kubernetes (EKS or self-hosted)  

---

## **Architecture**
1. **Provision AWS infrastructure using Terraform**  
   - VPC with public and private subnets  
   - EC2 for Jenkins, Kubernetes nodes  
   - RDS (MySQL/PostgreSQL)  
   - S3 for storing artifacts/logs  
   - Route 53 for DNS management  
   - CloudWatch for monitoring  

2. **CI/CD Pipeline using Jenkins**  
   - Automate build, test, and deployment  
   - Dockerize the application and push images to AWS ECR  
   - Deploy the app to Kubernetes  

3. **Monitoring and Logging**  
   - CloudWatch and Prometheus for logging & alerts  

---

## **Prerequisites**
- AWS account  
- Terraform installed (`>=1.0`)  
- Jenkins installed on an EC2 instance  
- Docker and Kubernetes CLI installed  

---

## **Setup and Deployment Steps**

### **Step 1: Provision Infrastructure with Terraform**
Clone the repository and navigate to the `terraform` directory:  
```bash
git clone https://github.com/your-repo.git  
cd terraform  
```
Initialize Terraform and deploy:  
```bash
terraform init  
terraform apply -auto-approve  
```
This will create the required AWS infrastructure.

---

### **Step 2: Install & Configure Jenkins on EC2**
1. SSH into the EC2 instance:
   ```bash
   ssh -i your-key.pem ec2-user@your-ec2-public-ip
   ```
2. Install Jenkins, Docker, and required plugins.
3. Configure credentials for AWS, GitHub, and Docker.

---

### **Step 3: Create Jenkins Pipeline**
1. Open **Jenkins UI** → **New Item** → **Pipeline**  
2. Add a **Pipeline Script** (`Jenkinsfile`):

```groovy
pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'your-ecr-repo'
        KUBE_CONFIG = '/home/jenkins/.kube/config'
    }
    stages {
        stage('Clone Repository') {
            steps { git 'https://github.com/your-repo.git' }
        }
        stage('Build & Test') {
            steps { sh 'mvn clean package' }
        }
        stage('Build Docker Image') {
            steps { sh 'docker build -t $ECR_REPO:$BUILD_NUMBER .' }
        }
        stage('Push to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO
                docker push $ECR_REPO:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy to Kubernetes') {
            steps { sh 'kubectl apply -f k8s/deployment.yaml' }
        }
    }
}
```

---

### **Step 4: Deploy Kubernetes Cluster**
Deploy **EKS Cluster** or manually set up a Kubernetes cluster:
```bash
eksctl create cluster --name my-cluster --region us-east-1
```
Apply Kubernetes manifests:
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

---

### **Step 5: Enable Monitoring and Logging**
- Enable **CloudWatch** for logs and alerts.
- Use **Prometheus** and **Grafana** for monitoring.

---

## **Project Outcome**
- Automated **CI/CD pipeline** for fast and secure deployments.  
- Scalable **Kubernetes-based** architecture on AWS.  
- **Logging and monitoring** for observability.  

---

## **Future Enhancements**
- Implement **Blue-Green Deployments**.  
- Add **Helm Charts** for better Kubernetes management.  

---

## **Author**
**Rahul Deolikar**  
DevOps Engineer | Cloud Enthusiast  

---
