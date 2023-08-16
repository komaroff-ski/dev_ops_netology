## Домашнее задание KUBER-02, С.Г. Комаров

#### Цель задания
Установить кластер K8s.

#### Отчет о выполнении

Установлен k8s кластер в режиме HA в следующей конфигурации:

- 3 мастер-ноды
- 1 воркер-нода (еще две воркер-ноды будут добавлены к следующему занятию, решаю вопрос с ресурсами)

Инфраструктура развернута в локальном облаке (hyper-v)

Установка осуществлялась при помощи Kubespray
В качестве cri выбран containerd
В качестве балансировщика для трафика между мастерами используется nginx, поднятый на воркер-нодах (по одному экземпляру на каждом воркере)
На каждом мастере поднят экземпляр etcd
Так же, на мастер-нодах настроен kubernetes-dashbord

![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/21be012a-ba85-4630-b857-d90803a7bfa6)  

```
root@k8s-m1:~# kubectl get -A all
NAMESPACE     NAME                                              READY   STATUS    RESTARTS   AGE
kube-system   pod/calico-kube-controllers-6dfcdfb99-qv2bp       1/1     Running   0          4h52m
kube-system   pod/calico-node-44b6v                             1/1     Running   0          4h52m
kube-system   pod/calico-node-9st78                             1/1     Running   0          4h52m
kube-system   pod/calico-node-jslq7                             1/1     Running   0          4h52m
kube-system   pod/calico-node-t9b7x                             1/1     Running   0          4h52m
kube-system   pod/coredns-645b46f4b6-7mprx                      1/1     Running   0          4h51m
kube-system   pod/coredns-645b46f4b6-xv65w                      1/1     Running   0          4h51m
kube-system   pod/dns-autoscaler-659b8c48cb-xk7xn               1/1     Running   0          4h51m
kube-system   pod/kube-apiserver-k8s-m1.me                      1/1     Running   0          5h18m
kube-system   pod/kube-apiserver-k8s-m2.me                      1/1     Running   0          5h4m
kube-system   pod/kube-apiserver-k8s-m3.me                      1/1     Running   0          5h3m
kube-system   pod/kube-controller-manager-k8s-m1.me             1/1     Running   0          5h18m
kube-system   pod/kube-controller-manager-k8s-m2.me             1/1     Running   0          5h4m
kube-system   pod/kube-controller-manager-k8s-m3.me             1/1     Running   0          5h3m
kube-system   pod/kube-proxy-8hmzd                              1/1     Running   0          3h42m
kube-system   pod/kube-proxy-gg588                              1/1     Running   0          3h42m
kube-system   pod/kube-proxy-kjwth                              1/1     Running   0          3h42m
kube-system   pod/kube-proxy-zk485                              1/1     Running   0          3h42m
kube-system   pod/kube-scheduler-k8s-m1.me                      1/1     Running   0          5h18m
kube-system   pod/kube-scheduler-k8s-m2.me                      1/1     Running   0          5h4m
kube-system   pod/kube-scheduler-k8s-m3.me                      1/1     Running   0          5h3m
kube-system   pod/kubernetes-dashboard-7bd65c8b9d-5zj5s         1/1     Running   0          3h41m
kube-system   pod/kubernetes-metrics-scraper-7588fd8cb8-6jdjn   1/1     Running   0          3h41m
kube-system   pod/nginx-proxy-k8s-w1.me                         1/1     Running   0          4h52m
kube-system   pod/nodelocaldns-pm7th                            1/1     Running   0          4h51m
kube-system   pod/nodelocaldns-rrlld                            1/1     Running   0          4h51m
kube-system   pod/nodelocaldns-t9hxh                            1/1     Running   0          4h51m
kube-system   pod/nodelocaldns-x5vcd                            1/1     Running   0          4h51m
kube-system   pod/registry-6lmtm                                1/1     Running   0          3h40m

NAMESPACE     NAME                                TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default       service/kubernetes                  ClusterIP   10.233.0.1      <none>        443/TCP                  5h18m
kube-system   service/coredns                     ClusterIP   10.233.0.3      <none>        53/UDP,53/TCP,9153/TCP   4h51m
kube-system   service/dashboard-metrics-scraper   ClusterIP   10.233.8.113    <none>        8000/TCP                 3h41m
kube-system   service/kubernetes-dashboard        NodePort    10.233.20.174   <none>        443:30943/TCP            3h41m
kube-system   service/registry                    ClusterIP   10.233.6.131    <none>        5000/TCP                 3h40m

NAMESPACE     NAME                          DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
kube-system   daemonset.apps/calico-node    4         4         4       4            4           kubernetes.io/os=linux   4h52m
kube-system   daemonset.apps/kube-proxy     4         4         4       4            4           kubernetes.io/os=linux   5h18m
kube-system   daemonset.apps/nodelocaldns   4         4         4       4            4           kubernetes.io/os=linux   4h51m

NAMESPACE     NAME                                         READY   UP-TO-DATE   AVAILABLE   AGE
kube-system   deployment.apps/calico-kube-controllers      1/1     1            1           4h52m
kube-system   deployment.apps/coredns                      2/2     2            2           4h51m
kube-system   deployment.apps/dns-autoscaler               1/1     1            1           4h51m
kube-system   deployment.apps/kubernetes-dashboard         1/1     1            1           3h41m
kube-system   deployment.apps/kubernetes-metrics-scraper   1/1     1            1           3h41m

NAMESPACE     NAME                                                    DESIRED   CURRENT   READY   AGE
kube-system   replicaset.apps/calico-kube-controllers-6dfcdfb99       1         1         1       4h52m
kube-system   replicaset.apps/coredns-645b46f4b6                      2         2         2       4h51m
kube-system   replicaset.apps/dns-autoscaler-659b8c48cb               1         1         1       4h51m
kube-system   replicaset.apps/kubernetes-dashboard-7bd65c8b9d         1         1         1       3h41m
kube-system   replicaset.apps/kubernetes-metrics-scraper-7588fd8cb8   1         1         1       3h41m
kube-system   replicaset.apps/registry                                1         1         1       3h40m
```

![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/7ef66f1d-560c-4eb2-829a-81e6081654af)  

![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/1d87ee1d-4dab-4316-a762-e78cd880bcab)


Конфигурация kubespray: 
