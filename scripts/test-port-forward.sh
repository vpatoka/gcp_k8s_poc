#!/bin/sh

kubectl port-forward svc/my-web-app-app-service -n default 8080:80 --address 10.10.10.9
