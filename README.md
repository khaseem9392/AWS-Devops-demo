
# AWS DevOps Engineer Demo

## Architecture Diagram
See architecture.drawio.png

## Tech Stack
- Terraform
- GitHub Actions
- Docker
- CloudWatch

## Deployment
1. terraform init
2. terraform apply
3. Build and push sample-app Docker image
4. Test the deployed app

## Monitoring
Logs available in CloudWatch under "/aws/sample-app"
