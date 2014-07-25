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

  %w(langs minimal backup virtualized desktop full).each do |profile|
    ServerspecTask.new(profile.to_sym) do |t|
	t.target = profile 
	t.pattern = "spec/#{profile}/*_spec.rb"
    end
  end
end

task :default => 'serverspec:minimal'


