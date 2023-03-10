#!/bin/sh
# Kube Admin Reset

# Remove all packages related to Kubernetes
sudo kubeadm reset -f
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*   
sudo apt-get autoremove  
sudo rm -rf ~/.kube
sudo rm -rf /etc/cni /etc/kubernetes /var/lib/dockershim /var/lib/etcd /var/lib/cni/ /var/lib/kubelet /var/run/kubernetes ~/.kube/*
sudo systemctl daemon-reload

# Clear IP Tables
iptables -F && iptables -X
iptables -t nat -F && iptables -t nat -X
iptables -t raw -F && iptables -t raw -X
iptables -t mangle -F && iptables -t mangle -X

sudo reboot -f now