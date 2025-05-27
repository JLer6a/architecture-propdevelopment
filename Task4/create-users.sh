# Создание пары ключей и сертификатов для пользователя admin-user
openssl genrsa -out admin.key 2048
openssl req -new -key admin.key -out admin.csr -subj "/CN=admin-user/O=admins"
openssl x509 -req -in admin.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out admin.crt -days 365 # УКАЗАТЬ ТОЧНУЮ ПАПКУ НА ПК

# Создание user context в kubeconfig
kubectl config set-credentials admin-user --client-certificate=admin.crt --client-key=admin.key
kubectl config set-context admin-context --cluster=minikube --user=admin-user

kubectl config set-credentials viewer-user --client-certificate=viewer.crt --client-key=viewer.key
kubectl config set-context viewer-context --cluster=minikube --user=viewer-user
