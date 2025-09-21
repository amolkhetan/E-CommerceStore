#Docker Part
Docker files are present in respective service folders.

Following command were run to build and push images

docker build -t amolkhetan/user-service:latest .
docker build -t amolkhetan/product-service:latest .
docker build -t amolkhetan/cart-service:latest .
docker build -t amolkhetan/order-service:latest .


docker push amolkhetan/user-service:latest
docker push amolkhetan/product-service:latest
docker push amolkhetan/cart-service:latest
docker push amolkhetan/order-service:latest

#Terraform
Due to limitation on creating a VPC, as discussed and agreed default VPC was used.
Just created security group and EC2 using Terraform to manage/provision infra.

Commands:
Terraform init
Terraform plan
Terraform apply

<img width="1026" height="364" alt="image" src="https://github.com/user-attachments/assets/13ada4d1-cd46-4123-863e-3ce738b855a1" />


Front End UI:
<img width="1915" height="930" alt="image" src="https://github.com/user-attachments/assets/fb31ad27-866d-48cb-87d9-a2e365db11fd" />

Deployment Status:
<img width="1907" height="320" alt="image" src="https://github.com/user-attachments/assets/36509df0-7ddd-4ee0-ba94-c96e4013f263" />

Health Check:
User-Service-
<img width="1125" height="355" alt="image" src="https://github.com/user-attachments/assets/32f6481d-f88e-40b2-855a-f509f8637465" />

product-service-
<img width="1918" height="370" alt="image" src="https://github.com/user-attachments/assets/2a8edb1c-4cc5-43c2-b4ea-8d48e9c0b17c" />

cart-service-
<img width="1902" height="362" alt="image" src="https://github.com/user-attachments/assets/9f0c4849-0650-4793-8bde-4f72aca66ee6" />

order-service
<img width="1915" height="361" alt="image" src="https://github.com/user-attachments/assets/544197ca-9913-4887-abd7-ff09f3233673" />

mongodb
<img width="1918" height="463" alt="image" src="https://github.com/user-attachments/assets/58f8dec9-6b5b-4cab-8b39-47c10af419c9" />

**API Testing:**
<img width="1319" height="296" alt="image" src="https://github.com/user-attachments/assets/6da0325d-bde2-4aa5-b342-93ede665c2b3" />

# Register a new user
<img width="1919" height="160" alt="image" src="https://github.com/user-attachments/assets/aa91b8dc-37ba-458e-ba56-510977caf97f" />

# Get products
<img width="1177" height="160" alt="image" src="https://github.com/user-attachments/assets/07f671ca-2494-46fa-ba07-199617ce9f0f" />






