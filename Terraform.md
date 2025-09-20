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
Terraform init
Terraform plan
Terraform apply

<img width="1091" height="328" alt="image" src="https://github.com/user-attachments/assets/8e671488-79da-474c-bfd3-5c89d6c8ef33" />

Front End UI:
<img width="1901" height="841" alt="image" src="https://github.com/user-attachments/assets/b329a6cc-eac0-4ab6-957b-0f577377e618" />

