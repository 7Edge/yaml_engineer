#!/bin/sh
# 创建一个自签名证书, 用户ingress-nginx controller的ingress annotions中指定的secret。且证书名和key名都是tls。
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=test01.nginx.zjqi.top"