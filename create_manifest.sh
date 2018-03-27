set -e

DOWNLOAD_URL=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/prometheus/${IMAGE}/releases/latest | grep "browser_download_url" | grep "linux-${ARCH}" | cut -d\" -f4)'
VERSION=v$(echo ${DOWNLOAD_URL}|sed 's/.*\/v\([0-9.]*\)\/.*/\1/')
docker login -u="$DOCKER_USER" -p="$DOCKER_PASS"
echo "Downloading manifest-tool"
wget https://github.com/estesp/manifest-tool/releases/download/v0.7.0/manifest-tool-linux-amd64
mv manifest-tool-linux-amd64 manifest-tool
chmod +x manifest-tool
./manifest-tool --version
echo "Pushing manifest ${REGISTRY}/${IMAGE}:latest"
./manifest-tool push from-args --platforms linux/arm,linux/arm64 --template "${REGISTRY}/${IMAGE}:${VERSION}-ARCH" --target "${REGISTRY}/${IMAGE}:latest"
./manifest-tool push from-args --platforms linux/arm,linux/arm64 --template "${REGISTRY}/${IMAGE}:${VERSION}-ARCH" --target "${REGISTRY}/${IMAGE}:${VERSION}"
