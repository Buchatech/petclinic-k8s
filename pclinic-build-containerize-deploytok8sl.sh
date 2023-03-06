# Original Git Repo for Petclinic: https://github.com/spring-projects/spring-petclinic

### Clone the petclinic from Buchatech repo
git clone https://github.com/Buchatech/petclinic-k8s.git

### Navigate to the petclinic directory
cd spring-petclinic

### Set your DB settings in the application.properties file
# Update the application.properties file with your DB settings i.e.:

#--------------------- DB Connection ------------------
# database=postgres
# spring.datasource.url=jdbc:postgresql://petclinicdb1-1ab.postgres.database.azure.com/petclinic
# spring.datasource.username=dbadms
# spring.datasource.password=--thsdf#rrgt1
# # SQL is written to be idempotent so this is safe
# spring.sql.init.mode=always
# spring.sql.init.schema-locations=classpath*:db/${database}/schema.sql
# spring.sql.init.data-locations=classpath*:db/${database}/data.sql
#--------------------- DB Connection ------------------

# If you need to find your external IP run "curl ifconfig.me" from cmd line.

### Build the app with Maven
./mvnw package

### Run the app locally to test it out
# java -jar target/*.jar

### Build container
docker build -t petclinicapp .

### Run container
# docker run -p8080:8080 petclinicapp

### Log into ACR 
docker login crukjzk8sehiebdpdv2hesi83m.azurecr.io -u crukjzk8sehiebdpdv2hesi83m -p 1234nDAcHsDuIxrX3Uont/ufsVgprtJB

### Tag the docker image with ACR
docker tag petclinicapp crukjzk8sehiebdpdv2hesi83m.azurecr.io/petclinicapp:v0

### Push the image to ACR
docker push crukjzk8sehiebdpdv2hesi83m.azurecr.io/petclinicapp:v0

### Deploy to K8s 

# Connect to your K8s Cluster 
# Ensure your cluster is intergrated with the Container Registry being used.

# If your container register is not intergrated create a K8s secret for connecting to it. 
# kubectl create secret docker-registry cr-cred --namespace petclinic --docker-server=crazk8sehiebdpdv2i7fmty6.azurecr.io --docker-username=crazk8sehiebdpdv2i7fmty6 --docker-password=BWp1nDAvCsDuIxrX3Uont/uogVgprtJB

# And  add to the K8s secret to the k8s deployment file.
# spec:
#   containers:
#   - name: petclinicapp
#     image: crukjzk8sehiebdpdv2hesi83m.azurecr.io/petclinicapp:v0
#     imagePullPolicy: Always
#   imagePullSecrets:
#   - name: cr-cred

# Update the petclinic.yaml file with your Container Registry and image info. 

# For AKS I uploaded the petclinic.yaml file to Azure cloudshell 

# Create namespace for Petclinic app
kubectl create namespace petclinic

# Deploy the petclinic app to K8s
kubectl apply -f petclinic.yaml -n petclinic
