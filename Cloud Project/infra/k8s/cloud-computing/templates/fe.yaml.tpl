---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fe
  namespace: cloud-computing-prod
spec:
  selector:
    matchLabels:
      app: fe
  replicas: 1
  template:
    metadata:
      labels:
        app: fe
    spec:
      containers:
        - image: public.ecr.aws/y4r3b5d9/cloud-computing/fe:[[FE_TAG]]
          name: fe
          envFrom:
          - configMapRef:
              name: fe-secret
          ports:
            - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: fe
  namespace: cloud-computing-prod
spec:
  ports:
    - port: 3000
      protocol: TCP
  type: ClusterIP
  selector:
    app: fe
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: fe
  namespace: cloud-computing-prod
  annotations:
    cert-manager.io/cluster-issuer: "cert-manager-global"
    # nginx.ingress.kubernetes.io/configuration-snippet: |
    #   proxy_set_header Upgrade $http_upgrade;
    #   proxy_set_header Connection 'upgrade';
    #   proxy_set_header Host $host;
    #   proxy_set_header x-forwarded-for $remote_addr;
    #   proxy_set_header X-Forwarded-Proto $scheme;
    #   proxy_cache_bypass $http_upgrade;
spec:
  ingressClassName: nginx

  tls:
    - hosts:
        - student-management.bug-fix-squad.com
      secretName: cert-manager-cp-fe-private-key
  
  rules:
    - host: student-management.bug-fix-squad.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: fe
                port:
                  number: 3000
          
