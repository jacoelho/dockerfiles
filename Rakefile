require 'bundler/setup'
require 'date'
require 'rake'
require 'rspec/core/rake_task'

repository = "jacoelho"

namespace :docker do
  desc "build image"
  task :build, :image_name do |task, args|
    sh("cd dockerfiles/#{args.image_name}/ && docker build -t #{repository}/#{args.image_name} .")
  end

  desc "push image"
  task :push, :image_name do |task, args|
    sh("docker tag -f #{repository}/#{args.image_name} #{repository}/#{args.image_name}:#{DateTime.now.strftime('%Y-%m-%d-%H%M')}")
    sh("docker push #{repository}/#{args.image_name}")
  end

end

namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end
  task :all => targets

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['DOCKER_IMAGE'] = "#{repository}/#{target}:latest"
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end
