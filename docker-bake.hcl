variable "RUBY_VERSIONS" {}

target "default" {
  dockerfile = "Dockerfile.test"
  name = "image_optim_rails-test-${replace(ruby_version, ".", "-")}"
  matrix = {
    ruby_version = split(" ", RUBY_VERSIONS)
  }
  args = {
    RUBY_VERSION = ruby_version
  }
  tags = ["image_optim_rails.test:${ruby_version}"]
}
