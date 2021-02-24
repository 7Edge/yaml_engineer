#!/bin/sh
# 创建一个tls类型的secret，从当前目录中的tls.key 和tls.crt
kubectl create secret tls ingress-nginx-test01 --cert=tls.crt  --key=tls.key