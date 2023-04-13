APPNAME=tk-clojure-template
TAG=latest
USERNAME=tk3413
PORT=8083

build:
	lein uberjar

run:
	lein run

utest:
	lein test


docker-build:
	docker buildx build --platform=linux/amd64 -t ${APPNAME}:${TAG} .

docker-build-local:
	docker buildx build -t ${APPNAME}:${TAG} .

docker-run:
	docker run -itd --rm --name ${APPNAME} -p ${PORT}:${PORT} ${APPNAME}:${TAG}

explore:
	docker run -it --rm --name ${APPNAME} -p ${PORT}:${PORT} --entrypoint \
	/bin/sh ${APPNAME}:${TAG}

docker-publish:
	docker tag ${APPNAME}:${TAG} ${USERNAME}/${APPNAME}:${TAG}
	docker push ${USERNAME}/${APPNAME}:${TAG}