## Use:
https://raw.githubusercontent.com/niklaushirt/drupaldemo/master/helm/charts/repo/stable/

docker.io/bitnami/drupal:8.6.1-debian-9
docker.io/bitnami/mariadb:10.1.36-debian-9

for repository URL


curl -sL https://ibm.biz/idt-installer | bash
ibmcloud login -a https://api.eu-de.bluemix.net -sso
ibmcloud cs region-set eu-central
ibmcloud cs cluster-config mycluster
kubectl get nodes


helm init --service-account tiller

 helm repo add ibm https://registry.bluemix.net/helm/ibm
 helm repo add ibm-charts https://registry.bluemix.net/helm/ibm-charts

helm repo add demo https://raw.githubusercontent.com/niklaushirt/drupaldemo/master/helm/charts/repo/stable/


helm install --name drupal --namespace demo --version 3.1.2 demo/drupal-demo

kubectl get pods --namespace demo
helm delete --purge drupal
