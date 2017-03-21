#!/bin/bash
aws ecr get-login | sh -
cat > image-pull-secret.yml << EOF
apiVersion: v1    
kind: Secret
metadata:
  name: myregistrykey
data:
  .dockerconfigjson: $(cat ~/.docker/config.json | base64 -w 0)
type: kubernetes.io/dockerconfigjson
EOF
