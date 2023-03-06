# Original Git Repo for Petclinic: https://github.com/spring-projects/spring-petclinic

### Clone the petclinic from Buchatech repo
git clone https://github.com/spring-projects/spring-petclinic.git

### Navigate to the petclinic directory
cd spring-petclinic

### Set your DB settings in the application.properties file
# Update the application.properties file with your DB settings i.e.:

#--------------------- DB Connection ------------------
# database=postgres
# spring.datasource.url=jdbc:postgresql://petclinic-test-3-1-23.postgres.database.azure.com/petclinic
# spring.datasource.username=petclinicdbadm
# spring.datasource.password=Yu#rrfy1
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
docker login crazk8sehiebdpdv2i7fmty6.azurecr.io -u crazk8sehiebdpdv2i7fmty6 -p BWp1nDAvCsDuIxrX3Uont/uogVgprtJB

### Tag the docker image with ACR
docker tag petclinicapp crazk8sehiebdpdv2i7fmty6.azurecr.io/petclinicapp:v0

### Push the image to ACR
docker push crazk8sehiebdpdv2i7fmty6.azurecr.io/petclinicapp:v0

### Deploy to K8s 

# Connect to your K8s Cluster 
# Ensure your cluster is intergrated with the Container Registry being used.

# If your container register is not intergrated create a K8s secret for connecting to it. 
# kubectl create secret docker-registry cr-cred --namespace petclinic --docker-server=crazk8sehiebdpdv2i7fmty6.azurecr.io --docker-username=crazk8sehiebdpdv2i7fmty6 --docker-password=BWp1nDAvCsDuIxrX3Uont/uogVgprtJB

# And  add to the K8s secret to the k8s deployment file.
# spec:
#   containers:
#   - name: petclinicapp
#     image: crazk8sehiebdpdv2i7fmty6.azurecr.io/petclinicapp:v0
#     imagePullPolicy: Always
#   imagePullSecrets:
#   - name: cr-cred

# For AKS I uploaded the petclinic.yaml file to Azure cloudshell 

# Create namespace for Petclinic app
kubectl create namespace petclinic

# Deploy the petclinic app to K8s
kubectl apply -f petclinic.yaml -n petclinic