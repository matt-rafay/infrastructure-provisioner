#!/bin/bash

# set variables
repo=${GITHUB_REPO##*/}
resources=()

# configure git message
if [ -n "$(cat deployment.yaml | grep compute.v1.network)" ]; then
  resources+=("VPC Network")
fi

if [ -n "$(cat deployment.yaml | grep compute.v1.router)" ]; then
  resources+=("Cloud Router")
fi

if [ -n "$(cat deployment.yaml | grep container.v1.cluster)" ]; then
  resources+=("GKE Cluster")
fi

if [ ${#resources[@]} -eq 3 ]; then
  message="${ACTION^} ${resources[0]}, ${resources[1]}, and ${resources[2]}"
elif [ ${#resources[@]} -eq 2 ]; then
  message="${ACTION^} ${resources[0]} and ${resources[1]}"
else
  message="${ACTION^} ${resources[0]}"
fi

# clone git repo
git config --global user.email "${GITHUB_EMAIL}"
git config --global user.name "${GITHUB_USERNAME}"
git clone "https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git"

# commit action
if [ "${ACTION}" == "provision" ]; then
  mkdir -p ${repo}/projects/${PROJECT}/${CLUSTER_NAME}
  mv *.yaml ${repo}/projects/${PROJECT}/${CLUSTER_NAME}
  cd ${repo}
  git add projects/${PROJECT}/${CLUSTER_NAME}
else
  cd ${repo}
  git rm -rf projects/${PROJECT}/${CLUSTER_NAME}
fi

git commit -m "${message}"
git push origin master