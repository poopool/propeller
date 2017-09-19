FROM golang:1.8-alpine

ARG artifact_root="."
#Uncomment for local testing
#ARG BB_API_KEY
#ARG BB_BRANCH

COPY $artifact_root/build.sh /build.sh
#Uncomment for local testing
#COPY build.sh /build.sh

COPY $artifact_root/entrypoint.sh /entrypoint.sh
#Uncomment for local testing
#COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /build.sh /entrypoint.sh && /build.sh

WORKDIR /go/src/applariat.io/propeller

ENTRYPOINT ["/entrypoint.sh"]