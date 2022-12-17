set(src
  docker_system.c
  docker_system_config.c)

FLB_PLUGIN(in_docker_system "${src}" "")
