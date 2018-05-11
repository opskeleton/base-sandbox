require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'json'

set :backend, :ssh

RSpec.configure do |c|
  c.before :suite do
    host = ENV['TARGET_HOST']
    options = Net::SSH::Config.for(host)
    options[:user] = 're-ops'
    set :host, host
    set :sudo_password, 'aL4oosha'
    set :ssh_options,options
  end

end
