#! /bin/bash

#Log everything in /code/build.log
#logfile=/tmp/build.log
#exec > $logfile 2>&1
#set -x

#Mapping build ARGs
BB_BRANCH=${BB_BRANCH}
BB_API_KEY=${BB_API_KEY}

echo "BB_API_KEY= $BB_API_KEY"
echo "BB_BRANCH= $BB_BRANCH"

#Installing some tools
apt update && apt install -y wget bsdtar openssl

#Pulling apl-api repo
wget https://applariat:$BB_API_KEY@bitbucket.org/applariat/propeller/get/$BB_BRANCH.zip

mkdir -p /go/src/applariat.io/propeller
bsdtar -xf $BB_BRANCH.zip -s'|[^/]*/||' -C /go/src/applariat.io/propeller
cd /go/src/applariat.io/propeller
ls -alh

go version
CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-w -s'