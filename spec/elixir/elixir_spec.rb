require "spec_helper"

describe "image elixir" do
  before (:all) do
    @image = Docker::Image.all.detect do |image|
      image.info['RepoTags'].include? ENV['DOCKER_IMAGE']
    end
    set :docker_image, ENV['DOCKER_IMAGE']
  end

  it "should exist" do
    expect(@image).not_to be_nil
  end

  describe package('erlang-base') do
    it { should be_installed }
  end

  describe command('erl -version') do
    its(:stderr) { should match /Erlang/ }
  end

  describe package('elixir') do
    it { should be_installed }
  end

  describe command('elixir -v') do
    its(:stdout) { should match /Elixir/ }
  end

  describe command('mix -v') do
    its(:stdout) { should match /Mix/ }
  end

  describe package('nodejs') do
    it { should be_installed }
  end

end
