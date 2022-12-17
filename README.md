# Description

[Fluent Bit](https://fluentbit.io) input plugin able to access [Docker SystemInfo](https://docs.docker.com/engine/api/v1.41/#tag/System/operation/SystemInfo)

# Requirements

- Docker
- Docker image `fluent-beats/fluent-bit-plugin-dev`

# Build
```bash
./build.sh
```

# Test
```bash
./test.sh
 ```

# Design

## Required volumes

This plugin requires some volumes to collect metrics from Docker `host node`.

It maps the **host unix socket** `/var/run/docker.sock`, so it can send requests to the Docker Engine API.

> This plugin WILL NOT WORK without the volume properly mounted on `Fluentbit` container

## Collecting data
The plugin will access the Docker Engine endpoint `/info`.

Each response will include important information like:

 - Containers (running, paused, stoped)
 - Available Docker plugins
 - Available Docker registries
 - Swarm properties

## Configurations

This input plugin can be configured using the following parameters:

| Key  | Description | Default |
| ---- | ----------- | ------ |
| Collect_Interval | Interval in seconds to collect data | 10 |
| Unix_Path | Define target Unix socket path. | /var/run/docker.sock
| Buffer_Size | The size of the buffer used to read data (in bytes or [unit sized](https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/unit-sizes))  | 8192 |
| Parser | Specify the name of a parser to interpret the entry as a structured message. | None |
| Key | When a message is unstructured (no parser applied), it's appended as a string under the key name message. | message |

