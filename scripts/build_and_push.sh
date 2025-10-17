set -euo pipefail
REGISTRY=${REGISTRY:-docker.io}
IMAGE_USER=${IMAGE_USER:-tu_usuario}
IMAGE_NAME=${IMAGE_NAME:-flask-cicd}
TAG=${TAG:-dev}
echo "Building ${REGISTRY}/${IMAGE_USER}/${IMAGE_NAME}:${TAG}"
docker build -t ${REGISTRY}/${IMAGE_USER}/${IMAGE_NAME}:${TAG} .
echo "Login & push"
docker login ${REGISTRY}
docker push ${REGISTRY}/${IMAGE_USER}/${IMAGE_NAME}:${TAG}
