#!/usr/bin/env bash
if ! git diff --cached --exit-code; then
    echo -e "\nThere are some uncommitted files, exiting..."
    exit 1
fi

tag=$(git describe --tags)
repo=registry.eu-central-1.aliyuncs.com/gardener-de/csi-plugin-alicloud:$tag
echo will build docker $repo
docker build -t $repo . -f aliyun-dockerfile
sh_repo=registry.cn-shanghai.aliyuncs.com/gardener-de/csi-plugin-alicloud:$tag
echo will tag $sh_repo
docker tag $repo $sh_repo