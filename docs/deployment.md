# docs/deployment.md

## Deployment Procedure

### Prerequisites
- AWS CLI configured
- Terraform installed
- Kubernetes CLI (kubectl)
- Helm
- Ansible

### Step-by-Step Deployment

1. **Infrastructure Provisioning**
   ```bash
   # Navigate to Terraform directory
   cd terraform

   # Initialize Terraform
   terraform init

   # Plan infrastructure
   terraform plan

   # Apply infrastructure
   terraform apply
   ```

2. **Kubernetes Cluster Configuration**
   ```bash
   # Configure kubectl
   aws eks update-kubeconfig --name webscale-eks-cluster

   # Verify cluster
   kubectl cluster-info
   ```

3. **Ansible Configuration**
   ```bash
   # Run Kubernetes configuration playbook
   ansible-playbook -i inventory/hosts playbooks/k8s-config.yml

   # Setup Nginx
   ansible-playbook -i inventory/hosts playbooks/nginx-setup.yml
   ```

4. **Helm Chart Deployment**
   ```bash
   # Add local chart repository
   helm repo add local-charts ./helm/charts

   # Install Nginx chart
   helm install nginx-release local-charts/nginx-chart
   ```

5. **Monitoring Setup**
   ```bash
   # Add monitoring repositories
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo add grafana https://grafana.github.io/helm-charts

   # Install Prometheus and Grafana
   helm install prometheus prometheus-community/prometheus
   helm install grafana grafana/grafana
   ```

### Verification Steps
```bash
# Check deployments
kubectl get deployments

# Check services
kubectl get services

# Check pods
kubectl get pods
```

### Troubleshooting
- Check logs: `kubectl logs <pod-name>`
- Describe resources: `kubectl describe <resource-type> <resource-name>`