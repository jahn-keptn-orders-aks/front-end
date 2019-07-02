#!/bin/bash

export GITHUB_ACCOUNT=$1
export VERSION_TAG=$2
export IMAGE=$GITHUB_ACCOUNT/keptn-orders-front-end:$VERSION_TAG

clear
if [ $# -lt 2 ]
then
  echo "missing arguments. Expect ./quickbuild.sh <registry> <tag>"
  exit 1
fi

docker build -t $IMAGE .

echo ""
echo "Ready to push to? $IMAGE"
read -rsp "Press ctrl-c to abort. Press any key to continue"

docker push $IMAGE

