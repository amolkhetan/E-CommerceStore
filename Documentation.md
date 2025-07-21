**Local Set Up**
Created .env files for each backend services and backend. 
Installed dependencies by running **npm install** in root location of each service
Started Services again by running **npm start** in root location of each service

user-services (.env)
<img width="1479" height="173" alt="image" src="https://github.com/user-attachments/assets/7f6704d5-cff1-4801-a41e-b426a5f5b752" />
<img width="940" height="478" alt="image" src="https://github.com/user-attachments/assets/691a596b-6df7-4922-b081-0016d5d75c85" />

product-services (.env)
<img width="1487" height="165" alt="image" src="https://github.com/user-attachments/assets/aabc2c46-9c1a-4ebd-ba88-050e5f98b996" />
<img width="940" height="485" alt="image" src="https://github.com/user-attachments/assets/9edcda94-6c2b-4d4f-8e67-f5205752f6c6" />


cart-services (.env)
<img width="1473" height="153" alt="image" src="https://github.com/user-attachments/assets/f2d1c535-593d-498b-9dbf-e3e56b231be6" />
<img width="940" height="496" alt="image" src="https://github.com/user-attachments/assets/67065418-421b-4452-8c00-d439fda09b75" />

order-services (.env)
<img width="1484" height="166" alt="image" src="https://github.com/user-attachments/assets/84676287-0e54-448e-b116-404dfdf68e49" />
<img width="940" height="487" alt="image" src="https://github.com/user-attachments/assets/1f891396-f523-46e3-8d37-412e0c3b3f93" />

frontend (.env)
<img width="1481" height="213" alt="image" src="https://github.com/user-attachments/assets/955eadc9-60a1-4842-8a09-f8d016f22caf" />
<img width="940" height="485" alt="image" src="https://github.com/user-attachments/assets/c018d2d8-79e1-4e20-b8ac-32fd4c17ac4a" />

**Local Set Up Testing**
<img width="940" height="123" alt="image" src="https://github.com/user-attachments/assets/c0c5de19-b0c5-4592-96cd-bb61e818c092" />

<img width="940" height="87" alt="image" src="https://github.com/user-attachments/assets/7327e348-b984-4405-80cd-13435d30ae97" />

<img width="940" height="93" alt="image" src="https://github.com/user-attachments/assets/a0d944ce-7db3-41a8-8ad2-a36aede839f7" />

<img width="940" height="76" alt="image" src="https://github.com/user-attachments/assets/da606df0-611c-4aa8-b1ec-b5507c426aa6" />

<img width="940" height="496" alt="image" src="https://github.com/user-attachments/assets/33b194c5-a38f-4fb8-9ffe-60b90bb1aa04" />

After Adding user Cart and Orders tabs are also comming
<img width="940" height="438" alt="image" src="https://github.com/user-attachments/assets/3a7b379e-b28f-4c7a-83c5-b644cafa5015" />
<img width="940" height="429" alt="image" src="https://github.com/user-attachments/assets/4d339b07-978a-4959-8462-5a18faaeea96" />
<img width="940" height="468" alt="image" src="https://github.com/user-attachments/assets/3f3eb92a-74a9-4c96-83fb-d4e4a856b5ed" />
<img width="940" height="453" alt="image" src="https://github.com/user-attachments/assets/eb45947d-c98e-4dd6-8fe2-6a67614c11ce" />

**Application Dockerization**
Create Docker file for 4 backend services and 1 for frontend. Refer main branch for Dockerfile. 
Build images and push them. You might need to run docker login before running below command.
Replace servive name and docker username in below command.

- docker build -t <YOUR_DH_USER>/$svc-service:latest .
- docker push <YOUR_DH_USER>/$svc-service:latest
- docker build -t <YOUR_DH_USER>/frontend:latest .
- docker push <YOUR_DH_USER>/frontend:latest

**Kubernetes Deployment**
Create deployment.yaml, service.yaml, configmap.yaml and secrete.yaml for each services. All these Kind types can be mentioned in 1 signle file the way I built.
1 more file for mongo db and 1 yaml file was created to build eks cluster. Refer the main branch's k8s folder for same.
Once created aplly them one by one or all in one go using below command:

kubectl apply -f k8s/mongo.yaml
kubectl apply -f k8s/user-service.yaml
kubectl apply -f k8s/product-service.yaml
kubectl apply -f k8s/cart-service.yaml
kubectl apply -f k8s/order-service.yaml
kubectl apply -f k8s/frontend.yaml

OR

kubectl apply -f k8s/


**On Docker-Desktop K8s Cluster**

<img width="1477" height="223" alt="image" src="https://github.com/user-attachments/assets/179c8ba5-1839-4f2a-ac70-23e1195932f7" />

<img width="1480" height="235" alt="image" src="https://github.com/user-attachments/assets/89f589cb-e912-43fc-9194-3529bc954c7f" />

Now, if external IP not defined then we can use **http://kubernetes.docker.internal:<nodePort>**  to access url

<img width="1913" height="980" alt="image" src="https://github.com/user-attachments/assets/80db1efe-788e-4507-920a-6b0997c18f78" />


**On EKS Cluster**
Create eks cluster using

eksctl create cluster -f eks.yaml
or 
eksctl create cluster --name ecom-store --region us-west-2 --nodegroup-name standard-workers --node-type t3.medium --nodes 2 --nodes-min 1 --nodes-max 3
New EKS is ready

<img width="1446" height="491" alt="image" src="https://github.com/user-attachments/assets/a8fe6379-a811-42d1-9258-3b06bb4765aa" />
<img width="1472" height="271" alt="image" src="https://github.com/user-attachments/assets/36e3a79e-11a4-4b80-a866-e1e83d3214fb" />

Switch to newly created cluster and Deploy all pods
kubectl config use-context amol.khetan@gmail.com@ecom-store.us-west-2.eksctl.io 

<img width="1482" height="440" alt="image" src="https://github.com/user-attachments/assets/afcb54d8-1d85-45c3-9458-e5f23cc635f8" />

<img width="1474" height="79" alt="image" src="https://github.com/user-attachments/assets/c9d61ade-bf35-4720-ac7c-996c3976d2bb" />

<img width="1482" height="433" alt="image" src="https://github.com/user-attachments/assets/7e9f6f92-ec73-4073-aa57-1f85e45144fb" />


Access URL using LB endpoint

<img width="1914" height="821" alt="image" src="https://github.com/user-attachments/assets/44defb5f-d588-4b10-a49f-bda182d803f1" />


**Pipeline**













