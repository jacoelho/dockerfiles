require "spec_helper"

describe "image memcached" do
  before (:all) do
    @image = Docker::Image.all.detect do |image|
      image.info['RepoTags'].include? ENV['DOCKER_IMAGE']
    end
    set :docker_image, ENV['DOCKER_IMAGE']
  end

  it "should exist" do
    expect(@image).not_to be_nil
  end

  it "expose port 11211" do
    expect(@image.json["Config"]["ExposedPorts"].has_key?("11211/tcp")).to be_truthy
  end

  it "should have environmental varible MEMCACHED_MEMORY" do
    expect(@image.json["Config"]["Env"]).to include("MEMCACHED_MEMORY=64")
  end

  it "should have cmd /run.sh" do
    puts @image.json["Config"]["Cmd"]
    expect(@image.json["Config"]["Cmd"]).to include("/run.sh")
  end

  describe selinux do
    it { should be_disabled }
  end

  describe package('memcached') do
    it { should be_installed }
  end

  describe file('/run.sh') do
      it { should be_owned_by 'root' }
      it { should be_executable }
  end
end
