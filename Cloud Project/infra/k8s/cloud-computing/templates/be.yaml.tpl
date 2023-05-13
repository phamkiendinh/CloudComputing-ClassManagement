---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: be
  namespace: cloud-computing-prod
spec:
  selector:
    matchLabels:
      app: be
  replicas: 1
  template:
    metadata:
      labels:
        app: be
    spec:
      containers:
        - image: public.ecr.aws/y4r3b5d9/cloud-computing/be:[[BE_TAG]]
          name: be

          envFrom:
          - configMapRef:
              name: be-secret
          
          ports:
            - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: be
  namespace: cloud-computing-prod
spec:
  ports:
    - port: 8080
      protocol: TCP
  type: ClusterIP
  selector:
    app: be

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: be
  namespace: cloud-computing-prod
  annotations:
    cert-manager.io/cluster-issuer: "cert-manager-global"
    # nginx.ingress.kubernetes.io/configuration-snippet: |
    #   proxy_set_header X-Real-IP $remote_addr;
    #   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    #   proxy_set_header X-Forwarded-Proto $scheme; # Adding this for secure https forward to backend
    #   proxy_set_header Host $http_host;

spec:
  ingressClassName: nginx

  tls:
    - hosts:
        - student-management.be.bug-fix-squad.com
      secretName: cert-manager-private-key
  
  rules:
    - host: student-management.be.bug-fix-squad.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: be
                port:
                  number: 8080
          
