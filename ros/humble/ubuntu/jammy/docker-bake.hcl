variable "IMAGE_NAME" {
  default =  "ros"
}

variable "CONTAINER_REGISTRY" {
  default = "docker.io/polymathrobotics"
}

# There's no darwin-based Docker, so if we're running on macOS, change the platform to linux
variable "LOCAL_PLATFORM" {
  default = regex_replace("${BAKE_LOCAL_PLATFORM}", "^(darwin)", "linux")
}

variable "ROS_PACKAGE" {
  default = ["ros-core", "ros-base", "perception", "simulation", "desktop", "desktop-full"]
}

target "_common" {
  dockerfile = "Containerfile"
  labels = {
    "org.opencontainers.image.source" = "https://github.com/polymathrobotics/oci"
    "org.opencontainers.image.licenses" = "Apache-2.0"
    "org.opencontainers.image.description" = "The Robot Operating System (ROS) is an open source project for building robot applications."
    "org.opencontainers.image.title" = "${IMAGE_NAME}"
  }
}

target "local" {
  inherits = ["_common"]
  name = "local-${ros_package}"
  target = ros_package
  matrix = {
    ros_package = ROS_PACKAGE
  }
  tags = [
    "${CONTAINER_REGISTRY}/${IMAGE_NAME}:humble-${ros_package}-jammy"
  ]
  platforms = ["${LOCAL_PLATFORM}"]
}

target "default" {
  inherits = ["_common"]
  name = "default-${ros_package}"
  target = ros_package
  matrix = {
    ros_package = ROS_PACKAGE
  }
  tags = [
    "${CONTAINER_REGISTRY}/${IMAGE_NAME}:humble-${ros_package}-jammy"
  ]
  platforms = ["linux/amd64", "linux/arm64/v8"]
}
