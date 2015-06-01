require "rubygems"
require "bundler/setup"

require "serverspec"
require "docker"

set :backend, :docker
set :docker_url, ENV["DOCKER_HOST"]

Excon.defaults[:ssl_verify_peer] = false

if ENV['CIRCLECI']
  class Docker::Container
    def remove(options={})
      # do not delete container
    end
    alias_method :delete, :remove
  end
end
