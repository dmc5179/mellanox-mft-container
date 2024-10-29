#!/bin/bash -xe

podman build -t quay.io/danclark/mlx5-tools -f Dockerfile .
