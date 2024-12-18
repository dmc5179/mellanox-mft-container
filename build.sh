#!/bin/bash -xe

podman build -t quay.io/danclark/mlx5-tools:latest -f Dockerfile .

podman push quay.io/danclark/mlx5-tools:latest
