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

# see https://github.com/rodjek/puppet-lint/issues/331
Rake::Task[:lint].clear

PuppetLint::RakeTask.new :lint do |config|
  config.pattern = 'static-modules/**/*.pp'
  config.ignore_paths = ['modules']
  config.disable_checks = ['80chars']
  config.with_context = true
end


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

  %w(build syncbsd desktop logging zfs langs minimal backup virtualized desktop full).each do |profile|
    ServerspecTask.new(profile.to_sym) do |t|
      t.target = profile 
      t.pattern = "spec/#{profile}/*_spec.rb"
    end
  end
end

task :default => 'serverspec:minimal'

require 'gruff'
require 'json'

PLOTS = 'plots'

namespace :plot do

  directory PLOTS

  task :hosts => [PLOTS] do
    hosts = IO.readlines('benchmark.json').map {|b| 
	JSON.parse(b,{:symbolize_names => true })
    }.group_by {|m|
	m[:host]
    }

    g = Gruff::Line.new
    g.title = 'All Hosts side by side'
    g.labels = Hash[hosts.keys.each_with_index.map {|i,h| [h , i]}]
    g.labels.each_pair {|i, l|
	g.data(l, hosts[l].map {|h| h[:total] })
    }
    g.write("#{PLOTS}/all_hosts.png") 	
  end

  task :per_host => [PLOTS] do
    hosts = IO.readlines('benchmark.json').map {|b| 
	JSON.parse(b,{:symbolize_names => true })
    }.group_by {|m|
	m[:host]
    }

    hosts.each_pair {|h,data|
	g = Gruff::Line.new
	g.title = h
	g.labels = {0 => h}
	g.data(h, data.map {|d| d[:total] })
	g.write("#{PLOTS}/#{h}.png") 	
    }
  end


end
