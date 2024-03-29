#!/bin/sh

set -e
cd $(dirname $0)/..

docker run --rm \
      -v /var/run/docker.sock:/var/run/docker.sock:ro \
      -v $(pwd)/code/build:/my_plugin \
      fluent/fluent-bit:1.8.11 /fluent-bit/bin/fluent-bit -e /my_plugin/flb-in_docker_system.so -i docker_system -o stdout