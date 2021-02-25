#!/bin/sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=who.zjqi.top"

kubectl create secret tls who-tls --cert=tls.crt  --key=tls.key