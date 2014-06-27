require 'rake'
require 'rspec/core/rake_task'

task :modspec do
    FileList["static-modules/**/Rakefile"].each do |project|
        Rake::Task.clear
        load project
        dir = project.pathmap("%d")
        Dir.chdir(dir) do
          spec_task = Rake::Task[:spec]
          spec_task.invoke()
        end
    end
end

require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.ignore_paths =['modules/**/*', 'vendor/**/*']
PuppetLint.configuration.send("disable_80chars")


desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'

class ServerspecTask < RSpec::Core::RakeTask

  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end

end

namespace :serverspec do

  ServerspecTask.new(:minimal) do |t|
    t.target = 'minimal'
    t.pattern = 'spec/minimal/*_spec.rb'
  end

  ServerspecTask.new(:backup) do |t|
    t.target = 'backup'
    t.pattern = 'spec/backup/*_spec.rb'
  end

  ServerspecTask.new(:desktop) do |t|
    t.target = 'desktop'
    t.pattern = 'spec/desktop/*_spec.rb'
  end

  ServerspecTask.new(:full) do |t|
    t.target = 'full'
    t.pattern = 'spec/full/*_spec.rb'
  end
end

task :default => 'serverspec:minimal'


