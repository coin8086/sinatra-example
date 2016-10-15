require_relative 'init'
require 'rake/testtask'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

# Do test task by default
task :default => [:test]

# All files like "xxx_test.rb" under "test" dir are treated as test files.
Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

# A Rails-like interactive console
desc "Enter interactive console"
task "console" do
    system "irb -r irb/completion -r ./lib/console.rb"
end

