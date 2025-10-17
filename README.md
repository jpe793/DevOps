# CI/CD Flask con Docker y Kubernetes (Minikube)

## Estructura
- app/: código Flask (ruta `/` devuelve JSON)
- tests/: pytest básico
- scripts/: test/build/push/deploy
- k8s/: manifests (Deployment 2 réplicas + Service NodePort 30080)
- jenkins/: Jenkinsfile (pipeline: tests → build → push → deploy)
- Dockerfile y docker-compose.yml para desarrollo local

## Comandos clave
- Tests: `bash scripts/test_in_docker.sh`
- Build & push: `docker build -t docker.io/<user>/flask-cicd:dev . && docker push ...`
- Minikube: `minikube start --driver=docker`
- Deploy: `IMAGE=docker.io/<user>/flask-cicd:dev K8S_NAMESPACE=demo bash scripts/deploy_k8s.sh`
- URL: `minikube service flask-service -n demo --url`
