#!/bin/sh
helm install -n kube-system traefik ./traefik -f ./values-prod.yaml