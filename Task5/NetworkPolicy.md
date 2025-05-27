# ������� 5: ���������� �������� ����� ������ (NetworkPolicy)

## ������� ������� � ���������� CNI (Calico)
- minikube delete
- minikube start --cni=calico --network-plugin=cni --wait=all

## ������� 4 ���� � ������� � ���������
- kubectl run front-end-app --image=nginx --labels=role=front-end --expose --port=80
- kubectl run back-end-api-app --image=nginx --labels=role=back-end-api --expose --port=80
- kubectl run admin-front-end-app --image=nginx --labels=role=admin-front-end --expose --port=80
- kubectl run admin-back-end-api-app --image=nginx --labels=role=admin-back-end-api --expose --port=80
![pods.jpg](pods.jpg)

##  �������� ���������� ��� �������� ����� ������� �������
![no rules.jpg](no rules.jpg)
- ������������� admin-context

##  ��������� ������� �������� ( non-admin-api-allow.yaml )
- kubectl apply -f non-admin-api-allow.yaml

##  �������� ���������� ����� � ��� �� front-end
kubectl run test-frontend --rm -i -t --labels=role=front-end --image=alpine -- sh
- wget -qO- --timeout=2 http://back-end-api-app # ? ������ ��������
- wget -qO- --timeout=2 http://admin-back-end-api-app # ? �� ������ ��������

##  �������� ���������� ����� � ��� �� admin-front-end:
kubectl run test-admin --rm -i -t --labels=role=admin-front-end --image=alpine -- sh
- wget -qO- --timeout=2 http://back-end-api-app # ? �� ������ ��������
- wget -qO- --timeout=2 http://admin-back-end-api-app # ? ������ ��������

![test.jpg](test.jpg)

