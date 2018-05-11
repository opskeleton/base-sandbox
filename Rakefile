require 'rake'
require 'rspec/core/rake_task'

desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'



class ServerspecTask < RSpec::Core::RakeTask
  attr_accessor :target

  # def spec_command
  #   cmd = super
  #   "env TARGET_HOST=#{target} #{cmd}"
  # end
end

namespace :serverspec do
  Dir['manifests/*'].map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |profile|
    ServerspecTask.new(profile.to_sym) do |t|
      t.pattern = "spec/#{profile}/*_spec.rb"
    end
  end
end

task :default => 'serverspec:minimal'
